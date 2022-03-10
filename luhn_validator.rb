# frozen_string_literal: true

# A validator using Luhn algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # rubocop:disable Metrics/AbcSize
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    num_double = nums_a.reverse.map.with_index { |num, i| i.even? ? num : num * 2 }
    sum = num_double.map { |x| x > 9 ? (x + x / 10) % 10 : x }.sum
    ((10 - sum % 10) % 10).zero?
  end
  # rubocop:enable Metrics/AbcSize
end
