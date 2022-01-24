require "json"
require "rest-client"
require "addressable"
require_relative "./result_object"

module Ggtranslate
  class Translator
    def self.translate(text_query, source_language = "auto", to_language = "en")
      endpoint = "https://clients5.google.com/translate_a/t?"
      # to translate multiple sentences
      text_query = text_query.join("----------") if text_query.is_a? Array

      query_params = {
        client: "dict-chrome-ex", # this is a must
        sl: source_language,
        tl: to_language,
        q: text_query,
      }

      uri = Addressable::URI.new
      uri.query_values = query_params
      response = RestClient.get(endpoint + uri.query, headers = build_headers)
      ResultObject.new(response)
    end

    def self.build_headers
      {

        accept: "*/*",
        "accept-language": "en-US,en;q=0.9,vi;q=0.8",
        "sec-ch-ua": '" Not;A Brand";v="99", "Google Chrome";v="97", "Chromium";v="97"',
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": '"macOS"',
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "none",
        "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36",
      }
    end
  end
end
