{ name = "render-html"
, license = "MIT"
, dependencies =
  [ "arrays"
  , "datetime"
  , "foldable-traversable"
  , "maybe"
  , "media-types"
  , "newtype"
  , "prelude"
  , "safe-coerce"
  , "strings"
  , "tuples"
  , "typelevel-prelude"
  , "unsafe-coerce"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
