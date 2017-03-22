module Topics.Functor exposing (content)


content : String
content =
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
"""
