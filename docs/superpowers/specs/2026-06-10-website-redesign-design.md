# CraneStudio 官网改版设计文档

**日期：** 2026-06-10
**项目：** CraneStudio 游戏工作室官网重新设计

---

## 一、项目背景

现有官网 `index.html` 页面较为简陋，仅简单展示游戏列表。需要重新设计一个美观、响应式的官网页面，展示 CraneStudio 的移动游戏产品。

### 核心需求

1. 纯 HTML 实现，不引入前端框架
2. 响应式设计，适配 PC 和手机端
3. iOS 游戏在 PC 端点击时弹出二维码，手机端直接跳转
4. Android 游戏在所有端直接跳转 Google Play
5. iOS 和 Android 游戏分成两个独立分组展示
6. 每个分组底部有"更多游戏"按钮跳转开发者页面
7. 底部版权年份动态显示（2018-当前年份）

---

## 二、设计风格

### 2.1 整体风格定位

**清新卡通风** - 浅色柔和背景、圆角元素、可爱的配色，适合休闲游戏工作室。

### 2.2 配色方案

| 用途 | 颜色名称 | 色值 |
|------|----------|------|
| 主背景 | 米色渐变 | `linear-gradient(135deg, #FFF8F0, #FFF5E6)` |
| Hero 区域背景 | 奶白色 | `#FFFCF5` |
| 卡片背景 | 纯白 | `#FFFFFF` |
| 主色调（按钮/强调） | 暖橙色 | `#FF9F43` |
| 主色调悬停 | 深橙色 | `#F7833D` |
| 次要强调 | 浅橙色 | `#FFD4A3` |
| 文字主色 | 深灰棕 | `#4A4A4A` |
| 文字次色 | 中灰 | `#888888` |
| 边框/分割线 | 浅灰橙 | `#F0E6D8` |

### 2.3 圆角规范

| 元素 | 圆角值 |
|------|--------|
| Hero 区域、分组容器 | `24px` |
| 游戏卡片 | `16px` |
| 按钮（胶囊形） | `50px` |
| 游戏图标 | `12px` |

### 2.4 阴影规范

| 状态 | 阴影值 |
|------|--------|
| 卡片默认 | `box-shadow: 0 4px 20px rgba(255, 159, 67, 0.1)` |
| 卡片悬停 | `box-shadow: 0 8px 30px rgba(255, 159, 67, 0.2)` |

---

## 三、页面结构

### 3.1 布局概览

```
┌─────────────────────────────────────────────────────────┐
│                      HERO 区域                          │
│              Logo + 标语 + 装饰元素                      │
├─────────────────────────────────────────────────────────┤
│                  🍎 iOS 游戏分组                        │
│              游戏卡片网格 + 更多游戏按钮                  │
├─────────────────────────────────────────────────────────┤
│                 🤖 Android 游戏分组                     │
│              游戏卡片网格 + 更多游戏按钮                  │
├─────────────────────────────────────────────────────────┤
│                      底部区域                           │
│            版权信息 + 链接列表                          │
└─────────────────────────────────────────────────────────┘
```

### 3.2 响应式断点

| 设备 | 断点 | 游戏卡片列数 | 容器宽度 |
|------|------|--------------|----------|
| PC 端 | > 768px | 4 列 | 最大 1200px 居中 |
| 手机端 | ≤ 768px | 2 列 | 全宽 |

---

## 四、组件设计

### 4.1 Hero 区域

**内容：**
- 工作室 Logo/名称：🎮 CraneStudio
- 主标语：用心打造每一款休闲游戏
- 副标语：让快乐触手可及

**样式：**
- 背景：奶白色 `#FFFCF5`，圆角 24px
- 内边距：PC 端 60px，手机端 40px
- 居中对齐
- 可选：添加装饰性元素（如小圆点、波浪线等）

### 4.2 游戏分组容器

**结构：**
- 分组标题：图标 + 标题文字（如 "🍎 iOS 游戏"）
- 游戏卡片网格
- "更多游戏"按钮

**样式：**
- 背景：可选浅色背景卡片包裹，或直接使用主背景
- 标题字号：20px，加粗
- 标题颜色：深灰棕 `#4A4A4A`

