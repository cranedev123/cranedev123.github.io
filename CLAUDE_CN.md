# CLAUDE_CN.md

本文件为 Claude Code (claude.ai/code) 在此代码库中工作时提供指导。

**注意：修改本文档时，请同步更新英文版 `CLAUDE.md`**

## 项目概述

这是 CraneStudio（鹤工作室）的 GitHub Pages 网站和移动应用展示仓库。包含：
1. **GitHub Pages 静态网站** - 基于 Jekyll 的网站，包含编译后的 Web 应用
2. **Flutter 展示应用** (`code/crane_studio_flutter/`) - 展示 CraneStudio 的移动游戏
3. **Uni-app 项目** (`code/CraneStudio/`) - 基于 Vue 的跨平台应用

## 构建命令

### Flutter 项目
```bash
cd code/crane_studio_flutter

# 开发
flutter run                          # 在连接的设备/模拟器上运行
flutter run -d chrome                # 运行 Web 版本

# 构建
flutter build apk                    # Android APK
flutter build ios                    # iOS（需要 macOS）
flutter build web                    # Web 版本

# 测试
flutter test                         # 运行所有测试
flutter test test/specific_test.dart # 运行指定测试
```

### Uni-app 项目
使用 HBuilderX IDE 构建。构建输出位于 `code/CraneStudio/unpackage/dist/build/`。

### GitHub Pages
网站使用 Jekyll 和 `jekyll-theme-cayman` 主题。推送到 `master` 分支即可部署。

## 架构

### Flutter 应用结构
```
lib/
├── main.dart              # 应用入口
├── K.dart                 # 配置常量（包名、URL、渠道）
├── r.dart                 # 资源引用
├── bean/                  # 数据模型
│   └── app_list_entity.dart  # 应用列表模型
├── ui/
│   ├── base/              # 基硄件和工具
│   │   ├── V.dart         # 可复用 UI 组件构建器
│   │   └── BaseState.dart # 基础状态类
│   ├── color/             # 颜色定义
│   ├── page/              # 页面组件
│       ├── HomePage.dart     # 主标签页导航
│       ├── IndexPage.dart    # 应用展示网格
│       └── ContactUsPage.dart
└── utils/                 # 工具类
    ├── ConfigUtils.dart   # 应用列表加载（服务器 + 本地资源回退）
    └── JumpUtils.dart     # URL 跳转
```

### 核心架构模式

**应用列表加载策略：**
- 主方式：从远程服务器加载 (`https://configs-1253122004.cos.ap-chengdu.myqcloud.com/`)
- 回退方式：从本地 JSON 资源加载
- 平台适配：iOS、Android、Google Play 和中文 locale 使用不同的 JSON 文件

**配置系统 (`K.dart`)：**
- 平台感知配置（iOS vs Android）
- 渠道感知（Google Play vs 其他渠道）
- 语言感知（中文 vs 英文）

**UI 组件构建器 (`V.dart`)：**
- 集中式 widget 工厂，保证样式一致性
- 处理文本、图片、按钮、输入框、日期选择器
- 平台特定实现（iOS Cupertino vs Android Material）

### 平台特定应用列表
- `more_apps_ios.json` - iOS App Store 应用
- `more_apps_ios_zh.json` - iOS 应用（中文）
- `more_apps_google_play.json` - Google Play 应用
- `more_apps.json` - 其他 Android 渠道

### 法律文档
位于 `release/` 目录：
- `privacy.html` / `privacy_cn.html` - 隐私政策（英文/中文）
- `tos.html` / `tos_cn.html` - 服务条款（英文/中文）

## 部署

1. **GitHub Pages**：推送到 `master` 分支
2. **Flutter Web**：使用 `flutter build web` 构建，输出到 `web/` 或根目录
3. **Flutter Mobile**：构建 APK/IPA 并上传到应用商店
4. **Uni-app**：通过 HBuilderX 构建到相应平台

## 文档同步

本仓库包含两份 CLAUDE.md 文档：
- `CLAUDE.md` - 英文版
- `CLAUDE_CN.md` - 中文版（本文件）

**修改任一文档时，请同步更新另一份文档以保持内容一致。**
