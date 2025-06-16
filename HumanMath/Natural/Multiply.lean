/-
  HumanMath Library
  Natural/Add.lean - Addition operations for natural numbers with human-readable names
-/

import HumanMath.Natural.Basic
import HumanMath.Natural.Add

namespace HumanMath.Natural

/--
  Multiplication of natural numbers.
  Defined recursively:
  - a * 0 = 0
  - a * next(b) = a * b + a
-/
def multiply: Natural → Natural → Natural
  | _, Natural.zero => Natural.zero
  | n, Natural.next m => (multiply n m) + n

scoped infixl:70 " * " => multiply

theorem leftMultiplyByZeroIsZero (n : Natural):
Natural.zero * n = Natural.zero
 := by induction n with
 | zero =>
   calc Natural.zero * Natural.zero
   = Natural.zero := by simp [multiply]
 | next n' inductionHypothesis =>
   calc Natural.zero * (Natural.next n')
   = Natural.zero * n' + Natural.zero := by simp [multiply]
   _ = Natural.zero * n' := by rw[addZeroRightIsIdentity]
   _ = Natural.zero := by rw [inductionHypothesis]

theorem oneIsLeftNeuralForMultiply (n : Natural):
Natural.one * n = n
  := by induction n with
  | zero =>
    calc Natural.one * Natural.zero
    = Natural.zero := by simp[multiply]
  | next n' inductionHypothesis =>
    calc Natural.one * Natural.next n'
    = Natural.one * n' + Natural.one := by simp[multiply]
    _ = n' + Natural.one := by rw[inductionHypothesis]
    _ = n' + Natural.next Natural.zero := by rw[Natural.one]
    _ = Natural.next (n' + Natural.zero) := by simp[add]
    _ = Natural.next n' := by simp[add]

theorem multiplyIsRightDistributiveOverAdd (a b c : Natural):
(a + b) * c = a * c + b * c
  := by induction c with
  | zero =>
    calc (a + b) * Natural.zero
    = Natural.zero := by simp[multiply]
    _ = Natural.zero + Natural.zero := by simp[add]
    _ = a * Natural.zero + b * Natural.zero := by simp[multiply]
  | next c' inductionHypothesis =>
    calc (a + b) * Natural.next c'
    = (a + b) * c' + (a + b) := by simp[multiply]
    _ = a * c' + b * c' + (a + b) := by rw[inductionHypothesis]
    _ = a * c' + b * c' + (b + a) := by simp[addIsCommutative]
    _ = a * c' + (b * c' + b) + a := by simp[addIsAssociative]
    _ = a * c' + b * Natural.next c' + a := by simp[multiply]
    _ = a * c' + (b * Natural.next c' + a) := by simp[addIsAssociative]
    _ = a * c' + (a + b * Natural.next c') := by simp[addIsCommutative]
    _ = (a * c' + a) + b * Natural.next c' := by simp[addIsAssociative]
    _ = a * Natural.next c' + b * Natural.next c' := by simp[multiply]

theorem multiplyIsLeftDistributiveOverAdd (a b c : Natural):
a * (b + c) = a * b + a * c
  := by induction c with
  | zero =>
    calc a * (b + Natural.zero)
    = a * b := by rw[addZeroRightIsIdentity]
    _ = a * b + Natural.zero := by simp[add]
    _ = a * b + a * Natural.zero := by simp[multiply]
  | next c' inductionHypothesis =>
    calc a * (b + Natural.next c')
    = a * Natural.next (b + c') := by simp[add]
    _ = a * (b + c') + a := by simp[multiply]
    _ = a * b + a * c' + a := by rw[inductionHypothesis]
    _ = a * b + (a * c' + a) := by rw[addIsAssociative]
    _ = a * b + a * Natural.next c' := by simp[multiply]

theorem multiplyIsCommutative (a b : Natural):
a * b = b * a
  := by induction b with
  | zero =>
    calc a * Natural.zero
    = Natural.zero := by simp[multiply]
    _ = Natural.zero * a := by rw [leftMultiplyByZeroIsZero]
  | next b' inductionHypothesis =>
    calc a * (Natural.next b') =
    a * b' + a := by simp[multiply]
    _ = b' * a + a := by rw[inductionHypothesis]
    _ = b' * a + Natural.one * a := by rw[oneIsLeftNeuralForMultiply]
    _ = (b' + Natural.one) * a := by rw[multiplyIsRightDistributiveOverAdd]
    _ = (b' + Natural.next Natural.zero) * a := by rw[Natural.one]
    _ = Natural.next (b' + Natural.zero) * a := by simp[add]
    _ = Natural.next b' * a := by simp[add]

end HumanMath.Natural
