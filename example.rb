#!/usr/bin/env ruby

require_relative 'spiral_counter'

count = ARGV.shift.to_i
sp = SpiralCounter.new
count.times { sp.increment }
puts sp.to_s
