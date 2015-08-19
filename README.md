# Compact Language Detection 2.0

Based on Jason Toy's CLD v1.0.
Blazing-fast language detection for Ruby provided by Google Chrome's Compact Language Detector v2.0

## How to Use

```ruby
CLD2.detect_language("This is a test")
# => {:name => "ENGLISH", :code => "en", :reliable => true}

CLD2.detect_language("plus ça change, plus c'est la même chose")
# => {:name => "FRENCH", :code => "fr", :reliable => true}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_cld2', require 'cld'
```

And then execute:

```sh
$ bundle
```

## Thanks

Thanks to the Chrome authors, and to Mike McCandless for writing a Python version.
Thanks to Jason Toy for the original cld v1.0 ruby port.

Licensed the same as Chrome.
