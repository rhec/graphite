module Graphite
  # Provides access to the render API:
  class Renderer
    def initialize(server_host, params={})
      @default_params = {:format => :png}.merge(params)
      @uri = URI.parse(server_host)
      @uri.path = "/render/" # trailing slash is important
    end
    # get a url with the specified url params
    # required params are:
    # target - name of the metric to fetch
    def get params
      @uri.query = URI.encode_www_form(@default_params.merge(params))
      Net::HTTP.get(@uri)
    end
  end
end