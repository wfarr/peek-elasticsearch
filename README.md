# Peek::Elasticsearch

Take a peek into your Elasticsearch indices.

## Installation

Add this line to your application's Gemfile:

    gem 'peek-elasticsearch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-elasticsearch

## Usage

First, make sure somewhere in your app you're defining `$stretch`.
[Stretch](https://github.com/wfarr/stretch) is a simple, bare-bones
Elasticsearch client.

For example:

``` ruby
# config/initializers/elasticsearch.rb
$stretch = Stretch::Client.new :url => 'http://127.0.0.1:9200/'

# config/initializers/peek.rb
Peek.into Peek::Views::Elasticsearch, :index => "myapp-#{Rails.env}"
```
