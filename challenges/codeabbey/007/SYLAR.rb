#!/usr/bin/ruby

require 'prime'

def read_file(filename)
  respuesta=" "
  File.foreach(filename).with_index do |line|
   line=line.split(" ")
   array_length= line.length
   line.each { |x|
    celsius = x.to_i
    fahrenheit = (celsius.to_i - 32) /1.8
    respuesta = respuesta + " " +fahrenheit.round.to_s
   }
  end
  return respuesta
end

puts "Start"

puts read_file("FahrenheitToCelsius.txt")

puts "End"
