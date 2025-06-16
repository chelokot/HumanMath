/-
  HumanMath: A human-readable mathematics library
  Main entry point that re-exports all components
-/

-- Basic components
import HumanMath.Natural.Basic
import HumanMath.Natural.Add
import HumanMath.Natural.Algebra
import HumanMath.Algebra.Monoid

/-! # Module Documentation

This is the main entry point for the HumanMath library.
It provides human-readable mathematical operations and proofs.

## Features
- Natural numbers with clear naming
- Basic arithmetic operations
- Simple and readable syntax
- Algebraic structures with clear definitions

## Usage Example
```lean
import HumanMath.Natural.Basic

def five := Natural.five
def three := Natural.three
def sum := Natural.add five three
#eval sum
```
-/

namespace HumanMath

/- Check that our Natural forms a CommutativeMonoid -/
example : HumanMath.Algebra.CommutativeMonoid Natural := inferInstance

end HumanMath
