namespace HumanMath.Natural

/-- Natural numbers with clear, human-readable names -/
inductive Natural where
  | zero : Natural
  | next : Natural → Natural
  deriving Repr

/-- Convert Natural to String -/
def toString : Natural → String
  | Natural.zero => "0"
  | Natural.next n => s!"({toString n} + 1)"

instance : ToString Natural where
  toString := toString

/-- Common number constants -/
def one : Natural := Natural.next Natural.zero
def two : Natural := Natural.next one
def three : Natural := Natural.next two
def four : Natural := Natural.next three
def five : Natural := Natural.next four

/-- Check if a number is zero -/
def isZero : Natural → Bool
  | Natural.zero => true
  | Natural.next _ => false

/-- Get previous number (returns none for zero) -/
def previous : Natural → Option Natural
  | Natural.zero => none
  | Natural.next n => some n

/-- Compare two natural numbers for equality -/
def equals : Natural → Natural → Bool
  | Natural.zero, Natural.zero => true
  | Natural.next x, Natural.next y => equals x y
  | _, _ => false

/-- Increment a number -/
def increment (n : Natural) : Natural := Natural.next n

end HumanMath.Natural
