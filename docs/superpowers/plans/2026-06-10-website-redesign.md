# CraneStudio 官网改版实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 重新设计 CraneStudio 官网，创建一个美观、响应式、清新卡通风格的游戏展示页面。

**Architecture:** 单页 HTML 应用，内嵌 CSS 样式和 JavaScript 交互逻辑。使用 Flexbox/Grid 实现响应式布局，通过 fetch 加载 JSON 数据动态渲染游戏卡片，使用 qrcode.js 生成二维码弹窗。

**Tech Stack:** HTML5, CSS3 (Flexbox/Grid, Media Queries), Vanilla JavaScript, qrcode.js (CDN)

---

## 文件结构

```
cranedev123.github.io/
├── index.html                          # 主页面（完全重写）
├── static/
│   ├── more_apps_ios.json              # iOS 游戏数据（现有，保持不变）
│   └── more_apps_android.json          # Android 游戏数据（新增）
└── release/
    ├── privacy.html                    # 隐私政策（现有）
    ├── privacy_cn.html                 # 隐私政策中文（现有）
    ├── tos.html                        # 服务条款（现有）
    └── tos_cn.html                     # 服务条款中文（现有）
```

---

## Task 1: 创建 Android 游戏数据文件

**Files:**
- Create: `static/more_apps_android.json`

- [ ] **Step 1: 创建 Android 游戏数据文件**

根据现有 iOS 游戏数据，创建对应的 Android 版本，使用 Google Play 链接格式。

```json
{
  "appList": [
    {
      "name": "Railway Worker",
      "name_zh": "Railway Worker",
      "package": "cn.crane.flutter.plumber.lineworker",
      "icon": "https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/46/e6/18/46e618e4-e002-a48f-9458-aec0cd5a752a/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.png",
      "link": "https://play.google.com/store/apps/details?id=cn.crane.flutter.plumber.lineworker"
    },
    {
      "name": "Jigsaw World",
      "name_zh": "多多数字拼图",
      "package": "cn.crane.flutter.puzzle.jigsaw",
      "icon": "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/57/e3/5f/57e35f71-9796-ebc6-e119-ce61e33fd07a/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/738x0w.jpg",
      "link": "https://play.google.com/store/apps/details?id=cn.crane.flutter.puzzle.jigsaw"
    },
    {
      "name": "Dance Up",
      "name_zh": "一起来跳舞",
      "package": "cn.crane.flutter.danceup",
      "icon": "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/e8/1a/1a/e81a1a2d-a106-1892-6091-3d54d30b8619/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
      "link": "https://play.google.com/store/apps/details?id=cn.crane.flutter.danceup"
    },
    {
      "name": "Crazy Sudoku",
      "name_zh": "一起来数独",
      "package": "cn.crane.myapp.flutterSudoku",
      "icon": "https://is5-ssl.mzstatic.com/image/thumb/Purple113/v4/4e/c6/fe/4ec6fe35-0343-3cce-b6bf-ab3f6710d663/AppIcon-0-1x_U007emarketing-0-0-85-220-10.png/230x0w.jpg",
      "link": "https://play.google.com/store/apps/details?id=cn.crane.myapp.flutterSudoku"
    },
    {
      "name": "Touch Number",
      "name_zh": "按数字",
      "package": "cn.crane.game.flutter.findx",
      "icon": "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/e4/58/0a/e4580aa1-6848-78bb-2f47-0f69bf69cbc5/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
      "link": "https://play.google.com/store/apps/details?id=cn.crane.game.flutter.findx"
    },
    {
      "name": "Flappy UFO",
      "name_zh": "Flappy UFO",
      "package": "cn.crane.game.flappyufo",
      "icon": "https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/6d/6b/0c/6d6b0cb3-c4f3-5f3c-d1fd-0ac9dcda0748/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
      "link": "https://play.google.com/store/apps/details?id=cn.crane.game.flappyufo"
    }
  ]
}
```

- [ ] **Step 2: 提交数据文件**

```bash
git add static/more_apps_android.json
git commit -m "data: add Android game list for Google Play"
```

---

## Task 2: 创建 HTML 基础结构和 CSS 变量

**Files:**
- Modify: `index.html` (完全重写)

