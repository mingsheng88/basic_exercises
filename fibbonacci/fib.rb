#!/bin/ruby
#
#==================================================================

def fib n, mem=[]
  return n, [0] if n==0
  return n, [0,1] if n==1
  a, mem = mem[n-2] ? [mem[n-2], mem] : fib(n-2,mem)
  b, mem = mem[n-1] ? [mem[n-1], mem] : fib(n-1,mem)
  mem << (a+b)
  return mem[-1], mem
end

#==================================================================

def fib2 n
  return n, [n] if n == 0
  return n, [n-1,n] if n == 1
  result = (1..n-2).inject([1,1]) {|a,b| a << (a[-2] + a[-1])}
  return result.last, result
end

#==================================================================

def fib3 n, cache={}
  return n if n <= 1
  cache[n] ||= fib3(n-1,cache) + fib3(n-2,cache)
end

#==================================================================

def fib4 n, cache={}
  return n if n == 0 || n == 1
  cache[n] ||= fib4(n-1, cache) + fib4(n-2, cache)
end

#==================================================================

def fib5 n
  fibonacci = Hash.new{ |numbers,index|
    numbers[index] = fibonacci[index - 2] + fibonacci[index - 1]
  }.update(0 => 0, 1 => 1)
  fibonacci[n]
end

#==================================================================

require 'matrix'
M = Matrix[[0, 1], [1,1]]

def fib_matrix n
  return 0 if n <= 0 # F(0)
  return 1 if n == 1 # F(1)
  return lower_right(M**(n - 1))
end

def lower_right matrix
  return nil if matrix.row_size == 0
  return matrix[matrix.row_size - 1, matrix.column_size - 1]
end

#==================================================================

require 'benchmark'

Benchmark.bm do |x|
  puts fib_matrix(1_000_000_000)
  # puts fib2(3000)[0]
  # puts fib(3000)[0]
  # puts fib3(3000)
  # puts fib4(3000)
  # puts fib5(3000)

  x.report {1500.times {fib_matrix(3000)}}      # 0.210000   0.010000   0.220000 (  0.211302)
  x.report {1500.times {fib2(3000)}}            # 1.510000   0.000000   1.510000 (  1.515464)
  x.report {1500.times {fib(3000) }}            # 2.290000   0.000000   2.290000 (  2.285504)
  x.report {1500.times {fib3(3000)}}            # 2.750000   0.000000   2.750000 (  2.754432)
  x.report {1500.times {fib4(3000)}}            # 2.880000   0.000000   2.880000 (  2.882453)
  x.report {1500.times {fib5(3000)}}            # 4.410000   0.000000   4.410000 (  4.410274)

  x.report {1500.times {fib_matrix(30000)}}     # 0.810000   0.000000   0.810000 (  0.802753)
  x.report {1500.times {fib2(30000)}}           # 42.000000   0.070000  42.070000 ( 42.073551)
  x.report {1500.times {fib5(30000)}}           # Stack overflow
  x.report {1500.times {fib4(30000)}}           # Stack overflow
  x.report {1500.times {fib3(30000)}}           # Stack overflow
  x.report {1500.times {fib(30000) }}           # Stack overflow
end

#==================================================================
