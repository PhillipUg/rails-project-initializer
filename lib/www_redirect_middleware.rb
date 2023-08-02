class WwwRedirectMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    if request.host == 'railsinit.org'
      [301, { 'Location' => request.url.sub('//railsinit.org', '//www.railsinit.org') }, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end
end