### 4.3 游戏卡片

**结构：**
```
┌─────────────────────┐
│                     │
│    ┌───────────┐    │
│    │  游戏图标  │    │
│    └───────────┘    │
│                     │
│     游戏名称        │
│                     │
│   [ 查看详情 → ]    │
│                     │
└─────────────────────┘
```

**样式细节：**

| 属性 | PC 端 | 手机端 |
|------|-------|--------|
| 卡片宽度 | 固定 ~220px | 自适应 ~45% |
| 内边距 | 20px | 16px |
| 图标大小 | 100px × 100px | 80px × 80px |
| 名称字号 | 16px, 加粗 | 14px, 加粗 |
| 名称颜色 | 深灰棕 `#4A4A4A` | 同左 |

**交互效果：**
- 悬停（PC）：卡片上移 4px，阴影加深
- 按钮悬停：背景色变深橙色 `#F7833D`

### 4.4 按钮样式

**胶囊形按钮：**
- 背景：暖橙色渐变 `linear-gradient(135deg, #FF9F43, #F7833D)`
- 文字颜色：白色 `#FFFFFF`
- 圆角：50px
- 内边距：12px 24px
- 字号：14px
- 悬停：背景加深，可选添加微光效果

### 4.5 二维码气泡弹窗

**触发条件：**
- 用户在 PC 端点击 iOS 游戏

**结构：**
```
                ┌─────────────────────────────┐
                │         ┌───────────┐       │
                │         │  QR Code  │       │
                │         └───────────┘       │
                │        游戏名称              │
                │  请用手机扫码前往 App Store   │
                │            ✕               │
                └─────────────────────────────┘
                       ▲
                       │ 小三角指向点击位置
```

**样式：**
| 属性 | 值 |
|------|------|
| 宽度 | 240px |
| 内边距 | 20px |
| 背景 | 白色 `#FFFFFF` |
| 圆角 | 16px |
| 阴影 | `0 8px 32px rgba(0,0,0,0.15)` |
| 二维码大小 | 160px × 160px |
| 游戏名称 | 14px, 加粗, 深灰棕 |
| 提示文字 | 12px, 中灰 |
| 关闭按钮 | 右上角 × 符号 |

**交互：**
- 弹窗出现在点击位置附近，自动判断避免超出屏幕
- 点击关闭按钮或点击弹窗外部区域关闭
- 二维码使用 qrcode.js CDN 生成

### 4.6 底部区域

**结构：**
```
────────────────────────────────────────
         © 2018-2024 CraneStudio
            隐私政策 · 服务条款
```

**样式：**
| 属性 | 值 |
|------|------|
| 内边距 | 40px 20px |
| 分割线 | 1px, 浅灰橙 `#F0E6D8` |
| 版权文字 | 14px, 中灰 `#888888` |
| 链接文字 | 14px, 深灰棕 `#4A4A4A` |
| 链接悬停 | 暖橙色 `#FF9F43` |
| 链接分隔符 | `·` |

**动态年份实现：**
```javascript
const year = new Date().getFullYear();
document.getElementById('copyright').innerHTML = `© 2018-${year} CraneStudio`;
```

---

## 五、数据处理

### 5.1 数据来源

- iOS 游戏：`static/more_apps_ios.json`（现有）
- Android 游戏：需要创建 `static/more_apps_android.json`

### 5.2 数据结构

**iOS 游戏（现有格式）：**
```json
{
  "appList": [
    {
      "name": "Railway Worker",
      "name_zh": "Railway Worker",
      "package": "cn.crane.flutter.plumber.lineworker",
      "icon": "https://...图标URL",
      "link": "https://itunes.apple.com/app/xxx"
    }
  ]
}
```

**Android 游戏（建议格式）：**
```json
{
  "appList": [
    {
      "name": "Railway Worker",
      "name_zh": "Railway Worker",
      "package": "cn.crane.flutter.plumber.lineworker",
      "icon": "https://...图标URL",
      "link": "https://play.google.com/store/apps/details?id=xxx"
    }
  ]
}
```

