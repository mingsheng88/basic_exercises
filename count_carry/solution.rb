def solution(one, two)
  result = 0
  carry = 0
  divisor = 10
  while true do
    remainer_one = one % divisor
    remainer_two = two % divisor
    sum = remainer_one + remainer_two + carry

    if sum >= 10
      result += 1
      carry = sum / 10
    else
      carry = 0
    end

    one /= 10
    two /= 10
    break if carry == 0 && one <= 0 && two <= 0
  end
  result
end

puts solution(123,456) == 0
puts solution(555,555) == 3
puts solution(900, 11) == 0
puts solution(145, 55) == 2
puts solution(0, 0) == 0
puts solution(1, 99999) == 5
puts solution(999045, 1055) == 5
puts solution(1,9) == 1
puts solution(1,99) == 2
puts solution(1,8) == 0
