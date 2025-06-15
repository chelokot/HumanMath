/-
  HumanMath: A human-readable mathematics library
  Examples and tests of our Natural number implementation
-/

import HumanMath

def main : IO Unit := do
  -- Let's create some numbers
  let zero := Natural.zero
  let five := Natural.five
  let three := Natural.three

  -- Basic display
  IO.println "\n=== Basic Numbers ==="
  IO.println s!"zero: {zero}"
  IO.println s!"five: {five}"
  IO.println s!"three: {three}"

  -- Test addition
  let sum1 := five + three
  let sum2 := three + five
  IO.println "\n=== Addition Tests ==="
  IO.println s!"5 + 3 = {sum1}"
  IO.println s!"3 + 5 = {sum2}"
  IO.println s!"Are they equal? {Natural.equals sum1 sum2}"

  -- Test properties
  IO.println "\n=== Number Properties ==="
  IO.println s!"Is zero zero? {Natural.isZero zero}"
  IO.println s!"Is five zero? {Natural.isZero five}"

  -- Test increments
  let six := Natural.increment five
  IO.println "\n=== Increment Tests ==="
  IO.println s!"five + 1 = {six}"
  IO.println s!"Is it same as 3 + 3? {Natural.equals six (three + three)}"

  -- All good!
  IO.println "\n=== Tests Complete ===\n"
