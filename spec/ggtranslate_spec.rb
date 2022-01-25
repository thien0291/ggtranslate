require "ggtranslate"

describe Ggtranslate::Translator do
  it "translate simple text" do
    result = Ggtranslate.translate("hello", "en", "vi")
    expect(result.translated_text).to eql("xin chào")
    expect(result.source_language).to eql("en")
    expect(result.is_success?).to eql(true)
    expect(result.confidence).to eql(1)
  end

  it "translate multiple sentences" do
    sentences = [
      %q{xin chào mọi người},
      %q{chào buổi sáng},
      %q{chào buổi tối},
    ]
    result = Ggtranslate.translate(sentences, "auto", "en")

    expect(result.translated_text[0]).to eql("hello everyone")
    expect(result.translated_text[1]).to eql("good morning")
    expect(result.translated_text[2]).to eql("good evening")
    expect(result.source_language).to eql("vi")
    expect(result.is_success?).to eql(true)
  end
end
