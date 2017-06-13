# def solution(a,b)
#   !!(a =~ /#{b}/)
# end

# def solution(a,b)
#   return false unless b.is_a?(String)
#   a.include?(b)
# end

def solution(a,b)
  result = false

  a.size.times do |i|
    result = b_in_a_at_index(a,b,i)
    return result if result
  end
  result
end

def b_in_a_at_index(a,b,i)
  result = true
  b.size.times do |j|
    result = a[i+j] == b[j]
    return false unless result
  end
  return result
end

puts "trues"
puts "-> #{solution("abc", "bc")}"
puts "-> #{solution("abc", "")}"
puts "-> #{solution("abc", "c")}"
puts "-> #{solution("abc", "a")}"
puts "-> #{solution("abc", "abc")}"
puts "-> #{solution("abc", "ab")}"
puts
puts "falses"
puts "-> #{solution("abc", "d")}"
puts "-> #{solution("abc", "ad")}"
puts "-> #{solution("abc", "bd")}"
puts "-> #{solution("abc", 1)}"
