module Hackpad
  module Generate
    module Index
      class Runner < Thor
        include Thor::Actions

        default_task :generate_index
        desc 'generate_index', %(Generate index with Hackpad's API)
        method_option :site, desc: 'Hackpad site', required: true
        method_option :client_id, desc: 'Hackpad client id for API', required: true
        method_option :secret, desc: 'Hackpad secret for API', required: true
        method_option :title, desc: 'Title for index pad'
        def generate_index
          Indexer.new(
            API.new(options['site'], options['client_id'], options['secret'])
          ).generate(options['title'])
        end
      end
    end
  end
end
