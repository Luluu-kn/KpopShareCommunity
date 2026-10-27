# KPOPShareCommunity
K‑POP音乐分享社区 | K‑POP Music Sharing Community



![SDK](https://img.shields.io/badge/API-6.1.0(23)-green)


> [中文](#-中文介绍) | [English](#-english-introduction)

---

## 📖 中文介绍
### 项目简介
基于鸿蒙ArkTS开发的K‑POP粉丝社区App，实现音乐发现、艺人检索、歌曲收藏、个人资料管理完整流程，采用ArkUI声明式UI，本地数据持久化，课程设计演示项目。
内置5位艺人、10首演示曲目。

### ✨ 主要功能
- 注册、登录，本地账号存储
- 首页轮播、歌曲推荐
- 艺人关键词搜索
- 随机发现歌曲
- 歌曲收藏与取消收藏
- 个人中心，编辑昵称与签名
- 底部Tab导航：首页 / 发现 / 收藏 / 我的

### 🛠 技术栈
- 语言：ArkTS
- UI框架：ArkUI（Stage模型）
- IDE：DevEco Studio
- 数据存储：`@ohos.data.preferences`
- 路由：`@ohos.router`

### 📂 简要目录
- entry/src/main/ets/
- ├── pages/          # 全部业务页面
- ├── components/     # 通用 UI 组件
- ├── model/          # 数据模型
- └── app.ets         # 全局状态与静态演示数据

### 🚀 运行方式
1. DevEco Studio打开项目根目录
2. 等待依赖自动同步完成
3. 连接鸿蒙真机或启动模拟器
4. 点击Run运行 entry 模块

> ⚠️ 使用前需要注册新账号；收藏为内存状态，重启应用会清空。

### ⚠️ 限制说明
仅课程演示项目，无后端服务、无真实音频播放，登录为本地简单校验。
素材版权归原作者所有。

---

## 📖 English Introduction
### Overview
A K‑POP fan community app built with HarmonyOS ArkTS. Supports music discovery, artist search, song favorites and profile management. Course demo project with local static data.
Includes 5 artists and 10 sample tracks.

### Features
- User register & login with local storage
- Home banner carousel & song recommendation
- Keyword search for artists
- Random song discovery
- Add / remove song favorites
- Personal profile & signature editing
- Bottom tab navigation: Home / Discover / Favorites / Profile

### Tech Stack
- Language: ArkTS
- UI: ArkUI (Stage model)
- IDE: DevEco Studio
- Data: `@ohos.data.preferences`
- Router: `@ohos.router`

### Quick Start
1. Open project root in DevEco Studio
2. Wait for dependency sync
3. Connect HarmonyOS device or launch emulator
4. Run entry module

> ⚠️ Please register an account before use. Favorites are stored in memory and reset after app restart.

### Notes
This is a course demo. No backend service, no real audio playback. Login is local‑only for demonstration. All media assets belong to their respective copyright owners.
