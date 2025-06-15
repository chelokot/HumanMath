# HumanMath

A human-readable mathematics library for Lean 4. Because math should be readable by humans, not just machines.

## Features

- Natural numbers with clear naming (`zero`, `next`, etc.)
- Basic arithmetic operations
- Easy-to-understand comparison functions
- No cryptic mathematical notation

## Example

```lean
import HumanMath.Natural.Basic
import HumanMath.Natural.Add

-- Create numbers
let two := Natural.next (Natural.next Natural.zero)
let three := Natural.next two

-- Compare numbers
let isGreater := greaterOrEqual three two  -- true