- [ ] **Step 1: 创建 HTML 文档基础结构**

替换现有 index.html 内容，创建 HTML5 文档结构，包含：
- DOCTYPE 和语言设置
- meta 标签（charset, viewport, description）
- title
- 内嵌 style 标签
- 内嵌 script 标签
- qrcode.js CDN 引入

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="CraneStudio - 用心打造每一款休闲游戏">
    <title>CraneStudio - 休闲游戏工作室</title>
    <script src="https://cdn.jsdelivr.net/npm/qrcode@1.5.3/build/qrcode.min.js"></script>
    <style>
        /* CSS 样式将在后续步骤添加 */
    </style>
</head>
<body>
    <!-- HTML 内容将在后续步骤添加 -->
    <script>
        // JavaScript 代码将在后续步骤添加
    </script>
</body>
</html>
```

- [ ] **Step 2: 添加 CSS 变量和全局样式**

在 style 标签中添加 CSS 变量定义和全局重置样式：

```css
        :root {
            /* 颜色变量 */
            --bg-gradient-start: #FFF8F0;
            --bg-gradient-end: #FFF5E6;
            --hero-bg: #FFFCF5;
            --card-bg: #FFFFFF;
            --primary-color: #FF9F43;
            --primary-hover: #F7833D;
            --secondary-color: #FFD4A3;
            --text-primary: #4A4A4A;
            --text-secondary: #888888;
            --border-color: #F0E6D8;

            /* 圆角变量 */
            --radius-lg: 24px;
            --radius-md: 16px;
            --radius-sm: 12px;
            --radius-pill: 50px;

            /* 阴影变量 */
            --shadow-card: 0 4px 20px rgba(255, 159, 67, 0.1);
            --shadow-card-hover: 0 8px 30px rgba(255, 159, 67, 0.2);
            --shadow-popup: 0 8px 32px rgba(0, 0, 0, 0.15);
        }

        /* 全局重置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, var(--bg-gradient-start), var(--bg-gradient-end));
            min-height: 100vh;
            color: var(--text-primary);
            line-height: 1.6;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        img {
            max-width: 100%;
            display: block;
        }
```

- [ ] **Step 3: 添加容器和布局样式**

```css
        /* 容器 */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 12px;
            }
        }
```

- [ ] **Step 4: 提交基础结构**

```bash
git add index.html
git commit -m "feat: add HTML base structure and CSS variables"
```

---

## Task 3: 创建 Hero 区域

**Files:**
- Modify: `index.html`

- [ ] **Step 1: 添加 Hero 区域 HTML**

在 body 标签内添加 Hero 区域结构：

```html
        <!-- Hero Section -->
        <header class="hero">
            <div class="container">
                <div class="hero-content">
                    <div class="hero-logo">🎮 CraneStudio</div>
                    <h1 class="hero-title">用心打造每一款休闲游戏</h1>
                    <p class="hero-subtitle">让快乐触手可及</p>
                </div>
            </div>
        </header>
```

- [ ] **Step 2: 添加 Hero 区域 CSS**

在 style 标签中添加 Hero 样式：

```css
        /* Hero 区域 */
        .hero {
            background-color: var(--hero-bg);
            border-radius: var(--radius-lg);
            margin-bottom: 32px;
            padding: 60px 20px;
            text-align: center;
            box-shadow: var(--shadow-card);
        }

        .hero-content {
            max-width: 600px;
            margin: 0 auto;
        }

        .hero-logo {
            font-size: 48px;
            margin-bottom: 16px;
        }

        .hero-title {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 12px;
        }

        .hero-subtitle {
            font-size: 18px;
            color: var(--text-secondary);
        }

        @media (max-width: 768px) {
            .hero {
                padding: 40px 16px;
                margin-bottom: 20px;
                border-radius: var(--radius-md);
            }

            .hero-logo {
                font-size: 36px;
            }

            .hero-title {
                font-size: 24px;
            }

            .hero-subtitle {
                font-size: 16px;
            }
        }
