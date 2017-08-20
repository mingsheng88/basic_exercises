def solution(door_count)
  doors = Array.new(door_count + 1, false)
  (1..(door_count + 1)).each do |every_i_door|
    i = door_count / every_i_door
    (1..i).each do |unskipped_door|
      door_position = unskipped_door * every_i_door
      # puts "every i door = #{every_i_door}, unskipped_door = #{unskipped_door}, door_position = #{door_position}"
      doors[door_position] = !doors[door_position]
    end
  end
  doors[1..-1]
end

def expect(a, b)
  puts "--------------------"
  puts "answer = #{a}"
  puts "solution = #{b}"
  puts a == b
end

def answer(door_count)
  result = Array.new(door_count + 1, false)
  (1..(door_count)).each do |i|
    result[i] = (Math.sqrt(i) == Math.sqrt(i).round)
  end
  result[1..-1]
end

expect(answer(1), solution(1))
expect(answer(2), solution(2))
expect(answer(3), solution(3))
expect(answer(4), solution(4))
expect(answer(5), solution(5))
expect(answer(6), solution(6))
expect(answer(100), solution(100))
