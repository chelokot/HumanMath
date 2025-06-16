import HumanMath.Algebra.Monoid
namespace HumanMath.Algebra

class Group (G : Type) extends Monoid G where
  inverse: G → G
  inverseLeft (a : G): op (inverse a) a = neutral
  inverseRight (a : G): op a (inverse a) = neutral

class CommutativeGroup (G : Type) extends Group G, CommutativeMonoid G

end HumanMath.Algebra
