type foo;
/**
 * this binding works as expected
 */ [@bs.val] external foo: foo = "foo";

/**
 * this binding shows a warning at `bs.unwrap`
 * Warning 101: Unused BuckleScript attribute: bs.unwrap
 */
[@bs.val]
external bar: ([@bs.unwrap] [ | `Int(int) | `Str(string)]) => foo = "bar";

/**
 * this binding shows a warning at the polymorphic variant
 * Warning 103: BuckleScript FFI warning: Here a OCaml polymorphic variant type
 * passed into JS, probably you forgot annotations like `[@bs.int]` or `[@bs.string]`
 */
// [@bs.val]
// external baz: [ | `Int(int) | `Str(string)] => foo = "baz";

/**
 * this binding shows a warning at `bs.string`
 * Warning 101: Unused BuckleScript attribute: bs.unwrap
 * and another one at `bs.as
 * Warning 101: Unused BuckleScript attribute: bs.unwrap
 * Removing `bs.as` raises the following error:
 * The implementation src/Demo.re
       does not match the interface src/demo-Unwrapwarning.cmi:
       Values do not match:
         [@bs...] external barString: [ `Bar | `Foo ] => foo = "bar"
       is not included in
         [@bs...] external barString: [ `Bar | `Foo ] => foo = "bar"
       File "src/Demo.re", line 10, characters 0-91:
         Actual declaration
 */
[@bs.val]
external barString: ([@bs.string] [ | `Foo | [@bs.as "baz"]  `Bar]) => foo = "bar";

/**
 * this binding shows a warning at the polymorphic variant
 * Warning 103: BuckleScript FFI warning: Here a OCaml polymorphic variant type
 * passed into JS, probably you forgot annotations like `[@bs.int]` or `[@bs.string]`
 * Uncommenting this binding would raise an error:
 * Some fatal warnings were triggered (1 occurrences)
 */
// [@bs.val]
// external bazString: [ | `Foo | [@bs.as "baz"] `Bar] => foo = "baz";

/**
 * this binding shows a warning at `bs.int`
 * Warning 101: Unused BuckleScript attribute: bs.unwrap
 * and another one at `bs.as
 * Warning 101: Unused BuckleScript attribute: bs.unwrap
 */
[@bs.val]
external barInt: ([@bs.int] [ | `Foo | [@bs.as 10] `Bar]) => foo = "bar";

/**
 * this binding shows a warning at the polymorphic variant
 * Warning 103: BuckleScript FFI warning: Here a OCaml polymorphic variant type
 * passed into JS, probably you forgot annotations like `[@bs.int]` or `[@bs.string]`
 * Uncommenting this binding would raise an error:
 * Some fatal warnings were triggered (1 occurrences)
 */
// [@bs.val]
// external bazInt: [ | `Foo | [@bs.as 10] `Bar] => foo = "baz";
