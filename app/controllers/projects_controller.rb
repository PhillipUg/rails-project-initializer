class ProjectsController < ApplicationController
  def new
    @supported_rails_versions = %w[7.0 6.1].freeze
    @supported_ruby_versions = %w[3.2.2 3.1.4 3.0.6 2.7.8].freeze
    @supported_databases = %w[sqlite mysql postgresql].freeze
    @supported_app_types = ::ProjectCreator::APP_TYPES.keys.freeze
    # @supported_js_processors = %w[importmap webpack esbuild rollup].freeze
    # @supported_css_processors = %w[tailwind bootstrap bulma postcss sass].freeze
  end

  def create
    zip_file_path = ::ProjectCreator.new(
      app_type: params[:app_type].presence || 'standard',
      rails_version: params[:rails_version].presence || '7.0',
      ruby_version: params[:ruby_version].presence || '3.2.2',
      database: params[:database].presence || 'sqlite',
    ).call

    send_file zip_file_path, type: 'application/zip', disposition: 'attachment', filename: 'project.zip'
  end

  def download_count
    count = Download.total_count
    render json: { count: count }
  end
end
