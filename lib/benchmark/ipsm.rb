require "benchmark/ipsm/version"
require 'get_process_mem'
require 'benchmark/ips'

module Benchmark
  module Ipsm
    def ipsm(*args, &block)
      Benchmark.ips(*args){ |x|
        block.call(x)
        memory(x)
      }
    end

    def memory(x)
      puts "Memory -------------------------------------"
      x.list.each do |entry|
        initial_memory_usage = GetProcessMem.new.bytes
        entry.action.call
        after_action_memory_usage = GetProcessMem.new.bytes
        $stdout.print(rjust(entry.label))
        $stdout.printf(" %10s  mem_before/after %10s memory_cost\n",
                       "#{human_size(initial_memory_usage)}/#{human_size(after_action_memory_usage)}",
                       "#{human_size(after_action_memory_usage - initial_memory_usage)}")
      end
    end

    def rjust(label)
      label = label.to_s
      if label.size > 20
        "#{label}\n#{' ' * 20}"
      else
        label.rjust(20)
      end
    end

    def human_size(num, unit='bytes')
      units = %w(bytes kb mb gb)
      if num <= 1024
        "#{"%0.2f"%num} #{unit}"
      else
        human_size(num/1024.0, units[units.index(unit)+1])
      end
    end
  end
  extend Ipsm
end
