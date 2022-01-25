require "ggtranslate/version"
require_relative "ggtranslate/translator"
require_relative "ggtranslate/result_object"
require_relative "ggtranslate/languages"

module Ggtranslate
  autoload :ApiCallException, "ggtranslate/exceptions"
  autoload :ResponseParsingException, "ggtranslate/exceptions"
  autoload :LANGUAGES, "ggtranslate/languages"

  extend Translator

  class << self
  end
end
