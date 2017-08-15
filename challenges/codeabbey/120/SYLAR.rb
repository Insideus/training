#!/usr/bin/ruby

l = gets.chomp
n = l.to_i
a1 = gets.chomp
a2 = a1.split(" ")
string=""
a = []
n.times do |j|
 a << a2[j].to_i
end

n = a.size


n.times do |i|
 string = string + " " +(a.index(a.max)).to_s
 a[a.index(a.max)], a[n-1] = a[n-1] , a[a.index(a.max)]
 a.pop
 n = n - 1
end

puts "-------------\n" + string
