module Hackpad
  module Generate
    module Index
      class Indexer
        MARK = "This page generate by HACKPAD_GENERATE_INDEXER"
        BORDER = ' * ' * 40
        attr_reader :api
        def initialize(api)
          @api = api
        end

        def generate(title="index Page")
          body = generate_page(title)
          if @index_pad
            puts "Got old index #{@index_pad}, So update it."
            @api.update(@index_pad, body)
          else
            puts "Not index pad can be found, So create one."
            @api.create(body)
          end
          puts "All Done."
        end

        def generate_page(title)
          @result ||= page_metas.map do |meta|
            %(<div>#{to_link(meta)}</div><br/>) unless sub_meta?(meta[:pid])
          end.compact.join("\n")
          %(
<h1>#{title}</h1>


<br/><br/>
<p>#{BORDER}</p>
<p><strong>DO NOT CHANGE ANY CONTENT OF THIS PAGE.</strong></p>
<p><strong>Last update is #{Time.new.to_s}</strong></p>
<p>#{BORDER}</p>
<br/>
<br/>

#{@result}

<br/><br/><br/><br/>
<p>#{BORDER}</p>
<p>END</p>
<p>#{MARK}</p>
<p>Version: #{VERSION}</p>
<p>#{BORDER}</p>
)
        end

        def to_link(meta)
          %(<a href="/#{meta[:pid]}">#{meta[:title]}</a>#{to_sub_links(meta)}) if meta
        end

        def sub_meta?(pid)
          !!page_metas.find { |m|
            m[:link_uris].map { |uri| uri[-11..-1] }.include? pid
          }
        end


        def to_sub_links(meta)
          links = meta[:link_uris].map do |uri|
            matched = page_metas.find { |m| m[:pid] == uri[-11..-1]}
            %(<li>#{to_link(matched)}</li>) if matched
          end.compact
          %(\n<ul>\n#{links.join("\n")}\n</ul>) if links.size > 0
        end

        def page_metas
          @page_metas ||= api.list.map do |pad|
            html_doc = Nokogiri::HTML(api.get(pad))
            # puts html_doc.at_css('h1:first').text
            if html_doc.xpath("//p[text()='#{MARK}']").size > 0
              @index_pad = pad
              next
            end
            {
              pid: pad,
              title: html_doc.at_css('h1:first').text,
              link_uris: (html_doc.css('a') || []).map { |a| a["href"] }
            }
          end.compact
        end
      end
    end
  end
end
