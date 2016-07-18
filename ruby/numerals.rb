ONES = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  0 => "zero"
}

TEENS = {
  0 => "ten",
  1 => "eleven",
  2 => "twelve",
  3 => "thirteen",
  4 => "fourteen",
  5 => "fifteen",
  6 => "sixteen",
  7 => "seventeen",
  8 => "eighteen",
  9 => "nineteen"
}

TENS = {
  2 => "twenty",
  3 => "thirty",
  4 => "forty",
  5 => "fifty",
  6 => "sixty",
  7 => "seventy",
  8 => "eighty",
  9 => "ninety"
}

POWS = [
  "thousand",
  "million",
  "billion"
]


# thousand_node :: (hundreds, tens, ones) | :empty
# hundreds :: numeric
# tens :: numeric
# ones :: numeric

# numeric, array -> [thousand_node]
def to_abstract_tree(num, acc = [])
  rest, rem = num.divmod(1000)
  acc << to_thousand_node(rem)
  if rest.zero?
    acc.reverse
  else
    to_abstract_tree(rest, acc)
  end
end

def to_thousand_node(num)
  return :empty if num.zero?
  hundreds, rest = num.divmod(100)
  tens, ones = rest.divmod(10)
  [hundreds, tens, ones]
end

def one_to_text(num)
  ONES[num]
end

def ten_to_text(ten_node)
  ten, one = ten_node
  return one_to_text(one) if ten == 0
  return teen_to_text(one) if ten == 1
  "#{TENS[ten]}-#{one_to_text(one)}"
end

def teen_to_text(num)
  TEENS[num]
end
