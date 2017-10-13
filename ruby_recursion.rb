# Define a recursive function that finds the factorial of a number.

# def factorial(n)
#   if n == 0 || n == 1
#     1
#   else
#     n * factorial(n - 1)
#   end
# end

# factorial(7)

# def append(arr, n)
#   return arr if n < 0
#   append(arr << n, n - 1)
# end

# p append([], 5)
# p append([], 3)
# p append([], 2)

# def preppend(arr, n)
#   return arr if n < 0
#   preppend(arr.unshift(n), n - 1)
# end

# p preppend([], 5)
# p preppend([], 3)

# def fib(n)
#   return n if n == 0 || n == 1
#   (fib(n - 1) + fib(n - 2))
# end

# p fib(10)

# def fib(n)
#   a, b = 0, 1
#   n.times do
#     a, b = b, a + b
#   end
#   a
# end

# p fib(10)
# p fib(6)

# ----------------------

# Define a recursive function that returns true if a string is a palindrome and false otherwise.

# def palindrome(string)
#   if string.length == 1 || string.length == 0
#     true
#   else
#     if string[0] == string[-1]
#       palindrome(string[1..-2])
#     else
#       false
#     end
#   end
# end

# p palindrome("racecar")
# p palindrome("fart")

# --------------------------

# Define a recursive function that takes an argument n and prints "n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall

# def beer(n)
#   if n == 0
#     p "no more bottles of beer on the wall"
#   else
#     p "#{n} bottles of beer on the wall"
#     beer(n - 1)
#   end
# end

# beer(9)

#  --------------------------

# Define a recursive function that flattens an array. The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

# def flatten(arr)
#   arr.flatten
# end


# def flatten(array, result = [])
#   array.each do |element|
#     if element.kind_of?(Array)
#       flatten(element, result)
#     else
#       result << element
#     end
#   end
#   result
# end

# # p "*" * 80
# p flatten([[1, 2], [3, 4]])
# p flatten([[1, [8, 9]], [3, 4]])

# --------------------------

# Use the roman_mapping hash to define a recursive method that converts an integer to a Roman numeral.

# def convert_roman(n, result = "")
#   roman_mapping = {
#     1000 => "M",
#     900 => "CM",
#     500 => "D",
#     400 => "CD",
#     100 => "C",
#     90 => "XC",
#     50 => "L",
#     40 => "XL",
#     10 => "X",
#     9 => "IX",
#     5 => "V",
#     4 => "IV",
#     1 => "I"
#   }

# # worked out a non-recursive solution in the process of trying to make the recursive one:
#   roman_mapping.each do |num, roman|
#     if n / num >= 1
#       result << roman * (n / num)
#       n -= num * (n / num)
#       return result if n == 0
#     end
#   end

# # my recursive solution inspired by the solution they gave:
#   return result if n == 0
#   roman_mapping.each do |num, roman|
#     # redefines quotient and modulus for every mapped number in the hash as a divisor
#     quotient, modulus = n.divmod(num)
#     # builds on the result string by adding the appropriate number of roman characters by quotient
#     result << roman * quotient
#     # calls the method on the modulus if the quotient reaches zero so that the same pattern can be applied to any remainders
#     return convert_roman(modulus, result) if quotient > 0
#   end
# end

# p convert_roman(2999)

# --------------------------

# Use the roman_mapping hash to define a recursive method that converts a Roman numeral to an integer.


def roman_to_integer(str, result = 0 )
  roman_mapping = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

# my solution:
  roman_mapping.each do |roman, num|
    if str.start_with?(roman)
      str.slice!(0, roman.length)
      result += num
      return roman_to_integer(str, result) if str.length > 0
    end
  end
  result
end

p roman_to_integer("MCMXCIV")
p roman_to_integer("XLIII")
p roman_to_integer("MMXXII")

# their solution:
# def roman_to_integer(roman_mapping, str, result = 0)
#   return result if str.empty?
#   roman_mapping.keys.each do |roman|
#     if str.start_with?(roman)
#       result += roman_mapping[roman]
#       str = str.slice(roman.length, str.length)
#       return roman_to_integer(roman_mapping, str, result)
#     end
#   end
