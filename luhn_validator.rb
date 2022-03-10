# frozen_string_literal: true

# A validator using Luhn algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    num_mutiply = mutiply_digit(nums_a)
    sum = num_mutiply.map { |x| x > 9 ? (x + x / 10) % 10 : x }.sum
    ((10 - sum % 10) % 10).zero?
  end

  def mutiply_digit(nums_a)
    nums_a.reverse.map.with_index { |num, i| i.even? ? num : num * 2 }
  end
end