```

- [ ] **Step 3: 提交 Hero 区域**

```bash
git add index.html
git commit -m "feat: add Hero section with logo and tagline"
```

---

## Task 4: 创建游戏分组容器和卡片组件

**Files:**
- Modify: `index.html`

- [ ] **Step 1: 添加游戏分组区域 HTML**

在 Hero 区域后添加 iOS 和 Android 游戏分组容器：

```html
        <!-- Games Section -->
        <main class="games-section">
            <!-- iOS Games -->
            <section class="game-group" id="ios-games">
                <h2 class="group-title">🍎 iOS 游戏</h2>
                <div class="games-grid" id="ios-games-grid">
                    <!-- 游戏卡片将由 JavaScript 动态加载 -->
                </div>
                <div class="more-games">
                    <a href="https://apps.apple.com/cn/developer/id1061441649" class="btn-more" target="_blank">
                        更多 iOS 游戏 →
                    </a>
                </div>
            </section>

            <!-- Android Games -->
            <section class="game-group" id="android-games">
                <h2 class="group-title">🤖 Android 游戏</h2>
                <div class="games-grid" id="android-games-grid">
                    <!-- 游戏卡片将由 JavaScript 动态加载 -->
                </div>
                <div class="more-games">
                    <a href="https://play.google.com/store/apps/dev?id=8588964176065625833" class="btn-more" target="_blank">
                        更多 Android 游戏 →
                    </a>
                </div>
            </section>
        </main>
```

- [ ] **Step 2: 添加游戏分组和网格 CSS**

在 style 标签中添加分组和网格样式：

```css
        /* 游戏分组 */
        .game-group {
            background-color: var(--card-bg);
            border-radius: var(--radius-lg);
            padding: 32px 24px;
            margin-bottom: 32px;
            box-shadow: var(--shadow-card);
        }

        .group-title {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 24px;
            padding-bottom: 12px;
            border-bottom: 2px solid var(--border-color);
        }

        /* 游戏网格 */
        .games-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 24px;
        }

        @media (max-width: 768px) {
            .game-group {
                padding: 20px 16px;
                margin-bottom: 20px;
                border-radius: var(--radius-md);
            }

            .group-title {
                font-size: 18px;
                margin-bottom: 16px;
            }

            .games-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 12px;
                margin-bottom: 16px;
            }
        }
```

- [ ] **Step 3: 添加游戏卡片 CSS**

```css
        /* 游戏卡片 */
        .game-card {
            background-color: var(--card-bg);
            border-radius: var(--radius-md);
            padding: 20px;
            text-align: center;
            border: 1px solid var(--border-color);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .game-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-card-hover);
        }

        .game-icon {
            width: 100px;
            height: 100px;
            border-radius: var(--radius-sm);
            margin: 0 auto 16px;
            object-fit: cover;
        }

        .game-name {
            font-size: 16px;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 16px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .btn-detail {
            display: inline-block;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-hover));
            color: white;
            padding: 10px 20px;
            border-radius: var(--radius-pill);
            font-size: 14px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: opacity 0.3s ease;
        }

        .btn-detail:hover {
            opacity: 0.9;
        }

        @media (max-width: 768px) {
            .game-card {
                padding: 16px;
            }

            .game-icon {
                width: 80px;
                height: 80px;
                margin-bottom: 12px;
            }

            .game-name {
                font-size: 14px;
                margin-bottom: 12px;
            }

            .btn-detail {
                padding: 8px 16px;
                font-size: 12px;
            }
        }
```

- [ ] **Step 4: 添加"更多游戏"按钮 CSS**

```css
        /* 更多游戏按钮 */
        .more-games {
            text-align: center;
            padding-top: 8px;
        }

        .btn-more {
            display: inline-block;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-hover));
            color: white;
            padding: 12px 32px;
            border-radius: var(--radius-pill);
            font-size: 14px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-more:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(255, 159, 67, 0.3);
        }
```

- [ ] **Step 5: 提交游戏分组和卡片样式**

```bash
git add index.html
git commit -m "feat: add game groups and card components"
```

---

## Task 5: 创建底部区域

**Files:**
- Modify: `index.html`

- [ ] **Step 1: 添加底部区域 HTML**

在游戏分组后添加底部区域：

```html
        <!-- Footer -->
        <footer class="footer">
            <div class="footer-divider"></div>
            <p class="copyright" id="copyright"></p>
            <div class="footer-links">
                <a href="release/privacy.html">隐私政策</a>
                <span class="separator">·</span>
                <a href="release/tos.html">服务条款</a>
            </div>
        </footer>
