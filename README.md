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

```shell
cd ruby
ruby numerals_test.rb
```

#####js:

```shell
cd javascript
npm install
npm test
npm run build
open index.html
```

#####elm:

```shell
cd elm
elm package install
elm reactor
open http://localhost:8000/App.elm
open http://localhost:8000/Tests.elm
```
