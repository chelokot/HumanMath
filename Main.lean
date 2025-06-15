import HumanMath.Natural.Basic
import HumanMath.Natural.Add

open HumanMath.Natural

def main : IO Unit := do
  IO.println "\n=== Testing HumanMath Library ==="

  -- Test basic numbers
  let n1 := Natural.next Natural.zero
  let n2 := Natural.next n1
  let n3 := Natural.next n2

  IO.println "\nBasic numbers:"
  IO.println s!"1 = {n1}"
  IO.println s!"2 = {n2}"
  IO.println s!"3 = {n3}"

  -- Test addition
  let sum := add n2 n1
  IO.println "\nAddition:"
  IO.println s!"2 + 1 = {sum}"

  -- Test zero property
  IO.println "\nZero check:"
  IO.println s!"Is zero zero? {isZero Natural.zero}"
  IO.println s!"Is one zero? {isZero n1}"

  IO.println "\n=== Tests completed ===\n"
