let config = ./spago.dhall

let thisConfig =
      { name = "foo"
      , dependencies =
        [ "aff", "console", "effect", "node-buffer", "node-fs", "node-fs-aff" ]
      , sources = [ "test/**/*.purs" ]
      , packages = ./packages.dhall
      }

in      config
    //  { sources = config.sources # thisConfig.sources
        , dependencies = config.dependencies # thisConfig.dependencies
        }
