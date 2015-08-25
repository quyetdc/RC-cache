class BatchRequests
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == '/batch'
      env["PATH_INFO"] = "/tasks.json"
      env["QUERY_STRING"] = ""
      env["REQUEST_METHOD"] = "GET"
      env["rack.input"] = StringIO.new("")
      @app.call(env)
      # Inspect the environment hash to see what's in it
      # [200, {"Content-Type" => "application/json"}, [env.inspect]]
    else
      @app.call(env)
    end
  end
end