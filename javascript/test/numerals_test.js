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
      assert.equal('one',   numerals.oneToText(1))
      assert.equal('two',   numerals.oneToText(2))
      assert.equal('three', numerals.oneToText(3))
      assert.equal('four',  numerals.oneToText(4))
      assert.equal('five',  numerals.oneToText(5))
      assert.equal('six',   numerals.oneToText(6))
      assert.equal('seven', numerals.oneToText(7))
      assert.equal('eight', numerals.oneToText(8))
      assert.equal('nine',  numerals.oneToText(9))
    })
  })

  describe('#tenToText', function () {
    it('transform tens to text', function () {
      assert.equal('twenty-two',   numerals.tenToText([2, 2]))
      assert.equal('thirty-three', numerals.tenToText([3, 3]))
      assert.equal('ten',          numerals.tenToText([1, 0]))
      assert.equal('eleven',       numerals.tenToText([1, 1]))
      assert.equal('eighteen',     numerals.tenToText([1, 8]))
      assert.equal('sixteen',      numerals.tenToText([1, 6]))
    })
  })

  describe('#hundredToText', function () {
    it('transform hundreds to text', function () {
      assert.equal('one hundred',            numerals.hundredToText([1, 0, 0]))
      assert.equal('six hundred two',        numerals.hundredToText([6, 0, 2]))
      assert.equal('one hundred nineteen',   numerals.hundredToText([1, 1, 9]))
      assert.equal('one hundred twenty',     numerals.hundredToText([1, 2, 0]))
      assert.equal('two hundred twenty-two', numerals.hundredToText([2, 2, 2]))
    })
  })

  describe('#hundredWithPowToText', function () {
    it('transform hundreds with pow to text', function () {
      assert.equal("one",          numerals.hundredWithPowToText([0, 0, 1], 0))
      assert.equal("one thousand", numerals.hundredWithPowToText([0, 0, 1], 1))
      assert.equal("one million",  numerals.hundredWithPowToText([0, 0, 1], 2))
      assert.equal("one billion",  numerals.hundredWithPowToText([0, 0, 1], 3))
    })
  })

  describe('#termToText', function () {
    it('transform term to text', function () {
      assert.equal('seven million, six hundred fifty-four thousand, three hundred twenty-one',
                   numerals.termToText([[0, 0, 7],
                                        [6, 5, 4],
                                        [3, 2, 1]]))
      assert.equal('five billion, four hundred thirty-seven million, three hundred twenty-one',
                   numerals.termToText([[0, 0, 5],
                                        [4, 3, 7],
                                        [0, 0, 0],
                                        [3, 2, 1]]))
    })
  })

  describe('#toNumeral', function () {
    it('transform number to english numeral', function () {
      assert.equal('seven million, six hundred fifty-four thousand, three hundred twenty-one',
                   numerals.toNumeral(7654321))
      assert.equal('five billion, four hundred thirty-seven million, six hundred fifty-four thousand, three hundred twenty-one',
                   numerals.toNumeral(5437654321))
      assert.equal('zero', numerals.toNumeral(0))
    })
  })
})
