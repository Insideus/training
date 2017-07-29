def cesar(string, shift = 1)
  alphabet  = Array('a'..'z')
  non_caps  = Hash[alphabet.zip(alphabet.rotate(shift))]
  alphabet = Array('A'..'Z')
  caps     = Hash[alphabet.zip(alphabet.rotate(shift))]
  encrypter = non_caps.merge(caps)
  string.chars.map { |c| encrypter.fetch(c, c) }
end

def read_file(filename)
  respuesta = [], key = 1
  File.foreach(filename).with_index do |line, number|
    if number < 1
      line = line.split(' ')
      key = line[1]
    else
      respuesta << cesar(line, -key.to_i)
    end
  end
  respuesta
end

puts read_file('cesar.txt').join
