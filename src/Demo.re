type foo;
[@bs.val] external foo: foo = "foo";

[@bs.val]
external bar: ([@bs.unwrap] [ | `Int(int) | `Str(string)]) => foo = "bar";

// [@bs.val]
// external baz: ([@bs.unwrap] [ | `Int(int) | `Str(string)]) => foo = "baz";

[@bs.val]
external barString: ([@bs.string] [ | `Foo | [@bs.as "baz"] `Bar]) => foo = "bar";

// [@bs.val]
// external bazString: ([@bs.string] [ | `Foo | [@bs.as "baz"] `Bar]) => foo = "baz";

[@bs.val]
external barInt: ([@bs.int] [ | `Foo | [@bs.as 10] `Bar]) => foo = "bar";

// [@bs.val]
// external bazInt: ([@bs.int] [ | `Foo | [@bs.as 10]  `Bar]) => foo = "baz";