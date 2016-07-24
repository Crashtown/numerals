const ONES = {
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

const TEENS = {
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

const TENS = {
  2: "twenty",
  3: "thirty",
  4: "forty",
  5: "fifty",
  6: "sixty",
  7: "seventy",
  8: "eighty",
  9: "ninety"
}

const POWS = [
  "thousand",
  "million",
  "billion",
  "trillion",
  "quadrillion",
  "quintillion",
  "sextillion",
  "septillion"
]

/*
* PUBLIC INTERFACE
*/

function toNumeral(number) {
  if (number === 0) { return "zero" }
  return termToText(numberToTerm(number));
}

/*
* INTERNAL FUNCTIONS
*/

function divmod(number, divider) {
  const result = Math.floor((number / divider));
  const reminder = number % divider;
  return [result, reminder];
}

function toHundredNode(num) {
  const [hundred, rest] = divmod(num, 100);
  const [ten, one] = divmod(rest, 10);
  return [hundred, ten, one];
}

function numberToTerm(num, acc = []) {
  const [rest, reminder] = divmod(num, 1000);
  acc.push(toHundredNode(reminder));
  if (rest === 0) { return acc.reverse() }
  return numberToTerm(rest, acc);
}

function oneToText(num) {
  return ONES[num];
}

function tenToText([ten, one]) {
  if (ten === 0) return oneToText(one);
  if (ten === 1) return teenToText(one);
  if (one === 0) return TENS[ten];
  return `${TENS[ten]}-${oneToText(one)}`;
}

function teenToText(num) {
  return TEENS[num];
}

function hundredToText([hundred, ten, one]) {
  const tenText = tenToText([ten, one]);
  if (hundred === 0) return tenText;
  const hundredText = `${oneToText(hundred)} hundred`;
  if (ten === 0 && one === 0) return hundredText;
  return `${hundredText} ${tenText}`;
}

function hundredWithPowToText(hundredNode, pow) {
  const hundredText = hundredToText(hundredNode);
  if (pow === 0) return hundredText;
  return `${hundredText} ${POWS[pow - 1]}`
}

function termToText(term) {
  let hundredsInText = [];
  term.reverse().forEach((hundredNode, i) => {
    if (!hundredNode.every((el) => el === 0)) {
      hundredsInText.push(hundredWithPowToText(hundredNode, i));
    }
  });
  return hundredsInText.reverse().join(', ');
}


module.exports = {
  toNumeral,
  numberToTerm,
  oneToText,
  tenToText,
  hundredToText,
  hundredWithPowToText,
  termToText,
}
