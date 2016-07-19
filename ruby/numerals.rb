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

###
# PUBLIC INTERFACE
###

def to_numeral(number)
  return "zero" if number.zero?
  term_to_text(number_to_term(number))
end

###
# INTERNAL METHODS
###

def number_to_term(num, acc = [])
  rest, rem = num.divmod(1000)
  acc << to_hundred_node(rem)
  if rest.zero?
    acc.reverse
  else
    number_to_term(rest, acc)
  end
end

def to_hundred_node(num)
  hundred, rest = num.divmod(100)
  ten, one = rest.divmod(10)
  [hundred, ten, one]
end

def one_to_text(num)
  ONES[num]
end

def ten_to_text(ten_node)
  ten, one = ten_node
  return one_to_text(one) if ten.zero?
  return teen_to_text(one) if ten == 1
  return TENS[ten] if one.zero?
  "#{TENS[ten]}-#{one_to_text(one)}"
end

def teen_to_text(num)
  TEENS[num]
end

def hundred_to_text(hundred_node)
  hundred, ten, one = hundred_node
  ten_text = ten_to_text([ten, one])
  return ten_text if hundred.zero?
  hundred_text = "#{one_to_text(hundred)} hundred"
  return hundred_text if ten.zero? && one.zero?
  "#{hundred_text} #{ten_text}"
end

def hundred_with_pow_to_text(hundred_node, pow)
  hundred_text = hundred_to_text(hundred_node)
  return hundred_text if pow.zero?
  "#{hundred_text} #{POWS[pow - 1]}"
end

def term_to_text(term)
  term.reverse.map.with_index do |hundred_node, i|
    hundred_with_pow_to_text(hundred_node, i) unless hundred_node.all?(&:zero?)
  end.compact.reverse.join(', ')
end
