def look_say(input, iterations)
  return if iterations <= 0

  output, counter = '', 1
  input.each_char.with_index do |char, i|
    if char == input[i+1]
      counter += 1
    else
      output.concat("#{counter}#{char}")
      counter = 1
    end
  end
  puts output

  look_say(output, iterations - 1)
end

look_say("1", 5)
puts '--------------------'
look_say("321", 5)
