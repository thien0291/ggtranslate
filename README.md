# 📝 Ggtranslate

Inspired by this [`py-googletrans`](https://github.com/ssut/py-googletrans) [topic](https://github.com/ssut/py-googletrans/issues/268).

**NOTE**: `Ggtranslate` is not official supported by Google and not recommended to use in production.

`Ggtranslate` is a hacked way to use google translate without hassles. You **don't need** to have `API_KEY` to start.

# 📝 Installation

Add this line to your application's Gemfile:

```ruby
gem 'ggtranslate'
```

Or install it yourself as:

    $ gem install ggtranslate

# 📝 Usage

![Quick Example](https://user-images.githubusercontent.com/2922275/150912638-a93699b8-3c37-4aeb-9896-e982b8f21daa.gif)

Start with translate 1 simple sentence from English to Vietnamese

```ruby
require 'ggtranslate'
result = Ggtranslate.translate("hello", "en", "vi")
result.translated_text
# => "xin chào"
```

You can query in bulk to make less api calls.

```ruby
sentences = [
    %q{xin chào mọi người},
    %q{chào buổi sáng},
    %q{chào buổi tối},
]

result = Ggtranslate.translate(sentences, "auto", "en")
result.translated_text

# => ["hello everyone", "good morning", "good evening"]
```

you can use `auto` to let Google Translate auto detect source / dest language

To get all supported languages

```ruby
Ggtranslate::LANGUAGES
```



# 📝 License
The gem is available as open source under the terms of the MIT License.
