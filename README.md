<!-- markdownlint-disable -->
<br />
<div align="center">
  <a href="https://github.com/nvim-neorocks/rocks-dev.nvim">
    <img src="./rocks-header.svg" alt="rocks-dev.nvim">
  </a>
  <p align="center">
    <!-- <br /> -->
    <!-- <a href="./doc/rocks-dev.txt"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <br />
    <a href="https://github.com/nvim-neorocks/rocks-dev.nvim/issues/new?assignees=&labels=bug">Report Bug</a>
    ·
    <a href="https://github.com/nvim-neorocks/rocks-dev.nvim/issues/new?assignees=&labels=enhancement">Request Feature</a>
    ·
    <a href="https://github.com/nvim-neorocks/rocks.nvim/discussions/new?category=q-a">Ask Question</a>
  </p>
  <p>
    <strong>
      A Swiss army knife for building and testing <a href="https://github.com/nvim-neorocks/rocks.nvim/">rocks.nvim</a> modules.
    </strong>
  </p>
</div>
<!-- markdownlint-restore -->

[![LuaRocks][luarocks-shield]][luarocks-url]

## :star2: Summary

`rocks-dev.nvim` extends [`rocks.nvim`](https://github.com/nvim-neorocks/rocks.nvim)
with the ability to install dev plugins locally.

## :hammer: Installation

Simply run `:Rocks install rocks-dev.nvim`,
and you are good to go!

## :books: Usage

With this extension, you can add a `dir` field table to plugins in your `rocks.toml`,
for example:

```toml
[plugins."sweetie.nvim"]
dir = "~/git/nvim/sweetie.nvim"
```

This extension also supports `dev.path`, which allows you to provide the path to where local plugins
are stored. You can tell rocks-dev to load a plugin from that path with `dev = true`, for example:

```toml
[dev]
path = "~/Projects"

[plugins]
"sweetie.nvim" = { dev = true }
```

When both `dir` and `dev = true` are present, `dir` gets priority.

## :electric_plug: `rocks-config` interoperability

You can use [`rocks-config.nvim >= 2.0.0`](https://github.com/nvim-neorocks/rocks-config.nvim) 
to configure `dev` plugins, however, it does not currently work with [bundles](https://github.com/nvim-neorocks/rocks-config.nvim?tab=readme-ov-file#plugin-bundles).

## :book: License

`rocks-dev.nvim` is licensed under [GPLv3](./LICENSE).

[luarocks-shield]: https://img.shields.io/luarocks/v/neorocks/rocks-dev.nvim?logo=lua&color=purple&style=for-the-badge
[luarocks-url]: https://luarocks.org/modules/neorocks/rocks-dev.nvim
