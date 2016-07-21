const assert = require('assert')
const numerals = require('./../numerals.js')

describe('Numerals', function () {
  describe('#numberToTermshould', function () {
    it('should return list of hundred nodes', function () {
      assert.deepEqual([[0, 0, 7],
                        [6, 5, 4],
                        [3, 2, 1]],
                       numerals.numberToTerm(7654321))
      assert.deepEqual([[0, 3, 7],
                        [6, 5, 4],
                        [3, 2, 1]],
                       numerals.numberToTerm(37654321))
      assert.deepEqual([[0, 0, 5],
                        [4, 3, 7],
                        [6, 5, 4],
                        [3, 2, 1]],
                       numerals.numberToTerm(5437654321))
      assert.deepEqual([[0, 0, 5],
                        [4, 3, 7],
                        [0, 0, 0],
                        [3, 2, 1]],
                       numerals.numberToTerm(5437000321))
      assert.deepEqual([[0, 0, 1],
                        [0, 0, 0]],
                       numerals.numberToTerm(1000))
    })
  })

  describe('#oneToText', function () {
    it('transform ones to text', function () {
      assert.equal('one',   oneToText(1))
      assert.equal('two',   oneToText(2))
      assert.equal('three', oneToText(3))
      assert.equal('four',  oneToText(4))
      assert.equal('five',  oneToText(5))
      assert.equal('six',   oneToText(6))
      assert.equal('seven', oneToText(7))
      assert.equal('eight', oneToText(8))
      assert.equal('nine',  oneToText(9))
    })
  })

  describe('#tenToText', function () {
    it('transform tens to text', function () {
      assert.equal('twenty-two',   tenToText([2, 2]))
      assert.equal('thirty-three', tenToText([3, 3]))
      assert.equal('ten',          tenToText([1, 0]))
      assert.equal('eleven',       tenToText([1, 1]))
      assert.equal('eighteen',     tenToText([1, 8]))
      assert.equal('sixteen',      tenToText([1, 6]))
    })
  })

  describe('#hundredToText', function () {
    it('transform hundreds to text', function () {
      assert.equal('one hundred',            hundredToText([1, 0, 0]))
      assert.equal('six hundred two',        hundredToText([6, 0, 2]))
      assert.equal('one hundred nineteen',   hundredToText([1, 1, 9]))
      assert.equal('one hundred twenty',     hundredToText([1, 2, 0]))
      assert.equal('two hundred twenty-two', hundredToText([2, 2, 2]))
    })
  })

  describe('#hundredWithPowToText', function () {
    it('transform hundreds with pow to text', function () {
      assert.equal("one",          hundredWithPowToText([0, 0, 1], 0))
      assert.equal("one thousand", hundredWithPowToText([0, 0, 1], 1))
      assert.equal("one million",  hundredWithPowToText([0, 0, 1], 2))
      assert.equal("one billion",  hundredWithPowToText([0, 0, 1], 3))
    })
  })

  describe('#termToText', function () {
    it('transform term to text', function () {
      assert.equal('seven million, six hundred fifty-four thousand, three hundred twenty-one',
                   termToText([[0, 0, 7],
                               [6, 5, 4],
                               [3, 2, 1]]))
      assert.equal('five billion, four hundred thirty-seven million, three hundred twenty-one',
                   term_to_text([[0, 0, 5],
                                 [4, 3, 7],
                                 [0, 0, 0],
                                 [3, 2, 1]]))
    })
  })

  describe('#toNumeral', function () {
    it('transform number to english numeral', function () {
      assert.equal('seven million, six hundred fifty-four thousand, three hundred twenty-one',
                   toNumeral(7654321))
      assert.equal('five billion, four hundred thirty-seven million, six hundred fifty-four thousand, three hundred twenty-one',
                   toNumeral(5437654321))
      assert.equal('zero', toNumeral(0))
    })
  })
})
