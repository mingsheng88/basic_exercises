# Check if a permutation of a string can become a palindrome.

def solution(str)
  result = {}
  str.each_char do |char|
    result[char] ||= 0
    result[char] += 1
  end
  odd_count = result.values.count { |v| v.odd? }
  odd_count <= 1
end

puts !solution("1231")
puts solution("12321")
puts solution("1221")
puts solution("2121")
puts solution("212")
puts !solution("2123")
