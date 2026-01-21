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
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/tellenc.nvim)](https://github.com/Freed-Wu/tellenc.nvim/graphs/contributors)。
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

## neovim 中文输入改进计划

我们的目标是：

- 性能优先：
  - 用纯 lua 编写的 neovim 插件可能存在性能瓶颈。
    不同于之前的 [neovim 中文输入改进计划](https://github.com/neo451/nvim-zh) 。
    我们鼓励利用各种现成的 C/C++/rust/go 等库实现 lua binding 来缓解性能问题。
    代价是需要额外的编译。我们鼓励将插件构建打包为 rocks 格式。目前支持安装 rocks
    安装包的 neovim 插件管理器有：
    - [lazy.nvim](https://github.com/folke/lazy.nvim): 项目的根目录下需要存在
      [`*-1.rockspec`](https://lazy.folke.io/packages#rockspec)
    - [rocks.nvim](https://github.com/lumen-oss/rocks.nvim): 需要将 `*.rockspec` 上传到
      <https://luarocks.org/> 。比起 lazy.nvim ，可以从 <https://lux.lumen-labs.org/rocks-binaries/>
  - 减少开销。调用命令行接口会带来进程 fork 的开销。
    - 鼓励实现为 lua binding 。例如 librime/cppjieba 等库。
    - 通过通信协议与正在运行的程序通信。例如通过 dbus 协议和系统
      [输入法](https://github.com/rimeinn/ime.nvim/tree/0.0.8/lua/dbus_proxy/proxies/ime)、
      [剪贴板](https://github.com/rimeinn/ime.nvim/blob/0.0.8/lua/dbus_proxy/proxies/clipper.lua)、
      [通知](https://github.com/rimeinn/ime.nvim/blob/0.0.8/lua/dbus_proxy/proxies/notifier.lua)
      通信。
      反面例子： tmux 的通信协议没有公开。必须通过命令行调用 tmux 。
      替代品 zellij 则公开了 JSON-RPC 通信协议。
      安装预编译好的 rocks 文件，节约构建时间。
- 接近原生 vim 功能：尽可能接近原生 vim 体验。比如 vim 的 w/b/e/ge 不支持中文分词。
  支持中文分词的 vim 插件也应该默认提供 w/b/e/ge 快捷键，而不是覆盖 W/B/E/gE 。
  同时也要支持 vim 的 count 用法： 3w 。
- 鼓励复用。
  - 不重复造轮子。充分利用已有的 lua 库作为依赖，让插件管理器来安装依赖。
  - 鼓励将插件分离为不依赖 neovim 的纯 lua 库，以供其他 lua 项目复用。
    neovim 提供了标准 lua 没有的 vim 模块。可以考虑用
    <https://github.com/rimeinn/rime.nvim/tree/main/packages/vim>
    作为兼容层。以 [rime.nvim](https://github.com/rimeinn/rime.nvim) 为例：
    - <https://github.com/rimeinn/rime.nvim/tree/main/lua/rime>: 该目录下除
      `nvim/` 外的代码均可在标准 lua 下运行。
    - <https://github.com/rimeinn/rime.nvim/tree/main/lua/rime/nvim>: 该目录下
      的代码需要 neovim 。
- 清晰文档。
  - 在 Binding 中提供库的使用方法。
  - 在 Related Projects 中列出已有的解决方法以及其不足之处。如能给出性能的 test
    bench 会更好
  - 在 Similar Projects 中列出相似项目以供参考。

### 中文输入法

[中文输入法的介绍](https://github.com/rimeinn/ime.nvim#introduction)。太长不看的总结如下：

- 不建议使用[单模式输入法](https://github.com/rimeinn/ime.nvim#single-mode-ime)。
  相比[多模式输入法](https://github.com/rimeinn/ime.nvim#multi-mode-ime)，
  单模式输入法的使用体验和系统输入法差异很大。如果坚持使用，建议使用
  [LSP](https://github.com/rimeinn/ime.nvim#lsp) 。因为 LSP 的跨编辑器性，可能会
  得到更好的维护。
- 对于[系统输入法](https://github.com/rimeinn/ime.nvim#ime-outside-vim)，注意到
  GNU/Linux 下的 ibus/fcitx 等均支持 dbus 通信协议。使用
  [ime.nvim](https://github.com/rimeinn/ime.nvim) 性能更好。对于 macOS/Windows
  输入法，目前没有通信协议或 lua binding 的支持。只能使用
  [命令行](https://github.com/rimeinn/ime.nvim#cli)。
- 对于 Vim 的[嵌入式输入法](https://github.com/rimeinn/ime.nvim#ime-inside-vim)，
  推荐：
  - [rime.nvim](https://github.com/rimeinn/rime.nvim)：使用 librime 的 lua binding
  - [fcitx5-ui.nvim](https://github.com/black-desk/fcitx5-ui.nvim)：使用 dbus 和
    fcitx 通信

### 拼音模糊搜索

在 vim 中输入 `/pinyin` 搜索到 `拼音` 。
这里有一些 [插件](https://github.com/neo451/nvim-zh#%E6%90%9C%E7%B4%A2) 。
替代方案是直接用中文输入法输入汉字选中后搜索。

### 中文分词跳转

参见 [jieba.nvim](https://github.com/rimeinn/jieba.nvim) 。

### 中文 linter/formatter

现在主流的 linter/formatter 都是基于 LSP 的实现。但基本都只支持英文。
这里有一些非 LSP 的中文
[linter/formatter](https://github.com/neo451/nvim-zh#linter) 。

### 中文字符编码识别

在 vim 中 `:edit ++filencoding=ENCODING test.txt` 会用 `ENCODING` 编码打开
`test.txt` 。如果用户没有显式传入 `++filencoding` ，则按照 `:set fileencodings`
的顺序查找。这可能会使用错误的编码导致乱码。注意到中文中有很多高频汉字，例如“的”，
所以可以通过查找高频汉字的编码来预测字符编码。
[tellenc](https://github.com/adah1972/tellenc) 使一个基于此原理来预测字符编码的
软件。 tellenc 不能保证预测一定正确，所以一旦预测失败，仍然需要通过
`:edit ++filencoding=ENCODING test.txt` 手动干预。

- [vim-fencview](https://github.com/mbbill/fencview): 通过命令行调用 tellenc
- 本项目。提供了：
  - 一个 tellenc 的 lua binding
  - neovim 插件

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

## Binding

```lua
local tellenc = require "tellenc".tellenc
local enc = tellenc "abc"
-- ascii
local enc = tellenc "你好"
-- utf-8
```
