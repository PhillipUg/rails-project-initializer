class RubyVersionUpdater
  def initialize(app_path:, version:)
    @app_path = app_path
    @version = version
  end

  def call
    write_content_to_file!(version,"#{app_path}/.ruby-version")
    update_in_gemfile("#{app_path}/Gemfile", version)
  end

  private

  attr_reader :app_path, :version

  def write_content_to_file!(content = "", file_path)
    File.open(file_path, 'w') do |file|
      file.puts(content)
    end
  end

  def update_in_gemfile(file_path, new_version)
    lines = File.readlines(file_path)
    updated_lines = lines.map do |line|
      if line.strip.start_with?('ruby ')
        "ruby \"#{new_version}\"\n"
      else
        line
      end
    end

    write_content_to_file!(updated_lines, file_path)
  end
end