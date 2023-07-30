class DatabaseConfigUpdater
  def initialize(app_path:, database:)
    @app_path = app_path
    @database = database
  end

  def call
    config_path = "#{app_path}/config/database.yml"

    case database
    when 'mysql'
      write_content_to_file!(mysql_database_config, config_path)
      update_in_gemfile("gem 'mysql2', '~> 0.5'")
    when 'postgresql'
      write_content_to_file!(postgres_database_config, config_path)
      update_in_gemfile("gem 'pg', '~> 1.1'")
    when 'sqlite'
      true
    else
      raise "Invalid database type: #{database}"
    end
  end

  private

  attr_reader :app_path, :database

  def update_in_gemfile(db_gem)
    gemfile_path = "#{app_path}/Gemfile"
    lines = File.readlines(gemfile_path)

    updated_lines = lines.map do |line|
      if line.strip.start_with?('gem "sqlite3"')
        "#{db_gem}\n"
      else
        line
      end
    end

    write_content_to_file!(updated_lines, gemfile_path)
  end

  def write_content_to_file!(content = "", file_path)
    File.open(file_path, 'w') do |file|
      file.puts(content)
    end
  end

  def postgres_database_config
    <<~CONFIG
      default: &default
        adapter: postgresql
        encoding: unicode
        pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
        username: postgres
        password: postgres

      development:
        <<: *default
        database: base_app_development

      test:
        <<: *default
        database: base_app_test
    CONFIG
  end

  def mysql_database_config
    <<~CONFIG
      default: &default
        adapter: mysql2
        encoding: utf8mb4
        pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
        username: root
        password:
        socket: /tmp/mysql.sock

      development:
        <<: *default
        database: base_app_development
    
      test:
        <<: *default
        database: base_app_test
    CONFIG
  end
end