require 'spec_helper'
require 'benchmark/ips'

describe Benchmark::Ipsm do
  it 'should pass' do

    std, _ = capture_io {
      Benchmark.ipsm do |x|
        x.config(iterations: 1)
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
    }

    puts std
    std.lines[1].must_match(/\d*\.\d* mb memory_cost/)
    std.lines[2].must_match(/0.00 bytes memory_cost/)
  end
end
