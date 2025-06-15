/-
  HumanMath Library
  Natural/Compare.lean - Comparison operations for natural numbers with human-readable names
-/

import HumanMath.Natural.Basic

namespace HumanMath.Natural

def greaterOrEqual : Natural → Natural → Bool
  | _, Natural.zero => True
  | Natural.next n, Natural.next m => greaterOrEqual n m
  | Natural.zero, Natural.next _ => False

def greater (a b : Natural) : Bool := greaterOrEqual (Natural.next a) b
def less (a b : Natural) : Bool := greaterOrEqual b a
def lessOrEqual (a b : Natural) : Bool := greaterOrEqual b a
