#!/usr/bin/ruby

require 'prime'

def read_file(filename)
  respuesta=" "
  File.foreach(filename).with_index do |line|
   line=line.split(" ")
   array_length= line.length
   if array_length > 1
    line.each { |x|
     primos=Prime.take(x.to_i)
     respuesta = respuesta + " " +primos[primos.length-1].to_s
    }
   end
  end
  return respuesta
end

puts "Start"

puts read_file("primes.txt")

puts "End"
