require 'open-uri'

module Api
  module V1
    class ParsedContentController < JSONAPI::ResourceController
      def create
        params["data"]["attributes"]["data"] = index_site
        super
      end

      private

      def index_site
        tries = 3
        begin
          doc = Timeout::timeout(25) do
            Nokogiri::HTML(open(params["data"]["attributes"]["url"]))
          end
        rescue StandardError => e
          puts "This link has error: "
          raise e
        end
        links = doc.xpath('//a').map {|element| element["href"]}.compact
        h1s = doc.xpath('//h1').map {|a| a.text.squish}
        h2s = doc.xpath('//h2').map {|a| a.text.squish}
        h3s = doc.xpath('//h3').map {|a| a.text.squish}

        {
          "links": links,
          "h1": h1s,
          "h2": h2s,
          "h3": h3s,
        }
      end
    end
  end
end
