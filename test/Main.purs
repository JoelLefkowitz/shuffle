module Test.Main where

import Prelude

import Data.Array.NonEmpty (cons')
import Data.Maybe (Maybe(..))
import Data.Traversable (traverse)
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Shuffle (pick, pickMaybe, pickNonEmpty, pickOr, shuffle)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldContain, shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner.Node (runSpecAndExitProcess)

main ∷ Effect Unit
main = runSpecAndExitProcess [ consoleReporter ] do
  describe "shuffle" do
    it "shuffles an array" do
      let arr = [ "a", "b", "c" ]
      shuffled ← liftEffect $ shuffle arr
      void $ traverse (shouldContain shuffled) arr

  describe "pick" do
    it "picks an element from an array" do
      let arr = [ "a", "b", "c" ]
      picked ← liftEffect $ pick arr
      arr `shouldContain` picked

    it "defaults to mempty for an empty array" do
      picked ← liftEffect $ pick []
      picked `shouldEqual` ""

  describe "pickOr" do
    it "picks an element from an array" do
      let arr = [ 1, 2, 3 ]
      picked ← liftEffect $ pickOr 0 arr
      arr `shouldContain` picked

    it "defaults to a fallback for an empty array" do
      picked ← liftEffect $ pickOr 0 []
      picked `shouldEqual` 0

  describe "pickMaybe" do
    it "picks an element from an array" do
      let arr = [ "a", "b", "c" ]
      picked ← liftEffect $ pickMaybe arr
      (Just <$> arr) `shouldContain` picked

    it "defaults to a Nothing for an empty array" do
      let
        empty ∷ Array String
        empty = []
      picked ← liftEffect $ pickMaybe empty
      picked `shouldEqual` Nothing

  describe "pickNonEmpty" do
    it "picks an element from a non-empty array" do
      let arr = cons' "a" [ "b", "c" ]
      picked ← liftEffect $ pickNonEmpty arr
      arr `shouldContain` picked
