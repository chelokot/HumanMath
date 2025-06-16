import HumanMath.Natural.Basic
import HumanMath.Natural.Add
import HumanMath.Natural.Algebra

open HumanMath.Natural
open HumanMath.Algebra

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

  -- Test that Natural forms CommutativeMonoid
  let m : CommutativeMonoid Natural := inferInstance

  -- Test monoid operations
  IO.println "\nMonoid operations:"
  IO.println s!"op 2 1 = {m.op n2 n1}"
  IO.println s!"op 1 2 = {m.op n1 n2}"  -- should be same as above (commutative)
  IO.println s!"neutral element = {m.neutral}"

  -- Test that it's really commutative
  let test1 := m.op n2 n1
  let test2 := m.op n1 n2
  IO.println s!"Is commutative? {test1 == test2}"

  -- Test zero property
  IO.println "\nZero check:"
  IO.println s!"Is zero zero? {isZero Natural.zero}"
  IO.println s!"Is one zero? {isZero n1}"

  IO.println "\n=== Tests completed ===\n"
