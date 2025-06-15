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
def add : Natural → Natural → Natural
  | n, Natural.zero => n
  | n, Natural.next m => Natural.next (add n m)

/-- Add one to a number -/
def addOne (n : Natural) : Natural := Natural.next n

/-- Add zero to a number (identity function) -/
def addZero (n : Natural) : Natural := n

/-- Make + operator work for Natural -/
instance : Add Natural where
  add := add

end HumanMath.Natural
