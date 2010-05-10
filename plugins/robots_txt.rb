module Rack
  # Renders a valid robots.txt according to http://www.robotstxt.org
  # This is an example of over-engineering. But it's simple example of
  # how you might test your middleware.
  class RobotsTxt
    def initialize(app)
      @app = app
    end

    def call(env)
      env['PATH_INFO'] == '/robots.txt' ? robots_response : @app.call(env)
    end

    def robots_response
      Rack::Response.new do |res|
        res.header['Content-Type'] = 'text/plain'
        res.write "User-agent: *\nDisallow:\n"
      end.finish
    end
  end
end

# Ex: ruby -rubygems robotstxt.rb
if $0 == __FILE__
  require "test/unit"
  require "rack"
  require "rack/mock"

  class TestMiddleWare < Test::Unit::TestCase
    def test_with_no_options
      app = Rack::Builder.new do
        use Rack::Lint
        use Rack::RobotsTxt
        use Rack::Lint
        run lambda { |env| [200, {'Content-Type' => 'text/plain'}, "Hello, World!"] }
      end

      response = Rack::MockRequest.new(app).get('/')
      assert_equal "Hello, World!", response.body

      response = Rack::MockRequest.new(app).get('/robots.txt')
      assert_equal "User-agent: *\nDisallow:\n", response.body
    end
  end
end
