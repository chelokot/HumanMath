namespace HumanMath.Algebra

class Monoid (M : Type) where
  op: M → M → M

  neutral: M

  neutralLeft (a : M): op neutral a = a
  neutralRight (a : M): op a neutral = a
  associative (a b c : M): op (op a b) c = op a (op b c)

class CommutativeMonoid (M : Type) extends Monoid M where
  commutative (a b : M) : op a b = op b a

end HumanMath.Algebra