### 5.3 开发者页面链接

| 平台 | 链接 |
|------|------|
| iOS App Store | `https://apps.apple.com/cn/developer/id1061441649` |
| Android Google Play | `https://play.google.com/store/apps/dev?id=8588964176065625833` |

### 5.4 法律文档链接

| 文档 | 路径 |
|------|------|
| 隐私政策（英文） | `release/privacy.html` |
| 隐私政策（中文） | `release/privacy_cn.html` |
| 服务条款（英文） | `release/tos.html` |
| 服务条款（中文） | `release/tos_cn.html` |

---

## 六、交互逻辑

### 6.1 平台判断

```javascript
function isMobile() {
  return /Android|webOS|iPhone|iPad|iPod/i.test(navigator.userAgent);
}
```

### 6.2 游戏点击处理

**iOS 游戏：**
```javascript
function onIOSGameClick(gameUrl, gameName, event) {
  if (isMobile()) {
    // 手机端：直接跳转
    window.location.href = gameUrl;
  } else {
    // PC端：显示二维码弹窗
    showQRCodePopup(gameUrl, gameName, event);
  }
}
```

**Android 游戏：**
```javascript
function onAndroidGameClick(gameUrl) {
  // 所有端：直接跳转
  window.location.href = gameUrl;
}
```

### 6.3 二维码弹窗逻辑

```javascript
function showQRCodePopup(url, gameName, event) {
  // 1. 创建弹窗元素
  // 2. 生成二维码（使用 qrcode.js）
  // 3. 计算弹窗位置（基于点击位置，避免超出屏幕）
  // 4. 显示弹窗
  // 5. 绑定关闭事件（点击外部区域、关闭按钮）
}
```

---

## 七、技术实现要点

### 7.1 技术栈

- **HTML5** - 页面结构
- **CSS3** - 样式（Flexbox/Grid 布局、动画、媒体查询）
- **原生 JavaScript** - 交互逻辑
- **qrcode.js** - 二维码生成（CDN 引入）

### 7.2 CDN 资源

```html
<!-- qrcode.js 用于生成二维码 -->
<script src="https://cdn.jsdelivr.net/npm/qrcode@1.5.3/build/qrcode.min.js"></script>
```

### 7.3 无框架原则

- 不引入 React、Vue 等框架
- 不引入 Bootstrap 等样式框架
- 纯 HTML/CSS/JS 实现，保持简单轻量

---

## 八、文件结构

```
cranedev123.github.io/
├── index.html              # 新版官网首页（主要改动）
├── static/
│   ├── more_apps_ios.json      # iOS 游戏数据（现有）
│   └── more_apps_android.json  # Android 游戏数据（新增）
├── release/
│   ├── privacy.html        # 隐私政策（英文）
│   ├── privacy_cn.html     # 隐私政策（中文）
│   ├── tos.html            # 服务条款（英文）
│   └── tos_cn.html         # 服务条款（中文）
└── docs/
    └── superpowers/
        └── specs/
            └── 2026-06-10-website-redesign-design.md  # 本设计文档
```

---

## 九、验收标准

1. **视觉验收**
   - 页面符合"温馨居家风"设计风格
   - 暖橙色系配色协调
   - 圆角、阴影等细节一致

2. **响应式验收**
   - PC 端显示 4 列游戏卡片
   - 手机端显示 2 列游戏卡片
   - 各元素在不同屏幕尺寸下布局合理

3. **功能验收**
   - iOS 游戏 PC 端点击弹出二维码气泡
   - iOS 游戏手机端点击直接跳转
   - Android 游戏所有端点击直接跳转
   - "更多游戏"按钮正确跳转开发者页面
   - 底部链接正确跳转法律文档
   - 版权年份动态显示

4. **性能验收**
   - 页面加载速度良好
   - 无外部框架依赖
   - 图片资源合理加载

---

## 十、后续维护

1. **新增游戏** - 在 JSON 文件中添加游戏数据
2. **更新链接** - 直接修改 JSON 文件中的链接
3. **调整样式** - 修改 index.html 中的 CSS
4. **更新版权** - 自动动态获取，无需手动更新