```

- [ ] **Step 2: 添加底部区域 CSS**

在 style 标签中添加底部样式：

```css
        /* 底部 */
        .footer {
            text-align: center;
            padding: 40px 20px;
        }

        .footer-divider {
            height: 1px;
            background-color: var(--border-color);
            margin-bottom: 24px;
        }

        .copyright {
            font-size: 14px;
            color: var(--text-secondary);
            margin-bottom: 12px;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .footer-links a {
            font-size: 14px;
            color: var(--text-primary);
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: var(--primary-color);
        }

        .separator {
            color: var(--text-secondary);
        }

        @media (max-width: 768px) {
            .footer {
                padding: 24px 16px;
            }

            .copyright,
            .footer-links a {
                font-size: 12px;
            }
        }
```

- [ ] **Step 3: 提交底部区域**

```bash
git add index.html
git commit -m "feat: add footer with dynamic copyright and links"
```

---

## Task 6: 创建二维码弹窗组件

**Files:**
- Modify: `index.html`

- [ ] **Step 1: 添加二维码弹窗 HTML**

在 body 结束标签前添加弹窗容器：

```html
        <!-- QR Code Popup -->
        <div class="qr-popup" id="qr-popup">
            <div class="qr-popup-content">
                <button class="qr-close" id="qr-close">&times;</button>
                <div class="qr-code" id="qr-code"></div>
                <p class="qr-game-name" id="qr-game-name"></p>
                <p class="qr-hint">请用手机扫码前往 App Store</p>
            </div>
            <div class="qr-arrow" id="qr-arrow"></div>
        </div>

        <!-- Overlay for closing popup -->
        <div class="overlay" id="overlay"></div>
```

- [ ] **Step 2: 添加二维码弹窗 CSS**

在 style 标签中添加弹窗样式：

```css
        /* 遮罩层 */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: transparent;
            z-index: 998;
            display: none;
        }

        .overlay.active {
            display: block;
        }

        /* 二维码弹窗 */
        .qr-popup {
            position: fixed;
            z-index: 999;
            display: none;
            pointer-events: none;
        }

        .qr-popup.active {
            display: block;
            pointer-events: auto;
        }

        .qr-popup-content {
            background-color: var(--card-bg);
            border-radius: var(--radius-md);
            padding: 20px;
            box-shadow: var(--shadow-popup);
            width: 240px;
            text-align: center;
            position: relative;
        }

        .qr-close {
            position: absolute;
            top: 8px;
            right: 12px;
            background: none;
            border: none;
            font-size: 20px;
            color: var(--text-secondary);
            cursor: pointer;
            padding: 4px;
            line-height: 1;
        }

        .qr-close:hover {
            color: var(--text-primary);
        }

        .qr-code {
            width: 160px;
            height: 160px;
            margin: 0 auto 16px;
            background-color: white;
            padding: 8px;
        }

        .qr-code canvas {
            width: 100% !important;
            height: 100% !important;
        }

        .qr-game-name {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 8px;
        }

        .qr-hint {
            font-size: 12px;
            color: var(--text-secondary);
        }

        .qr-arrow {
            width: 0;
            height: 0;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-top: 10px solid var(--card-bg);
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            top: -10px;
        }

        .qr-arrow.arrow-up {
            border-top: none;
            border-bottom: 10px solid var(--card-bg);
            top: auto;
            bottom: -10px;
        }
```

- [ ] **Step 3: 提交二维码弹窗**

```bash
git add index.html
git commit -m "feat: add QR code popup component"
```

---

## Task 7: 实现 JavaScript 数据加载和渲染逻辑

**Files:**
- Modify: `index.html`

- [ ] **Step 1: 添加工具函数**

在 script 标签中添加工具函数：

```javascript
        // 判断是否为移动设备
        function isMobile() {
            return /Android|webOS|iPhone|iPad|iPod/i.test(navigator.userAgent);
        }

        // 获取当前年份并更新版权信息
        function updateCopyright() {
            const year = new Date().getFullYear();
            document.getElementById('copyright').textContent = `© 2018-${year} CraneStudio`;
        }
