/-
  HumanMath Library
  Natural/Add.lean - Addition operations for natural numbers with human-readable names
-/

import HumanMath.Natural.Basic
namespace HumanMath.Natural

/--
  Addition of natural numbers.
  Defined recursively:
  - n + 0 = n
  - n + (m + 1) = (n + m) + 1
-/
def add (n m : Natural): Natural :=
  match m with
  | Natural.zero => n
  | Natural.next m' => Natural.next (add n m')

/-- Make + operator work for Natural ??? -/
instance : Add Natural where
  add := add

theorem addZeroLeftIsIdentity (n : Natural):
add Natural.zero n = n
 := by induction n with
 | zero =>
   calc add Natural.zero Natural.zero
   = Natural.zero := by simp [add]
 | next n' inductionHypothesis =>
   calc add Natural.zero (Natural.next n')
   = Natural.next (add Natural.zero n') := by simp [add]
   _ = Natural.next n' := by rw [inductionHypothesis]

theorem putNextAnywhereInAdd (n m : Natural):
add n (Natural.next m) = add (Natural.next n) m
  := by induction m with
  | zero =>
    calc add n (Natural.next Natural.zero)
    = Natural.next (add n Natural.zero) := by simp[add]
    _ = Natural.next n := by simp[add]
    _ = add (Natural.next n) Natural.zero := by simp[add]
  | next m' inductionHypothesis =>
    calc add n (Natural.next (Natural.next m'))
    = Natural.next (add n (Natural.next m')) := by simp[add]
    _ = Natural.next (add (Natural.next n) m') := by rw[inductionHypothesis]
    _ = add (Natural.next n) (Natural.next m') := by simp[add]

theorem addIsCommutative (n m : Natural) : add n m = add m n := by
 induction m with
  | zero =>
    calc add n Natural.zero
    = n := by simp[add]
    _ = add Natural.zero n := by rw [addZeroLeftIsIdentity]
  | next m' inductionHypothesisM =>
    calc add n (Natural.next m') =
    Natural.next (add n m') := by simp[add]
    _ = Natural.next (add m' n) := by rw[inductionHypothesisM]
    _ = add m' (Natural.next n) := by simp[add]
    _ = add (Natural.next m') n := by rw[putNextAnywhereInAdd]



end HumanMath.Natural
