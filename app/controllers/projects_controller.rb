class ProjectsController < ApplicationController
  before_action :record_page_view

  def new
    @supported_rails_versions = %w[6.1 7.0].freeze
    @supported_ruby_versions = %w[3.2.2 3.1.4 3.0.6 2.7.8].freeze
    @supported_databases = %w[sqlite mysql postgresql].freeze
    @supported_app_types = ::ProjectCreator::APP_TYPES.keys.freeze
    # @supported_js_processors = %w[importmap webpack esbuild rollup].freeze
    # @supported_css_processors = %w[tailwind bootstrap bulma postcss sass].freeze
  end

  def create
    zip_file_path = ::ProjectCreator.new(
      app_type: params[:app_type].presence || 'minimal',
      rails_version: params[:rails_version].presence || '7.0',
      ruby_version: params[:ruby_version].presence || '3.2.2',
      database: params[:database].presence || 'sqlite',
      # css: params[:css].presence || 'sass',
      # js: params[:javascript].presence || 'webpack'
    ).call

    send_file zip_file_path, type: 'application/zip'
  end

  private

  def record_page_view
    ActiveAnalytics.record_request(request)
  end
end
