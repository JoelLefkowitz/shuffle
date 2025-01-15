# Shuffle

Shuffle and pick elements from arrays.

![Review](https://img.shields.io/github/actions/workflow/status/JoelLefkowitz/shuffle/review.yml)
![Version](https://pursuit.purescript.org/packages/purescript-shuffle/badge)
![Quality](https://img.shields.io/codacy/grade/01012f44da174bdbac24204f1ff7b096)

## Installing

```bash
spago install shuffle
```

## Usage

You can shuffle an array and the result will be contained inside an `Effect`:

`shuffle ∷ ∀ a. Array a → Effect (Array a)`

```purs
import Effect.Shuffle (shuffle)

shuffle ["a", "b", "c"]
["b", "c", "a"]
```

Often when you want pick an element from an array at random the underlying type will be a `Monoid`. This means that if the array is empty there is an suitable fallback:

`pick ∷ ∀ a. Monoid a ⇒ Array a → Effect a`

```purs
import Effect.Shuffle (pick)

pick ["a", "b", "c"]
"b"
```

```purs
pick []
""
```

Alternatively you can provide a fallback directly with `pickOr`:

`pickOr ∷ ∀ a. a → Array a → Effect a`

```purs
import Effect.Shuffle (pickOr)

pickOr 0 [1, 2, 3]
2
```

```purs
pickOr 0 []
0
```

If you want to explicitly receive a `Maybe` you can use `pickMaybe`:

`pickMaybe ∷ ∀ a. Array a → Effect (Maybe a)`

```purs
import Effect.Shuffle (pickMaybe)

pickMaybe ["a", "b", "c"]
Just "b"
```

```purs
pickMaybe []
Nothing
```

If your array is non-empty then you can use `pickNonEmpty`:

`pickNonEmpty ∷ ∀ a. NonEmptyArray a → Effect a`

```purs
import Effect.Shuffle (pickNonEmpty)

pickNonEmpty (cons' "a" [ "b", "c" ])
"b"
```

## Documentation

Documentation and more detailed examples are hosted on [Pursuit](https://pursuit.purescript.org/packages/purescript-shuffle).

## Tooling

### Dependencies

To install dependencies:

```bash
yarn install
yarn spago install
```

### Tests

To run tests:

```bash
yarn spago test
```

### Documentation

To generate the documentation locally:

```bash
yarn spago docs
```

### Linters

To run linters:

```bash
yarn lint
```

### Formatters

To run formatters:

```bash
yarn format
```

## Contributing

Please read this repository's [Code of Conduct](CODE_OF_CONDUCT.md) which outlines our collaboration standards and the [Changelog](CHANGELOG.md) for details on breaking changes that have been made.

This repository adheres to semantic versioning standards. For more information on semantic versioning visit [SemVer](https://semver.org).

Bump2version is used to version and tag changes. For example:

```bash
bump2version patch
```

### Contributors

- [Joel Lefkowitz](https://github.com/joellefkowitz) - Initial work

## Remarks

Lots of love to the open source community!

<div align='center'>
    <img width=200 height=200 src='https://media.giphy.com/media/osAcIGTSyeovPq6Xph/giphy.gif' alt='Be kind to your mind' />
    <img width=200 height=200 src='https://media.giphy.com/media/KEAAbQ5clGWJwuJuZB/giphy.gif' alt='Love each other' />
    <img width=200 height=200 src='https://media.giphy.com/media/WRWykrFkxJA6JJuTvc/giphy.gif' alt="It's ok to have a bad day" />
</div>
