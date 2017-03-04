# benchmark-ipsm

[![Build Status](https://travis-ci.org/benoittgt/benchmark-ipsm.svg?branch=master)](https://travis-ci.org/benoittgt/benchmark-ipsm)

An iterations per second enhancement to Benchmark that includes memory cost, based on [benchmark-ips](https://github.com/evanphx/benchmark-ips/) and the excellent job of [Dotan](https://github.com/jondot) with [benchmark-ipsa](https://github.com/jondot/benchmark-ipsa). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'benchmark-ipsm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install benchmark-ipsm

## Usage

```ruby
require 'benchmark/ipsm'
Benchmark.ipsm do |x|
  x.report('insert'){
    arr = []
    100_000.times do
      arr << 'Love my memory'
    end
  }
  x.report('nothing'){
    sleep 0.001
  }
end
```

Results:

```
Memory -------------------------------------
              insert 23.55 mb/26.68 mb  mem_before/after    3.12 mb memory_cost
             nothing 26.70 mb/26.70 mb  mem_before/after 0.00 bytes memory_cost
Warming up --------------------------------------
              insert     6.000  i/100ms
             nothing    73.000  i/100ms
Calculating -------------------------------------
              insert     70.970  (± 5.6%) i/s -    354.000
             nothing    762.102  (± 3.5%) i/s -      3.869k
```


You can run the specs in this repo to see it live.

For more, see [benchmark-ips](https://github.com/evanphx/benchmark-ips/)

## Development

Running the specs:

* `git clone`
* `bundle install`
* `bundle exec rake spec`

## Contributing

Fork, implement, add tests, pull request, get my everlasting thanks and a respectable place here :).

## License

(The MIT License)

Copyright (c) 2017 Benoit Tigeot

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
