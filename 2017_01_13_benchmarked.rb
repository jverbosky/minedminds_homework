# Benchmark testing different methods
# - Iterating 1 - 1,000,000 for more comparable values
########################
# Per:
# http://rubylearning.com/blog/2013/06/19/how-do-i-benchmark-ruby-code/
########################
# require 'benchmark'
# 
# Benchmark.bmbm do |bm|
# bm.report { first_approach }
# bm.report { alternative_approach }
# end
########################

require 'benchmark'

# Custom modulo method 1
# Used by "custom modulo" method
def evenly_divisible(dividend, divisor)
  quotient = dividend.to_f / divisor
  remainder = quotient - quotient.to_int
  if remainder > 0
    return false
  else
    return true
  end
end

# Custom module method 2
# Used by "base conversion" method
def base_slice(number, base)
  converted = number.to_s(base)
  ones_place = converted[-1]
  if ones_place.to_i == 0
    return true
  else
    return false
  end
end

# Benchmark#bmbm method
Benchmark.bmbm (18) do |bm|

  bm.report ("if else") do
    for num in 1..1_000_000
      if num % 3 == 0 && num % 5 == 0
        num = "Mined Minds"
      elsif num % 3 == 0
        num = "Mined"
      elsif num % 5 == 0
        num = "Minds"
      else
        num
      end
    end
  end

  bm.report ("one liner") do
      for num in 1..1_000_000; if num % 3 == 0 && num % 5 == 0; num = "Mined Minds"; elsif num % 3 == 0; num = "Mined"; elsif num % 5 == 0; num = "Minds"; else num; end; end
  end

  bm.report ("log ops") do
    for num in 1..1_000_000
      num = ("Mined Minds" if num % 3 == 0 && num % 5 == 0) || ("Mined" if num % 3 == 0) || ("Minds" if num % 5 == 0) || num
    end
  end

  bm.report ("lambda case") do
    div_3 = ->(x) { x % 3 == 0 }
    div_5 = ->(x) { x % 5 == 0 }
    div_15 = ->(x) { x % 15 == 0 }
    for num in 1..1_000_000
      case num
        when div_15 then num = "Mined Minds"
        when div_3 then num = "Mined"
        when div_5 then num = "Minds"
        else num
      end
    end
  end

  bm.report ("custom modulo") do
    for num in 1..1_000_000
      if evenly_divisible(num, 3) && evenly_divisible(num, 5)
        num = "Mined Minds"
      elsif evenly_divisible(num, 3)
        num = "Mined"
      elsif evenly_divisible(num, 5)
        num = "Minds"
      else
        num
      end
    end
  end

  bm.report ("list comprehension") do
    values = []
    (1..1_000_000).each { |num| values.push(num) }
    values.map! { |value| (value % 3 != 0 || value % 5 != 0) ? value : "Mined Minds" }
    values.map! { |value| value % 3 != 0 ? value : "Mined" }
    values.map! { |value| value % 5 != 0 ? value : "Minds" }
  end

  bm.report ("base conversion") do
    for num in 1..1_000_000
      if base_slice(num, 3) && base_slice(num, 5)
        num = "Mined Minds"
      elsif base_slice(num, 3)
        num = "Mined"
      elsif base_slice(num, 5)
        num = "Minds"
      else
        num
      end
    end
  end
end

=begin

Console output for benchmark tests

Rehearsal ------------------------------------------------------
if else              0.140000   0.000000   0.140000 (  0.152638)
one liner            0.156000   0.000000   0.156000 (  0.152954)
log ops              0.172000   0.000000   0.172000 (  0.169493)
lambda case          0.374000   0.000000   0.374000 (  0.377180)
custom modulo        1.186000   0.000000   1.186000 (  1.183338)
list comprehension   0.717000   0.016000   0.733000 (  0.735474)
base conversion      1.685000   0.000000   1.685000 (  1.682503)
--------------------------------------------- total: 4.446000sec

                         user     system      total        real
if else              0.156000   0.000000   0.156000 (  0.167813)
one liner            0.156000   0.000000   0.156000 (  0.148509)
log ops              0.156000   0.000000   0.156000 (  0.161253)
lambda case          0.343000   0.000000   0.343000 (  0.352529)
custom modulo        1.202000   0.000000   1.202000 (  1.203156)
list comprehension   0.733000   0.015000   0.748000 (  0.744508)
base conversion      1.654000   0.016000   1.670000 (  1.691233)
  
=end