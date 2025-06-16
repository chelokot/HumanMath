/-
  HumanMath Library
  Natural/Add.lean - Addition operations for natural numbers with human-readable names
-/

import HumanMath.Natural.Basic
import HumanMath.Natural.Add
import HumanMath.Algebra.Monoid
import HumanMath.Algebra.Group
namespace HumanMath.Natural

-- Commutative Monoid
instance : HumanMath.Algebra.CommutativeMonoid Natural where
  op := add
  neutral := Natural.zero

  neutralLeft  := addZeroLeftIsIdentity
  neutralRight := addZeroRightIsIdentity
  associative  := addIsAssociative
  commutative  := addIsCommutative

-- Not a group
theorem zeroIsNotNext (a : Natural) : Natural.next a ≠ Natural.zero := by
  intro hypothesis
  cases hypothesis
theorem nextIsPlusOne (a : Natural) : Natural.next a = add a Natural.one := by
  calc Natural.next a
  = Natural.next (add a Natural.zero) := by simp[add]
  _ = add a (Natural.next Natural.zero) := by simp[add]
  _ = add a Natural.one := by simp[Natural.one]
theorem nextInjective (a b : Natural) : Natural.next a = Natural.next b → a = b := by
  intro hypothesis
  cases hypothesis
  rfl
theorem additionInjective (a b c : Natural) : add a c = add b c → a = b := by
  intro premise
  induction c with
  | zero =>
    calc a
    = add a Natural.zero := by simp[add]
    _ = add b Natural.zero := by rw[premise]
    _ = b := by simp[add]
  | next c' inductionHypothesis =>
    have step1 : Natural.next (add a c') = Natural.next (add b c') := by simpa [add] using premise
    have step2 : add a c' = add b c' := nextInjective (add a c') (add b c') step1
    exact inductionHypothesis step2

theorem oneDoesNotHaveLeftInverse (a : Natural) : Natural.add a Natural.one ≠ Natural.zero := by
  intro hypothesis
  cases a with
  | zero =>
    have : Natural.next Natural.zero = Natural.zero := by
      calc Natural.next Natural.zero
        = Natural.one := by rw[Natural.one]
        _ = Natural.add Natural.one Natural.zero := by simp[add]
        _ = Natural.add Natural.zero Natural.one := by rw[Natural.addIsCommutative]
        _ = Natural.zero := by rw[hypothesis]
    exact zeroIsNotNext Natural.zero this
  | next n =>
    have : Natural.next (add one n) = Natural.zero := by
      calc Natural.next (add one n)
      _ = add one (Natural.next n) := by simp[add]
      _ = add (Natural.next n) one := by rw[Natural.addIsCommutative]
      _ = Natural.zero := by rw[hypothesis]
    exact zeroIsNotNext (add one n) this

theorem natural_not_group :
    ¬ ∃ inst : HumanMath.Algebra.Group Natural,
        inst.op      = add ∧
        inst.neutral = Natural.zero := by
  intro h
  rcases h with ⟨inst, hop, hneutral⟩

  have h1 : add (inst.inverse Natural.one) Natural.one = Natural.zero := by
    simpa [hop, hneutral] using inst.inverseLeft Natural.one

  exact oneDoesNotHaveLeftInverse (inst.inverse Natural.one) h1

end HumanMath.Natural
