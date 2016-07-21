ONES = {
  1: "one",
  2: "two",
  3: "three",
  4: "four",
  5: "five",
  6: "six",
  7: "seven",
  8: "eight",
  9: "nine",
}

TEENS = {
  0: "ten",
  1: "eleven",
  2: "twelve",
  3: "thirteen",
  4: "fourteen",
  5: "fifteen",
  6: "sixteen",
  7: "seventeen",
  8: "eighteen",
  9: "nineteen"
}

TENS = {
  2: "twenty",
  3: "thirty",
  4: "forty",
  5: "fifty",
  6: "sixty",
  7: "seventy",
  8: "eighty",
  9: "ninety"
}

POWS = [
  "thousand",
  "million",
  "billion"
]

/*
* PUBLIC INTERFACE
*/

function toNumeral (number) {
  if (number === 0) { return "zero" }
  return termToText(numberToTerm(number));
}

/*
* INTERNAL FUNCTIONS
*/

function divmod (number, divider) {
  const result = Number.parseInt((number / divider));
  const reminder = number % divider;
  return [result, reminder];
}

function toHundredNode (num) {
  const [hundred, rest] = divmod(num, 100);
  const [ten, one] = divmod(rest, 10);
  return [hundred, ten, one];
}

function numberToTerm (num, acc = []) {
  const [rest, reminder] = divmod(num, 1000);
  acc.push(toHundredNode(reminder));
  if (rest === 0) { return acc.reverse() }
  return numberToTerm(rest, acc);
}

module.exports = {
  toNumeral,
  numberToTerm
}
