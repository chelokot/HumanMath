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
theorem zeroIsNotNext (a : Natural):
Natural.next a ≠ Natural.zero
  := by
  intro hypothesis
  cases hypothesis

theorem nextIsPlusOne (a : Natural):
Natural.next a = a + Natural.one
  := by
  calc Natural.next a
  = Natural.next (a + Natural.zero) := by simp[add]
  _ = a + (Natural.next Natural.zero) := by simp[add]
  _ = a + Natural.one := by simp[Natural.one]

theorem nextInjective (a b : Natural):
Natural.next a = Natural.next b → a = b
  := by
  intro hypothesis
  cases hypothesis
  rfl

theorem additionInjective (a b c : Natural):
a + c = b + c → a = b
  := by
  intro premise
  induction c with
  | zero =>
    calc a
    = a + Natural.zero := by simp[add]
    _ = b + Natural.zero := by rw[premise]
    _ = b := by simp[add]
  | next c' inductionHypothesis =>
    have step1 : Natural.next (add a c') = Natural.next (b + c') := by simpa [add] using premise
    have step2 : a + c' = b + c' := nextInjective (a + c') (b + c') step1
    exact inductionHypothesis step2

theorem oneDoesNotHaveLeftInverse (a : Natural):
a + Natural.one ≠ Natural.zero
  := by
  intro hypothesis
  cases a with
  | zero =>
    have : Natural.next Natural.zero = Natural.zero := by
      calc Natural.next Natural.zero
        = Natural.one := by rw[Natural.one]
        _ = Natural.one + Natural.zero := by simp[add]
        _ = Natural.zero + Natural.one := by rw[Natural.addIsCommutative]
        _ = Natural.zero := by rw[hypothesis]
    exact zeroIsNotNext Natural.zero this
  | next n =>
    have : Natural.next (one + n) = Natural.zero := by
      calc Natural.next (one + n)
      _ = one + (Natural.next n) := by simp[add]
      _ = (Natural.next n) + one := by rw[Natural.addIsCommutative]
      _ = Natural.zero := by rw[hypothesis]
    exact zeroIsNotNext (one + n) this

theorem naturalNotGroup:
¬ ∃ inst : HumanMath.Algebra.Group Natural,
    inst.op      = add ∧
    inst.neutral = Natural.zero
  := by
  intro assumption
  rcases assumption with ⟨inst, assumptionOp, assumptionNeural⟩

  have h1 : (inst.inverse Natural.one) + Natural.one = Natural.zero := by
    simpa [assumptionOp, assumptionNeural] using inst.inverseLeft Natural.one

  exact oneDoesNotHaveLeftInverse (inst.inverse Natural.one) h1

end HumanMath.Natural
