#!/bin/ruby

class Array

  # Bubble Sort
  def bubble_sort
    # Version 1
    # =========
    # self.each_with_index do |n,i|
    #   self.each_with_index do |m,j|
    #     self[j], self[j+1] = self[j+1], self[j] if self[j+1] && self[j] > self[j+1]
    #   end
    # end

    # Version 2
    # =========
    # self.each do
    #   self[0..-2].each_with_index do |n,i|
    #     self[i], self[i+1] = self[i+1], self[i] if self[i+1] && self[i] > self[i+1]
    #   end
    # end

    # Version 3
    # =========
    self.each do
      (self.size-1).times do |i|
        self[i], self[i+1] = self[i+1], self[i] if self[i+1] && self[i] > self[i+1]
      end
    end
  end

  # Insertion Sort
  def insertion_sort
    a = []
    self.each do |x|
      a.unshift x
      a.size.times do |i|
        a[i], a[i+1] = a[i+1], a[i] if a[i+1] && a[i] > a[i+1]
      end
    end
    a
  end

  # Quick Sort
  def quick_sort
    return self if self.size <= 1
    left = []
    right = []
    pivot = self.last
    self[0..-2].each do |n|
      left << n if n < pivot
      right << n if n >= pivot
    end
    res = []
    res = left.quick_sort
    res << pivot
    res += right.quick_sort
  end

  # Merge Sort
  def merge_sort
    return self if self.size <= 1
    middle = self.size/2
    left = self[0..middle-1].merge_sort
    right = self[middle..-1].merge_sort
    res = []
    until left.empty? or right.empty? do
      if left.first <= right.first
        res << left.shift
      else
        res << right.shift
      end
    end
    res + left + right
  end
end

def init_arr n
  res = []
  n.times do
    res << rand(0..100000)
  end
  res
end

require 'benchmark'

a = [14,33,27,35,10]

Benchmark.bm do |x|
  x.report {5000.times { init_arr(5).bubble_sort }}
  x.report {5000.times { init_arr(5).insertion_sort }}
  x.report {5000.times { init_arr(5).quick_sort }}
  x.report {5000.times { init_arr(5).merge_sort }}

  x.report {5000.times { init_arr(100).bubble_sort }}
  x.report {5000.times { init_arr(100).insertion_sort }}
  x.report {5000.times { init_arr(100).quick_sort }}
  x.report {5000.times { init_arr(100).merge_sort }}
end