```

- [ ] **Step 2: 添加游戏卡片渲染函数**

```javascript
        // 创建游戏卡片 HTML
        function createGameCard(game, platform) {
            const card = document.createElement('div');
            card.className = 'game-card';
            card.innerHTML = `
                <img class="game-icon" src="${game.icon}" alt="${game.name}" loading="lazy">
                <p class="game-name">${game.name}</p>
                <button class="btn-detail" data-link="${game.link}" data-name="${game.name}" data-platform="${platform}">
                    查看详情 →
                </button>
            `;
            return card;
        }

        // 加载并渲染游戏列表
        async function loadGames(jsonUrl, containerId, platform) {
            const container = document.getElementById(containerId);
            try {
                const response = await fetch(jsonUrl);
                const data = await response.json();
                data.appList.forEach(game => {
                    const card = createGameCard(game, platform);
                    container.appendChild(card);
                });
            } catch (error) {
                console.error('Failed to load games:', error);
                container.innerHTML = '<p style="grid-column: 1/-1; text-align: center; color: var(--text-secondary);">游戏列表加载失败</p>';
            }
        }
```

- [ ] **Step 3: 提交数据加载函数**

```bash
git add index.html
git commit -m "feat: add game data loading and rendering functions"
```

---

## Task 8: 实现二维码弹窗交互逻辑

**Files:**
- Modify: `index.html`

- [ ] **Step 1: 添加二维码弹窗显示函数**

在 script 标签中添加弹窗逻辑：

```javascript
        // 二维码弹窗相关元素
        const qrPopup = document.getElementById('qr-popup');
        const qrCode = document.getElementById('qr-code');
        const qrGameName = document.getElementById('qr-game-name');
        const qrArrow = document.getElementById('qr-arrow');
        const qrClose = document.getElementById('qr-close');
        const overlay = document.getElementById('overlay');

        // 显示二维码弹窗
        function showQRCodePopup(url, gameName, event) {
            // 清空之前的二维码
            qrCode.innerHTML = '';

            // 生成二维码
            QRCode.toCanvas(url, { width: 144, margin: 0 }, function(error, canvas) {
                if (error) {
                    console.error(error);
                    return;
                }
                qrCode.appendChild(canvas);
            });

            // 设置游戏名称
            qrGameName.textContent = gameName;

            // 计算弹窗位置
            const rect = event.target.getBoundingClientRect();
            const popupWidth = 240;
            const popupHeight = 280;

            let left = rect.left + rect.width / 2 - popupWidth / 2;
            let top = rect.bottom + 20;
            let arrowUp = false;

            // 检查是否超出右边界
            if (left + popupWidth > window.innerWidth - 20) {
                left = window.innerWidth - popupWidth - 20;
            }

            // 检查是否超出左边界
            if (left < 20) {
                left = 20;
            }

            // 检查是否超出下边界
            if (top + popupHeight > window.innerHeight - 20) {
                top = rect.top - popupHeight - 20;
                arrowUp = true;
            }

            // 设置箭头方向
            if (arrowUp) {
                qrArrow.classList.add('arrow-up');
            } else {
                qrArrow.classList.remove('arrow-up');
            }

            // 设置弹窗位置
            qrPopup.style.left = `${left}px`;
            qrPopup.style.top = `${top}px`;

            // 显示弹窗和遮罩
            qrPopup.classList.add('active');
            overlay.classList.add('active');
        }

        // 隐藏二维码弹窗
        function hideQRCodePopup() {
            qrPopup.classList.remove('active');
            overlay.classList.remove('active');
        }
```

- [ ] **Step 2: 添加事件绑定**

```javascript
        // 绑定关闭弹窗事件
        qrClose.addEventListener('click', hideQRCodePopup);
        overlay.addEventListener('click', hideQRCodePopup);

        // 处理游戏卡片点击事件（事件委托）
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('btn-detail')) {
                const link = event.target.dataset.link;
                const name = event.target.dataset.name;
                const platform = event.target.dataset.platform;

                if (platform === 'ios') {
                    if (isMobile()) {
                        // 手机端直接跳转
                        window.location.href = link;
                    } else {
                        // PC端显示二维码弹窗
                        event.preventDefault();
                        showQRCodePopup(link, name, event);
                    }
                } else {
                    // Android 所有端直接跳转
                    window.location.href = link;
                }
            }
        });
