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

-- 'add a b' is now 'a + b'
scoped infixl:65 " + " => add

theorem addZeroLeftIsIdentity (n : Natural):
Natural.zero + n = n
 := by induction n with
 | zero =>
   calc Natural.zero + Natural.zero
   = Natural.zero := by simp [add]
 | next n' inductionHypothesis =>
   calc Natural.zero + (Natural.next n')
   = Natural.next (Natural.zero + n') := by simp [add]
   _ = Natural.next n' := by rw [inductionHypothesis]

theorem addZeroRightIsIdentity (n : Natural):
add n Natural.zero = n
:= by rw[add]

theorem putNextAnywhereInAdd (n m : Natural):
n + (Natural.next m) = (Natural.next n) + m
  := by induction m with
  | zero =>
    calc n + (Natural.next Natural.zero)
    = Natural.next (n + Natural.zero) := by simp[add]
    _ = Natural.next n := by simp[add]
    _ = (Natural.next n) + Natural.zero := by simp[add]
  | next m' inductionHypothesis =>
    calc n + (Natural.next (Natural.next m'))
    = Natural.next (n + (Natural.next m')) := by simp[add]
    _ = Natural.next ((Natural.next n) + m') := by rw[inductionHypothesis]
    _ = (Natural.next n) + (Natural.next m') := by simp[add]

theorem addIsCommutative (n m : Natural):
n + m = m + n
  := by induction m with
  | zero =>
    calc n + Natural.zero
    = n := by simp[add]
    _ = Natural.zero + n := by rw [addZeroLeftIsIdentity]
  | next m' inductionHypothesisM =>
    calc n + (Natural.next m') =
    Natural.next (n + m') := by simp[add]
    _ = Natural.next (m' + n) := by rw[inductionHypothesisM]
    _ = m' + (Natural.next n) := by simp[add]
    _ = (Natural.next m') + n := by rw[putNextAnywhereInAdd]

theorem addIsAssociative (a b c : Natural):
(a + b) + c = a + (b + c)
  := by induction c with
  | zero =>
    calc (a + b) + Natural.zero
    = a + b := by simp[add]
    _ = a + (b + Natural.zero) := by simp[add]
  | next c' inductionHypothesisC =>
    calc (a + b) + (Natural.next c')
    = Natural.next ((a + b) + c') := by simp[add]
    _ = Natural.next (a + (b + c')) := by rw[inductionHypothesisC]
    _ = a + (Natural.next (b + c')) := by simp[add]
    _ = a + (b + (Natural.next c')) := by simp[add]


end HumanMath.Natural
