# tellenc.nvim

[![readthedocs](https://shields.io/readthedocs/tellenc-nvim)](https://tellenc-nvim.readthedocs.io)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/tellenc.nvim/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/tellenc.nvim/main)
[![github/workflow](https://github.com/Freed-Wu/tellenc.nvim/actions/workflows/main.yml/badge.svg)](https://github.com/Freed-Wu/tellenc.nvim/actions)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/tellenc.nvim/total)](https://github.com/Freed-Wu/tellenc.nvim/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/tellenc.nvim/latest/total)](https://github.com/Freed-Wu/tellenc.nvim/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim)
[![github/v](https://shields.io/github/v/release/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim)

[![luarocks](https://img.shields.io/luarocks/v/Freed-Wu/tellenc.nvim)](https://luarocks.org/modules/Freed-Wu/tellenc.nvim)

Transplant [tellenc](https://github.com/adah1972/tellenc) to neovim.

It uses tellenc's lua port to detect a file's encoding, then run
`edit ++filencoding=ENCODING` in vim. If the detection is invalid, run the
command by yourself according to your guessed encoding.

## Install

### rocks.nvim

#### Command style

```vim
:Rocks install tellenc.nvim
```

#### Declare style

`~/.config/nvim/rocks.toml`:

```toml
[plugins]
"tellenc.nvim" = "scm"
```

Then

```vim
:Rocks sync
```

or:

```sh
$ luarocks --lua-version 5.1 --local --tree ~/.local/share/nvim/rocks install tellenc.nvim
# ~/.local/share/nvim/rocks is the default rocks tree path
# you can change it according to your vim.g.rocks_nvim.rocks_path
```

### lazy.nvim

```lua
require("lazy").setup {
  spec = {
    { "Freed-Wu/tellenc.nvim", lazy = false },
  },
}
```

## Similar Projects

- [vim-fencview](https://github.com/mbbill/fencview): contains a detect
  mechanism written in vim script and allow user to use external program like
  tellenc
