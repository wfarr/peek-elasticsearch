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
Peek.into Peek::Views::Elasticsearch
```

This by default will look for the existence of an index named
`#{File.basename(Rails.root.to_s)}-#{Rails.env}` and report some basic stats.

You can also specify a list of indices to peek at with:

``` ruby
Peek.into Peek::Views::Elasticsearch, :index => %w(myapp-stuff myapp-otherstuff)
```

