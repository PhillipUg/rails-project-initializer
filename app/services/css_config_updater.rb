class CssConfigUpdater
  def initialize(app_path:, css:)
    @app_path = app_path
    @css_processor = css
  end

  def call
    configure!(css_processor)
  end

  private
  attr_reader :app_path, :css_processor

  def configure!(processor)
    case processor
    when 'bulma'
      setup_bulma
    when 'bootstrap'
      setup_bootstrap
    when 'tailwind'
      setup_tailwind
    when 'sass'
      setup_sass
    when 'postcss'
      setup_postcss
    else
      raise "Invalid CSS option selected"
    end
  end

  def setup_bulma
    #
  end

  def setup_bootstrap
    #
  end

  def setup_tailwind
    #
  end

  def setup_sass
    #
  end

  def setup_postcss
    #
  end

  def write_content_to_file!(content = "", file_path)
    File.open(file_path, 'w') do |file|
      file.puts(content)
    end
  end
end