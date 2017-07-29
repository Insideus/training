#!/usr/bin/ruby

require 'complex'

# very small real number, consider anything smaller than this to
# be zero
EPSILON = 1e-12

def print_complex(n)
    # break n into real and imaginary parts
    real = n.real
    imag = n.imag

    # convert really small numbers to zero
    real = 0.0 if real.abs < EPSILON
    imag = 0.0 if imag.abs < EPSILON

    # if the imaginary part is zero, print as a real
    if n.imag == 0.0
       return "#{real.round}"
    else
       return "#{Complex(real.round, imag.round)}"
    end
end

def read_file(filename)
   $respuesta=""
   File.foreach(filename).with_index do |line|
         line=line.split(" ")
         array_length= line.length
         if array_length == 3
            a = line[0]

            b = line[1]

            c = line[2]
            ac = Complex(a, 0)
            bc = Complex(b, 0)
            cc = Complex(c, 0)
            dc = (-bc + (((bc**2) - (4*ac*cc))**(1.0/2)))/(2*ac)
            fc = (-bc - (((bc**2) - (4*ac*cc))**(1.0/2)))/(2*ac)
            $respuesta = $respuesta + print_complex(dc)+ " " + print_complex(fc)+ ";"+" "
         end
   end
   return $respuesta
end

puts "Start"

puts read_file("cuadratic.txt")

puts "End"
