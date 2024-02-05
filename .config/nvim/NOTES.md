#### lazy.nvim plugin specification

##### opts

`opts` either set to a `table` or a `function(_, opts:table)`

- merge with parent specs: `opts` should be a table 

- overwrite parent specs: returns a table -- `opts` a function returning a table?

- change parent spec: `opts` function modifying previously set options
    ```
    opts = function(_, opts)
      opts.completion = {
        completeopt = "menu,noselect",
      }
    end,
    ```
Resulting `opts` is run as `config(_, opts)`, see below.

##### config

`config` either set to `function(_, opts:table)` or `true`

Run on plugin load. By default runs `setup(opts)`.
