# numerals

Algorithm based on two stages:

1. create numeral term from number
2. transform term to text


#### term description

```
term :: [hundred_node]
hundred_node :: (hundred, ten, one)
hundred, ten, one :: digit
digit :: 0..9
```

## usage
#####ruby:
`ruby numerals_test.rb`

#####js:

```js
npm install
npm test
npm run build
open index.html
```
