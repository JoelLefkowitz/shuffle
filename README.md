# Shuffle

Shuffle and pick elements from arrays.

![Review](https://img.shields.io/github/actions/workflow/status/JoelLefkowitz/shuffle/review.yaml)
![Version](https://pursuit.purescript.org/packages/purescript-shuffle/badge)
![Quality](https://img.shields.io/codacy/grade/01012f44da174bdbac24204f1ff7b096)

## Installing

```bash
spago install shuffle
```

## Usage

You can shuffle an array and the result will be contained inside an `Effect`:

`shuffle ∷ ∀ f a. Foldable f ⇒ Unfoldable f ⇒ f a → Effect (f a)`

```purs
import Effect.Shuffle (shuffle)

do
  ... <- shuffle ["a", "b", "c"]
  -- ["b", "c", "a"]
```

You can similarly pick an element from an array at random:

`pick ∷ ∀ f a. Foldable f ⇒ Unfoldable f ⇒ f a → Effect (Maybe a)`

```purs
import Effect.Shuffle (pick)

do
  ... <- pick ["a", "b", "c"]
  -- Just "b"
```

You can provide a fallback directly with `pickOr`:

`pickOr ∷ ∀ f a. Foldable f ⇒ Unfoldable f ⇒ a → f a → Effect a`

```purs
import Effect.Shuffle (pickOr)

do
  ... <- pickOr "" ["a", "b", "c"]
  -- "b"
```

If the underlying type is a `Monoid` there is an suitable fallback automatically:

`pickMonoid ∷ ∀ f a. Foldable f ⇒ Unfoldable f ⇒ Monoid a ⇒ f a → Effect a`

```purs
import Effect.Shuffle (pickMonoid)

strings :: Array String
strings = []

do
  ... <- pickMonoid strings
  -- ""
```

If you have a `NonEmptyArray` you can pick an element without needing a fallback:

`pickNonEmpty ∷ ∀ a. NonEmptyArray a → Effect a`

```purs
import Data.Array.NonEmpty (singleton)
import Effect.Shuffle (pickNonEmpty)

do
  ... <- pickNonEmpty $ singleton "a"
  -- "a"
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
