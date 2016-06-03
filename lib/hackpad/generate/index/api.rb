module Hackpad
  module Generate
    module Index
      class API
        attr_reader :client
        def initialize(site, client_id, secret)
          @client = OAuth::Consumer.new(client_id, secret, site: site)
        end

        def list
          JSON.parse(client.request(:get, '/api/1.0/pads/all').body)
        end

        def get(id)
          client.request(:get, "/api/1.0/pad/#{id}/content/latest.html").body
        end

        def create(body)
          JSON.parse(client.request(:post, '/api/1.0/pad/create', nil, {}, body, {
                                      'Content-Type' => 'text/html'
                                    }).body)
        end

        def update(pid, body)
          JSON.parse(client.request(:post, "/api/1.0/pad/#{pid}/content", nil, {}, body, {
                                      'Content-Type' => 'text/html'
                                    }).body)
        end

      end
    end
  end
end
