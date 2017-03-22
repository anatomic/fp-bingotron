module Topics exposing (..)


functor : String
functor =
    """
# Functor

An algebraic data type that supports `map` and adheres to two rules:

## Preserves Identity

```js
const foo = ["a", "b", "c"];
foo.map(x => x); // ["a", "b", "c"]
```

## Composable
```javascript
object.map(compose(f, g)) == object.map(g).map(f)
```

**N.b. `map` must return a value of the same Functor i.e. `Array.prototype.map :: (A -> B) -> [B]`**
"""


arity : String
arity =
    """
# Arity

> The number of arguments that a function expects.

From words like unary, binary, ternary, etc. Addition, for example, takes two arguments, and so it is defined as a binary function or a function with an arity of two.

Such a function may sometimes be called "dyadic" by people who prefer Greek roots to Latin. Likewise, a function that takes a variable number of arguments is called "variadic," whereas a binary function must be given two and only two arguments, currying and partial application notwithstanding.

```js
const add = (a, b) => a + b;
const log = s => console.log(s);

function addition() {
    return [].slice.call(arguments, 0).reduce((a,b) => a + b, 0);
}

console.log(add.length); // 2
console.log(log.length); // 1
console.log(addition.length); // 0 - variadic function
```
"""


autoCurry : String
autoCurry =
    """
# Auto Currying

> Working with functions that are curried by default makes it very easy to build functions as sequences of simpler functions

Often when working in a functional style it's useful to have a core library of helper functions. I'd recommend Ramda as it provides curried functions by default and orders function parameters to make currying convenient.

* [Ramda](http://ramdajs.com)
* [Hey Underscore, You're Doing It Wrong!](https://www.youtube.com/watch?v=m3svKOdZijA&app=desktop)
* [Why Curry Helps](https://hughfdjackson.com/javascript/why-curry-helps/)
"""


currying : String
currying =
    """
# Currying

> The process of converting a function that takes multiple arguments into a function that can take them one at a time

Understanding currying is a core facet of functional programming, with many FP languages currying functions by default.

It is easiest to think of currying as a factory that will return a new function until all the required arguments are received.

```js
const add = (a, b) => a + b; //not curried, requires 2 arguments
console.log(add(1, 2)); // 3
console.log(add(1)); // NaN

const curriedAdd = curry((a, b) => a + b);
console.log(curriedAdd(1)); // Function
console.log(curriedAdd(1)(2)); // 3
const add1 = add(1);
console.log(add(1,2)); // 3
console.log(add1(2)); // 3
```

A type signature for the `curriedAdd` function shown above might be
```haskell
add :: Number -> Number -> Number
```
"""


higherOrderFunction : String
higherOrderFunction =
    """
# Higher Order Function

> A function which takes a function as an argument and/or returns a function as a value

An example of a Higher Order Function is `filter`

```js
const filter = (predicate, list) => list.filter(predicate);
const is = type => x => Object(x) instanceof type

filter(is(Number), [0, '1', -2, null]); // [0, -2]
```
"""


closure : String
closure =
    """
# Closure

> Closures are functions that refer to variables that are used locally but defined in an enclosing scope

```js
function prefixer (prefix) {
    const pre = prefix || "";

    return function(content) {
        return pre+"-"+content;
    }
}

const fooPrefix = prefixer("foo");
console.log(fooPrefix("bar")); // "foo-bar"
```
"""


partialApplication : String
partialApplication =
    """
# Partial Application

"""


pointFree : String
pointFree =
    """
# Point-Free Style

> A style of writing functions without explicitly declaring the parameters

This is typically dependent on unary functions, currying and functional composition

```js
const map = fn => list => list.map(fn);
const add = a => b => a + b;

// Not point free
const incrementAll = numbers => map(add(1))(numbers)

// Point free
const incrementAll2 = map(add(1));
```
"""


purity : String
purity =
    """
# Purity

> A pure function is one that returns a value solely based on its inputs and does not produce side effects

Additionally, given the same inputs a pure function will *always* return the same value.

Some examples of impure functions are those which throw runtime exceptions i.e. `JSON.parse`
"""


idempotent : String
idempotent =
    """
# Idempotent

> A function is idempotent if it can be re-applied to its result and always return the same value

```js
//f(f(x)) == f(x)
Math.abs(Math.abs(10.001)); // 10
```
"""


sideEffect : String
sideEffect =
    """
# Side Effect

> A side effect is where some state outside the scope of a function is mutated based on the execution of that function

```js
var foo = "foo"; // global scope

function updateFoo(newFoo) {
    foo = newFoo;
}
```
"""


sideCause : String
sideCause =
    """
# Side Cause

> A side cause is where the value returned from a function is in same way based on state stored outside the function
"""


