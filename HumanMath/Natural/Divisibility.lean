import HumanMath.Natural.Multiply

namespace HumanMath.Natural

def divides (a b : Natural) : Prop :=
  ∃ k : Natural, a * k = b

scoped infixl:50 " ∣ " => divides

theorem zeroDividesZero:
Natural.zero ∣ Natural.zero
  := by
  exists Natural.zero

theorem zeroOnlyDividesZero (a : Natural) :
Natural.zero ∣ a → a = Natural.zero
  := by
  intro premise
  cases premise with
  | intro k premiseForK =>
    calc a
      = Natural.zero * k := by rw[premiseForK]
      _ = Natural.zero := by rw [leftMultiplyByZeroIsZero]

def isUnit (a : Natural) : Prop :=
  a ∣ Natural.one

def isIrreducible (p : Natural) : Prop :=
  ¬(p = Natural.zero) ∧ ¬(isUnit p) ∧ (
    ∀ d : Natural,
      d ∣ p → (isUnit d) ∨ (d = p)
  )

def isPrime (p : Natural) : Prop :=
  ¬(p = Natural.zero) ∧ ¬(isUnit p) ∧ (
    ∀ a b : Natural,
      p ∣ a * b → (p ∣ a) ∨ (p ∣ b)
  )

end HumanMath.Natural
