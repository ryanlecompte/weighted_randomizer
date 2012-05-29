# Weighted Randomizer

Weighted Randomizer is an implementation of weighted randomization in Ruby.
This gem is useful for situations where you have a group of items with
corresponding weights, and you want to randomly select an item with its associated
weight taken into account. Potential uses of this gem could be weighted job
queues or other types of data where weights are potentially important.

## Installation

Add this line to your application's Gemfile:

    gem 'weighted_randomizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weighted_randomizer

## Usage

Using this gem is as simple as the following:

```ruby
  queues = {'queue1' => 25, 'queue2' => 100, 'queue3' => 2}
  randomizer = WeightedRandomizer.new(queues)

  # Fetch a single random item.
  randomizer.sample # => single item

  # Fetch the next 10 weighted random items.
  randomizer.sample(10) # => array of items
```

## License

Please see LICENSE for licensing details.

## Author

Ryan LeCompte

[@ryanlecompte](https://twitter.com/ryanlecompte)

## Acknowledgements

The core of this gem was graciously based on recipe 5.11 from the
[Ruby Cookbook](http://shop.oreilly.com/product/9780596523695.do)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
