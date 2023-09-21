{ name = "render-html"
, license = "MIT"
, dependencies =
  [ "arrays"
  , "dom-indexed"
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
  , "web-pointerevents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
