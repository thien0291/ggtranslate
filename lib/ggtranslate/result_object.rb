module Ggtranslate
  class ResultObject
    def initialize(http_response)
      @http_response = http_response
      process_http_response
    end

    def translated_text
      result = nil
      if @response_data.is_a? Hash
        result = @response_data.dig("sentences", 0, "trans")
      elsif @response_data.is_a? Array
        result = @response_data.first
      else
        raise "NO RESUL FOUND"
      end

      result = result.split("----------")
      result.count == 1 ? result.first : result
    end

    def source_language
      @response_data.dig("src")
    end

    def confidence
      @response_data.dig("confidence")
    end

    def is_success?
      @http_response.code == 200
    end

    def as_json
      {
        translated_text: translated_text,
        source_language: source_language,
        confidence: confidence,
        response_data: @response_data,
      }
    end

    def to_json
      as_json.to_json
    end

    private

    def process_http_response
      raise "TRANSLATE_FAILED" unless is_success?
      @response_data = JSON.load(@http_response.body)
    end
  end
end
