import Lake
open Lake DSL

package «humanmath» where
  -- Package metadata
  lean_lib «HumanMath» where
    roots := #[`HumanMath]

  -- Main executable
  lean_exe «humanmath» where
    root := `Main
