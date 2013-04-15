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

``` ruby
Peek.into Peek::Views::Elasticsearch, :index => 'myapp-stuff'
```
