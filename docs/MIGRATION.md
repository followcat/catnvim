# 从当前配置迁移到 CatNvim

## 配置同步完成 ✅

CatNvim 现在已经完全同步你当前的 nvim 配置！

## 🎨 主题

**当前配置**: Catppuccin Frappe  
**CatNvim**: ✅ Catppuccin Frappe (已同步)

## ⌨️ 快捷键对比

### 完全一致的快捷键

| 功能 | 快捷键 | 说明 |
|------|--------|------|
| 文件浏览器 | `<F9>` | 打开/关闭 Neo-tree |
| Git 状态 | `<F8>` | 浮动窗口显示 Git 状态 |
| 代码大纲 | `<F7>` | 打开/关闭 Aerial 大纲 |
| 浮动终端 | `<Alt-u>` | 打开浮动终端 |
| 底部终端 | `<Alt-b>` | 打开底部终端 |
| 查找文件 | `<leader>ff` | Telescope 查找文件 |
| 实时搜索 | `<leader>gg` | Telescope 实时搜索 |
| 搜索光标词 | `<leader>cc` | Telescope 搜索当前词 |
| 缓冲区列表 | `<leader>bb` | Telescope 缓冲区列表 |
| 窗口导航 | `<C-hjkl>` | 在窗口间跳转 |
| 切换标签页 | `<leader>tt` | BufferLine 选择标签 |

### AI 助手快捷键 (新增)

| 功能 | 快捷键 | 说明 |
|------|--------|------|
| CodeCompanion | `<F3>` | 打开 AI 聊天 |
| Telescope | `<F4>` | Telescope 菜单 |
| ChatGPT | `<F5>` | ChatGPT 界面 |
| GPT 新对话 | `<C-g>c` | 创建新 GPT 对话 |
| GPT 切换 | `<C-g>t` | 切换 GPT 窗口 |
| 选中搜索 | `<C-g>` (Visual) | 搜索选中文本 |

### LSP 快捷键

| 功能 | 快捷键 | 说明 |
|------|--------|------|
| 跳转定义 | `gd` | Go to definition |
| 跳转引用 | `gr` | Go to references |
| 跳转声明 | `gD` | Go to declaration |
| 跳转实现 | `gi` | Go to implementation |
| 重命名 | `<leader>re` | LSP rename |
| 格式化 | `<leader>vv` | Format code |

### 窗口调整

| 功能 | 快捷键 | 说明 |
|------|--------|------|
| 左边缩小 | `<C-Alt-h>` | Resize left |
| 下边扩大 | `<C-Alt-j>` | Resize down |
| 上边缩小 | `<C-Alt-k>` | Resize up |
| 右边扩大 | `<C-Alt-l>` | Resize right |

### Diff View

| 功能 | 快捷键 | 说明 |
|------|--------|------|
| 打开 Diff | `<leader>df` | DiffView Open |
| 关闭 Diff | `<leader>dc` | DiffView Close |

## 🔧 配置文件对应关系

### 当前配置 → CatNvim

```
~/.config/nvim/               →  ~/Projects/catnvim/
├── lua/basic.lua             →  lua/basic.lua (✅ 已同步)
├── lua/custom_keys.lua       →  lua/custom_keys.lua (✅ 已同步)
├── lua/custom_opts.lua       →  lua/custom_opts.lua (✅ 已同步)
├── lua/plugins/colorschemes  →  lua/plugins/colorschemes.lua (✅ 已同步)
└── init.lua                  →  init.lua (✅ 增强版)
```

## 🎯 保留的特性

✅ **完全保留**:
- Catppuccin Frappe 主题
- 所有快捷键习惯
- 窗口导航模式
- 终端使用习惯
- 文件浏览器行为
- LSP 配置
- 基础编辑器设置

## ✨ 新增功能

🆕 **增强功能**:
- GitHub Copilot 集成
- CodeCompanion AI 聊天
- ChatGPT 插件
- GP.nvim 高级 GPT 集成
- 更好的 Markdown 支持
- 会话管理
- Zen 模式
- 更多主题选项

## 📝 迁移步骤

### 方案 1: 完全替换（推荐）

```bash
# 1. 备份当前配置
mv ~/.config/nvim ~/.config/nvim.backup

# 2. 链接到 catnvim
ln -s /home/followcat/Projects/catnvim ~/.config/nvim

# 3. 启动 Neovim
nvim

# 4. 等待插件安装完成
# 第一次启动会自动安装所有插件

# 5. 安装 LSP 服务器
:LspInstall pyright lua_ls bashls
```

### 方案 2: 逐步测试

```bash
# 1. 保留当前配置，用不同路径测试
export NVIM_APPNAME=catnvim
cd /home/followcat/Projects/catnvim
nvim

# 2. 测试满意后再替换
unset NVIM_APPNAME
mv ~/.config/nvim ~/.config/nvim.backup
ln -s /home/followcat/Projects/catnvim ~/.config/nvim
```

## 🐛 迁移后检查清单

- [ ] 主题正确（Catppuccin Frappe）
- [ ] `<F9>` 打开文件浏览器
- [ ] `<F8>` 显示 Git 状态
- [ ] `<F7>` 打开代码大纲
- [ ] `<Alt-u>` 打开浮动终端
- [ ] `<leader>ff` 查找文件工作正常
- [ ] `<leader>gg` 实时搜索工作正常
- [ ] LSP 自动完成工作正常
- [ ] Copilot 建议可用（如果已配置）

## 💡 提示

1. **保留旧配置**: 建议保留 `~/.config/nvim.backup` 一段时间
2. **插件安装**: 第一次启动会比较慢，等待插件安装
3. **LSP 安装**: 需要手动安装你使用的语言服务器
4. **环境变量**: 如果使用 ChatGPT，记得设置 `OPENAI_API_KEY`

## 🎉 享受 CatNvim！

现在你可以享受与原配置完全一致的体验，同时获得更多强大的功能！

如有问题，查看：
- `docs/CONFIGURATION.md` - 配置指南
- `docs/KEYBINDINGS.md` - 完整快捷键参考
- `docs/INSTALL.md` - 安装故障排除