composition : String
composition =
    """
# Function Composition

> The combination of functions such that the output of one is the input to another

Typically function composition works best with a helper library (such as Ramda).

```js
const compose = (f, g) => x => f(g(x))

const add = a => b => a + b;
const mult = a => b => a * b;

const add1Mult5 = compose(mult(5), add(1));

console.log(add1Mult5(1)); // 10
```
"""


predicate : String
predicate =
    """
# Predicate

> A predicate is a function that takes a value and returns a boolean value

```js
const gt = a => b => b > a;
const gt2 = gt(2);

gt2(5); // true
gt2(1); // false

[1, 3, 5, 6, 0].filter(gt2); // [3, 5, 6]
```
"""


refTrans : String
refTrans =
    """
# Referential Transparency

> An expression that can be replaced with its value without changing the behavior of the program is said to be referentially transparent.

```js
const greet = () => "Hello world";
```

Any use of `greet()` can be replaced with "Hello world" so the function `greet` is referentially transparent.
"""


morphism : String
morphism =
    """
# Morphism

> In theory a morphism is a transformation from one structure to another - in code terms, we can consider them to be functions
"""


endomorphism : String
endomorphism =
    """
# Endomorphism

> A function where the input type is the same as the output type

```js
// uppercase :: String -> String
const uppercase = str => str.toUpperCase();

// decrement :: Number -> Number
const decrement = num => num - 1;
```
"""


isomorphism : String
isomorphism =
    """
# Isomorphism

> A pair of transformations between two types of objects which are structural in nature and no data is lost

```js
const pairToCoords = ([x, y]) => {x, y};
const coordsToPair = ({x, y}) => [x, y];

const pair = [1, 2];
coordsToPair(pairToCoords(pair)); // [1, 2];
```
"""


setoid : String
setoid =
    """
# Setoid

> An object that has an `equals` function which can be used to compare with objects of the same type

```js
a.equals(b) === true; // reflexivity
a.equals(b) === b.equals(a) // symmetry

a.equals(b) && b.equals(c) === a.equals(c); // transitivity
```
"""


semigroup : String
semigroup =
    """
# Semigroup

> An object that has a `concat` function which can be used to append values from other objects of the same type

```js
const a = ["1", "2", "3"];
const b = ["4", "5", "6"];
const c = ["7"];

a.concat(b); // ["1", "2", "3", "4", "5", "6"]

a.concat(b).concat(c) == a.concat(b.concat(c)) // associativity
```
"""


monoid : String
monoid =
    """
# Monoid

> A monoid implements `semigroup` and provides an `empty` function

```js
Array.empty = () => [];

["foo"].concat(Array.empty()); // ["foo"] - Right identity
Array.empty().concat(["foo"]); // ["foo"] - Left identity
```
"""


foldable : String
foldable =
    """
# Foldable

> An object which implements a `reduce` function and can transform that object into some other type

The function passed in to `reduce` is a binary function and the second argument is the initial value for the accumulator.

```js
const data = [1, 2, 3];
const add = (a, b) => a + b;

const sum = data.reduce(add, 0); //6
```
"""


monad : String
monad =
    """
# Monad

> A monad is an object which implements `of` and `chain` functions - chain is like map except it lifts it's returned value out from its container

Some people argue that Promises in JS are Monads. I'd say, "sort of, and close enough"

```js
// Array.prototype.of is a thing so just need to implement chain
Array.prototype.chain = fn => this.reduce((acc, it) => acc.concat(fn(it)), []);

Array.of("this, is", "some, stuff").chain(a => a.split(',')); // ["this", "is", "some", "stuff"]

// if you were to map...
Array.of("this, is", "some, stuff").map(a => a.split(',')); // [["this", "is"], ["some", "stuff"]]
```

`of` is known as `return` in other functional languages and `chain` is often referred to as `flatMap` or `bind`.
"""


applicativeFunctor : String
applicativeFunctor =
    """
# Applicative Functor

> A functor which implements an `ap` function which applies a function value in the object to the value of another object of the same type

```js
const add = a => b => a + b;
const justAdd2 = Just.of(add(2));

const just5 = Just.of(5);

just5.ap(justAdd2); // Just 7
```

More concrete JavaScript example:
```js
Array.prototype.ap = function (xs) {
  return this.reduce((acc, f) => acc.concat(xs.map(f)), [])
}

const inc = x => x + 1;

[inc].ap([1]) // [2]
```
"""


pointedFunctor : String
pointedFunctor =
    """
# Pointed Functor

> A pointed functor is an object that implements `of`

`of` takes a value and puts it in the containing data structure.

```js
Array.of(1, 2, 3) // [1, 2, 3]
```
"""