```

- [ ] **Step 3: 添加页面初始化**

```javascript
        // 页面加载完成后初始化
        document.addEventListener('DOMContentLoaded', function() {
            // 更新版权年份
            updateCopyright();

            // 加载游戏列表
            loadGames('static/more_apps_ios.json', 'ios-games-grid', 'ios');
            loadGames('static/more_apps_android.json', 'android-games-grid', 'android');
        });
```

- [ ] **Step 4: 提交交互逻辑**

```bash
git add index.html
git commit -m "feat: add QR code popup and click handling logic"
```

---

## Task 9: 最终测试和优化

**Files:**
- Modify: `index.html`

- [ ] **Step 1: 添加加载状态和错误处理优化**

在 style 标签中添加加载状态样式：

```css
        /* 加载状态 */
        .games-grid.loading {
            min-height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .loading-text {
            color: var(--text-secondary);
            font-size: 14px;
        }
```

在 script 标签中优化加载函数：

```javascript
        // 加载并渲染游戏列表（优化版）
        async function loadGames(jsonUrl, containerId, platform) {
            const container = document.getElementById(containerId);
            container.innerHTML = '<p class="loading-text">加载中...</p>';
            container.classList.add('loading');

            try {
                const response = await fetch(jsonUrl);
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                const data = await response.json();
                container.innerHTML = '';
                container.classList.remove('loading');
                data.appList.forEach(game => {
                    const card = createGameCard(game, platform);
                    container.appendChild(card);
                });
            } catch (error) {
                console.error('Failed to load games:', error);
                container.innerHTML = '<p style="grid-column: 1/-1; text-align: center; color: var(--text-secondary);">游戏列表加载失败，请刷新页面重试</p>';
                container.classList.remove('loading');
            }
        }
```

- [ ] **Step 2: 添加图片加载错误处理**

```javascript
        // 处理图片加载错误
        document.addEventListener('error', function(event) {
            if (event.target.tagName === 'IMG') {
                event.target.src = 'data:image/svg+xml,' + encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect fill="#f0e6d8" width="100" height="100"/><text x="50" y="55" text-anchor="middle" fill="#888" font-size="12">游戏图标</text></svg>');
            }
        }, true);
```

- [ ] **Step 3: 本地测试验证**

在浏览器中打开 `index.html` 文件，验证以下功能：

1. 页面样式符合设计规范（暖橙色系、圆角、阴影）
2. Hero 区域显示正确
3. iOS 和 Android 游戏分组正确显示
4. 游戏卡片网格布局正确（PC 4列，手机 2列）
5. 版权年份动态显示
6. 底部链接正确
7. 二维码弹窗功能正常（PC端点击 iOS 游戏）
8. 手机端点击 iOS 游戏直接跳转
9. 所有端点击 Android 游戏直接跳转

- [ ] **Step 4: 提交最终优化**

```bash
git add index.html
git commit -m "feat: add loading state and error handling"
```

---

## Task 10: 发布部署

- [ ] **Step 1: 确认所有更改已提交**

```bash
git status
```

- [ ] **Step 2: 推送到远程仓库**

```bash
git push origin master
```

- [ ] **Step 3: 验证线上效果**

等待 GitHub Pages 部署完成后，访问 `https://cranedev123.github.io` 验证线上效果。

---

## 验收清单

- [ ] 视觉验收：页面符合"温馨居家风"设计风格
- [ ] 响应式验收：PC 端 4 列，手机端 2 列
- [ ] 功能验收：iOS PC 端弹二维码，手机端直接跳转
- [ ] 功能验收：Android 所有端直接跳转
- [ ] 功能验收："更多游戏"按钮正确跳转
- [ ] 功能验收：底部链接正确跳转法律文档
- [ ] 功能验收：版权年份动态显示
- [ ] 性能验收：无外部框架依赖，加载速度快
