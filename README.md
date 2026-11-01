# ElixirOffice 一键安装指南

> 第三方部署指南 · 非 ElixirOffice 官方仓库。官方项目：[leag1234/ElixirOffice](https://github.com/leag1234/ElixirOffice)
> 内容来自官方文档（2026-10-30）。项目迭代快，请以[官方文档](https://github.com/leag1234/ElixirOffice#try-it)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> Word、Excel、PowerPoint 的肌肉记忆不用重学：228 个 Word 快捷键、KeyTips、迷你工具栏都在，文档排版也对得上。

⚠️ 目前是 beta，官方明说会有粗糙的地方。Windows 10/11、macOS（仅 Apple Silicon）、Linux（AppImage / deb）都有桌面版；安装包还没签名，Windows 会拦一次（更多信息 → 仍要运行），macOS 要在隐私与安全性里放行。服务端版需要 Linux + Docker + 公网域名，起始页默认关闭且没有自己的账号体系。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/elixiroffice-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统选安装包，下载后比对 SHA256，再引导你完成安装并打开一份 docx 试手，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## ElixirOffice 是什么？

ElixirOffice 是开源的功能区、快捷键、对话框都照 Microsoft Office 做的开源办公套件，桌面版全离线，服务端版可在浏览器里协作（协议：AGPL-3.0，<img src="https://img.shields.io/github/stars/leag1234/ElixirOffice?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

以成熟开源办公引擎为底，重做界面层：功能区、菜单、对话框与快捷键对齐 Microsoft Office，文档转换器编译成 WebAssembly 在本地或浏览器里跑，docx / xlsx / pptx / odt / ods / odp 都能读写。

- 习惯一致：功能区、KeyTips、迷你工具栏、快捷访问栏
- 快捷键对齐：Windows 228 个 Word 快捷键
- 排版对得上：用公制兼容字体还原换行与分页
- 全离线：桌面版不联网，文档不出本机
- AI 可选：Ask Elixir 默认关闭，可接自建服务
- 两种形态：桌面版单机，服务端版浏览器协作

（来源：[官方仓库](https://github.com/leag1234/ElixirOffice)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 604 stars 10 月新项目 | 名称搜索仅 1 条结果 |
| Office 肌肉记忆可延续 | 迁移成本低 |
| 桌面版全离线 | 文档不上传 |
| docx / xlsx / pptx 与 ODF 双向读写 | — |
| 45 种界面语言 | 含中日韩排版 |
| 自带 PDF 导出 | 走本机字体 |

| 需要注意 | 说明 |
|---|---|
| 仍是 beta | 存在未打磨的细节 |
| 安装包未签名 | 首次运行会被系统拦 |
| macOS 只有 Apple Silicon 版本 | — |
| 服务端版要 Linux + Docker + 域名 | — |
| 生态与插件远不如 Office | — |

> 以上基于官方文档与社区反馈整理（2026-10-30），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o ElixirOffice-0.5.0-x86_64.AppImage https://github.com/leag1234/elixiroffice/releases/download/v0.5.0/ElixirOffice-0.5.0-x86_64.AppImage
echo "282cbe4eb0e4c5a4ce82b06d374db6a1ab224c535042bdccb81618cd18d10be5  ElixirOffice-0.5.0-x86_64.AppImage" | sha256sum -c -
chmod +x ElixirOffice-0.5.0-x86_64.AppImage
echo "校验通过：运行 ./ElixirOffice-0.5.0-x86_64.AppImage"
```

安装包来源：[https://github.com/leag1234/elixiroffice/releases/tag/v0.5.0](https://github.com/leag1234/elixiroffice/releases/tag/v0.5.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认桌面版 0.5.0 四个安装包、服务端版 Docker 方式与 beta 状态 | 已核对 2026-10-30 |
| Release v0.5.0 的 SHA256SUMS 已下载核对（win / mac arm64 / AppImage / deb） | 已核对 2026-10-30 |
| 未实测安装与打开文档 | 说明 2026-10-30 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-10-30 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-30 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供安装步骤、校验方式与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-30）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\elixiroffice-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包对照（桌面版 v0.5.0）

| 平台 | 文件 | 大小 |
|---|---|---|
| Windows 10/11 x64 | ElixirOffice-0.5.0-win-x64.exe | 418.8 MB |
| macOS Apple Silicon | ElixirOffice-0.5.0-mac-arm64.dmg | 486.4 MB |
| Linux AppImage | ElixirOffice-0.5.0-x86_64.AppImage | 419.0 MB |
| Debian / Ubuntu | ElixirOffice-0.5.0-linux-amd64.deb | 477.7 MB |

Release 里带 `SHA256SUMS`，可一次核对全部文件。目前没有 Intel Mac 的安装包。

## 第一次打开

1. **Windows**：双击安装包，SmartScreen 提示时选「更多信息 → 仍要运行」
2. **macOS**：拖进「应用程序」，被拦时到系统设置 → 隐私与安全性里点「仍要打开」
3. **Linux**：`chmod +x` 后直接运行 AppImage，或用 `sudo apt install ./ElixirOffice-*.deb`
4. 新建文档或打开一份 .docx，编辑保存，文件留在本机

## 服务端版（浏览器协作）

需要一台 Linux 主机、Docker 与公网域名：

1. 从 [server release v0.1.1](https://github.com/leag1234/elixiroffice/releases/tag/v0.1.1) 下载部署包
2. 按包里的安装指南先跑初始化脚本生成密钥
3. `docker compose up -d` 拉取 `ghcr.io/leag1234/elixiroffice-server:beta1.1` 并起在 HTTPS 后面

起始页默认关闭，也没有自己的账号体系；要在可信网络、VPN 或自己的鉴权后面再开启。

## 注意

- beta 阶段，官方建议遇到问题直接提 issue
- 安装包未签名，务必先核对 SHA256
- 桌面版默认每天最多查一次更新（不发文档与文件名）
- AI 功能默认关闭，开关在设置里
- 服务端版是 AGPL-3.0，二次分发注意开源义务

## 常见坑

- Windows 拦截安装：核对 SHA256 后选「更多信息 → 仍要运行」
- macOS 打不开：系统设置 → 隐私与安全性 → 仍要打开
- Linux 双击没反应：先 chmod +x，再在终端里运行
- deb 装不上：用 apt install ./文件名.deb，不要用 dpkg -i
- 中文显示异常：在字体设置里指定中文字体，或允许读取系统字体
- Intel Mac 无包：只能自己从源码构建，或等服务端版
- 服务端起不来：确认 Docker Compose v2 与域名解析，HTTPS 由反代负责

## 免责声明

本仓库为第三方指南，与 ElixirOffice 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-30），项目迭代快，请以[官方文档](https://github.com/leag1234/ElixirOffice#try-it)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
