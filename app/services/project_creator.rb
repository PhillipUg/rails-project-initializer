class ProjectCreator
  def initialize(app_type:, rails_version:, ruby_version:, database:)
    @app_type = app_type
    @rails_version = rails_version
    @ruby_version = ruby_version
    @database_type = database
  end

  BASE_APPS = {
    '6_minimal' => Rails.root.join('lib', 'templates', '6_minimal').to_s,
    '6_api_only' => Rails.root.join('lib', 'templates', '6_api').to_s,
    '6_standard' => Rails.root.join('lib', 'templates', '6_standard').to_s,
    '7_minimal' => Rails.root.join('lib', 'templates', '7_minimal').to_s,
    '7_api_only' => Rails.root.join('lib', 'templates', '7_api').to_s,
    '7_standard' => Rails.root.join('lib', 'templates', '7_standard').to_s
  }

  APP_TYPES = {
    standard: "Full-featured Standard Rails app.",
    minimal: "Excludes: action_cable, action_mailbox, action_mailer, action_text, active_job, active_storage, bootsnap, jbuilder, spring, system_tests, turbolinks, webpack.",
    api_only: "Excludes: middleware for cookies or sessions, views, helpers or assets, JavaScript/CSS pipeline, CSRF protection.",
  }

  def call
    copy_base_app!

    ::RubyVersionUpdater.new(app_path: new_app_path, version: ruby_version).call

    ::DatabaseConfigUpdater.new(app_path: new_app_path, database: database_type).call

    ::ZipGenerator.new(new_app_path).call
  end

  private

  attr_reader :app_type, :rails_version, :ruby_version, :database_type, :new_app_path

  def copy_base_app!
    major_rails_version = rails_version.split('.').first

    template_name = "#{major_rails_version}_#{app_type}"
    source_app_path = Rails.root.join("lib/templates/#{template_name}").to_s

    @new_app_path = Rails.root.join("copied_apps/#{app_type}_#{rails_version}_#{ruby_version}_#{database_type}_#{SecureRandom.uuid}").to_s
    FileUtils.cp_r(source_app_path, @new_app_path)
  end
end