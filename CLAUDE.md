# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Note: When modifying this document, please also update the Chinese version `CLAUDE_CN.md`**

## Project Overview

This is CraneStudio's GitHub Pages site and mobile app showcase repository. It contains:
1. **GitHub Pages static site** - Jekyll-based site with compiled web apps
2. **Flutter showcase app** (`code/crane_studio_flutter/`) - Displays CraneStudio's mobile games
3. **Uni-app project** (`code/CraneStudio/`) - Vue-based cross-platform app

## Build Commands

### Flutter Project
```bash
cd code/crane_studio_flutter

# Development
flutter run                          # Run on connected device/emulator
flutter run -d chrome                # Run web version

# Build
flutter build apk                    # Android APK
flutter build ios                    # iOS (requires macOS)
flutter build web                    # Web version

# Testing
flutter test                         # Run all tests
flutter test test/specific_test.dart # Run specific test
```

### Uni-app Project
Built using HBuilderX IDE. Build outputs go to `code/CraneStudio/unpackage/dist/build/`.

### GitHub Pages
The site uses Jekyll with the `jekyll-theme-cayman` theme. Push changes to `master` branch to deploy.

## Architecture

### Flutter App Structure
```
lib/
├── main.dart              # App entry point
├── K.dart                 # Configuration constants (package IDs, URLs, channels)
├── r.dart                 # Asset resource references
├── bean/                  # Data models
│   └── app_list_entity.dart  # App list model
├── ui/
│   ├── base/              # Base widgets and utilities
│   │   ├── V.dart         # Reusable UI component builder
│   │   └── BaseState.dart # Base state class
│   ├── color/             # Color definitions
│   ├── page/              # Page widgets
│       ├── HomePage.dart     # Main tab navigation
│       ├── IndexPage.dart    # App showcase grid
│       └── ContactUsPage.dart
└── utils/                 # Utilities
    ├── ConfigUtils.dart   # App list loading (server + fallback to assets)
    └── JumpUtils.dart     # URL launching
```

### Key Architecture Patterns

**App List Loading Strategy:**
- Primary: Load from remote server (`https://configs-1253122004.cos.ap-chengdu.myqcloud.com/`)
- Fallback: Load from local JSON assets
- Platform-specific: Different JSON files for iOS, Android, Google Play, and Chinese locale

**Configuration System (`K.dart`):**
- Platform-aware configuration (iOS vs Android)
- Channel-aware (Google Play vs other channels)
- Locale-aware (Chinese vs English)

**UI Component Builder (`V.dart`):**
- Centralized widget factory for consistent styling
- Handles text, images, buttons, inputs, date pickers
- Platform-specific implementations (iOS Cupertino vs Android Material)

### Platform-Specific App Lists
- `more_apps_ios.json` - iOS App Store apps
- `more_apps_ios_zh.json` - iOS apps (Chinese)
- `more_apps_google_play.json` - Google Play apps
- `more_apps.json` - Other Android channels

### Legal Documents
Located in `release/` directory:
- `privacy.html` / `privacy_cn.html` - Privacy Policy (EN/CN)
- `tos.html` / `tos_cn.html` - Terms of Service (EN/CN)

## Deployment

1. **GitHub Pages**: Push to `master` branch
2. **Flutter Web**: Build with `flutter build web`, output to `web/` or root
3. **Flutter Mobile**: Build APK/IPA and upload to stores
4. **Uni-app**: Build via HBuilderX to respective platforms

## Document Synchronization

This repository contains two CLAUDE.md documents:
- `CLAUDE.md` - English version (this file)
- `CLAUDE_CN.md` - Chinese version

**When modifying either document, please update the other to keep them in sync.**
