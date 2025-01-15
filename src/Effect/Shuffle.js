import shuffled from "shuffle-array";

export const shuffle = (arr) => () => shuffled(arr);

export const pickOr = (fallback) => (arr) => () =>
  arr.length > 0 ? shuffled(arr)[0] : fallback;

export const pickMaybeImpl = (just) => (nothing) => (arr) => () =>
  arr.length > 0 ? just(shuffled(arr)[0]) : nothing;

export const pickNonEmpty = (arr) => () => shuffled(arr)[0];
