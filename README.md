一、项目简介
KPOPShareCommunity（KpopShareHub） 是一款基于 HarmonyOS（鸿蒙） 原生开发的 K-POP 音乐分享社区移动应用，使用 ArkTS 语言与声明式 UI（ArkUI）编写。
应用面向 K-POP 粉丝群体，围绕「发现音乐 → 收藏音乐 → 展示个性」的用户闭环，提供歌曲推荐、艺人检索、随机发现、歌曲收藏与个人中心等功能，并配套完整的注册登录与本地数据持久化能力。整体界面采用轮播图 + 卡片列表的信息展示形式，风格简洁清新。
核心数据：内置 5 位热门艺人（BTS、TXT、BLACKPINK、Cortis、NewJeans）与 10 首代表曲目。
二、功能特性
模块
功能说明
实现要点
登录 / 注册
账号密码登录、新用户注册、二次密码校验
@ohos.data.preferences 本地持久化，注册信息写入 user_db
首页
顶部轮播图（自动播放）、艺人搜索入口、推荐歌曲列表
Swiper 轮播 + List 列表 + ForEach 渲染
搜索页
按关键词模糊搜索艺人，展示头像、简介与代表作
Array.find() + 大小写不敏感匹配，支持未找到提示
发现页
「新歌速递」横向滚动 + 「热门推荐」列表，一键刷新换歌
Fisher–Yates 洗牌算法随机推荐
收藏页
收藏歌曲列表、取消收藏、空状态引导
全局 favoriteList 状态同步 + EmptyTip 空态组件
个人中心
头像、昵称、签名展示，关注/粉丝数据卡片
Preferences 读取本地用户资料
修改资料
编辑昵称与个性签名并保存
put() + flush() 写回 Preferences
底部导航
首页 / 发现 / 收藏 / 我的 四个 Tab
router.pushUrl() 页面路由跳转
三、页面结构
启动页为登录页（pages/login），登录后进入首页，通过底部 Tab 在四个主页面间切换。
pages/login        →  登录页（应用入口）
pages/register     →  注册页
pages/Index        →  首页（轮播 + 搜索 + 推荐列表）
pages/search       →  艺人搜索结果页
pages/discover     →  发现页（新歌速递 / 热门推荐）
pages/favorite     →  我的收藏
pages/profile      →  个人中心
pages/editProfile  →  修改资料
四、项目结构
KPOPShareCommunity/
├── AppScope/                     # 应用级配置（bundleName、图标、版本）
│   └── app.json5
├── entry/                        # 主模块（Entry Module）
│   └── src/main/
│       ├── ets/
│       │   ├── app.ets               # 全局数据：Song 类、推荐歌曲、收藏列表、默认用户
│       │   ├── entryability/         # EntryAbility 生命周期入口
│       │   ├── entrybackupability/   # 备份恢复扩展能力
│       │   ├── components/
│       │   │   ├── SongItem.ets      # 歌曲列表项（含收藏图标交互）
│       │   │   ├── ArtistCard.ets    # 艺人卡片组件
│       │   │   └── EmptyTip.ets      # 空状态提示组件
│       │   ├── model/
│       │   │   └── Artist.ets        # 艺人数据模型与静态数据
│       │   └── pages/                # 8 个业务页面
│       ├── resources/            # 图片、颜色、字符串、配置等资源
│       └── module.json5          # 模块配置（Ability、权限、设备类型）
├── build-profile.json5           # 构建配置（SDK 版本、签名、构建模式）
├── oh-package.json5              # 工程依赖配置
└── hvigorfile.ts                 # Hvigor 构建脚本
五、技术栈
类别
说明
开发语言
ArkTS（TypeScript 超集）
UI 框架
ArkUI 声明式开发范式（Stage 模型）
开发工具
DevEco Studio
SDK
HarmonyOS compatibleSdkVersion 6.1.0(23)
数据持久化
@ohos.data.preferences / @kit.ArkData（用户资料、账号密码）
页面路由
@ohos.router（pushUrl / replaceUrl / back）
交互反馈
@ohos.promptAction（Toast 提示）
设备类型
Phone
六、快速开始
1. 环境要求
- DevEco Studio（支持 HarmonyOS 6.1.0(23) 及以上）
- HarmonyOS SDK（Stage 模型）
- 鸿蒙真机（HarmonyOS 设备）或 DevEco Studio 本地模拟器
2. 运行步骤
# 1. 使用 DevEco Studio 打开项目根目录
#    File → Open → 选择 KPOPShareCommunity 文件夹

# 2. 等待 Hvigor 自动同步依赖（oh_modules）

# 3. 连接真机（需开启开发者模式与 USB 调试）或启动模拟器

# 4. 点击工具栏 Run ▶ 运行 entry 模块
也可使用命令行构建（需已配置 DevEco 环境变量）：
hvigorw assembleHap --mode module -p product=default
3. 首次使用
注意：应用无内置可用账号，请先点击登录页的「没有账号？前往注册」完成注册，再用注册的账号密码登录。
app.ets 中的默认用户（nickname: Luu、sign: K-POP Forever）仅用于个人中心的展示兜底，不能用于登录。
七、数据说明
- 歌曲数据：entry/src/main/ets/app.ets 中的 recommendSongs，共 10 首，覆盖 5 位艺人，属演示用静态数据。
- 艺人数据：entry/src/main/ets/model/Artist.ets 中的 artistList，包含艺人头像、简介与代表作。
- 收藏数据：全局变量 favoriteList，内存态维护，应用重启后重置。
- 用户数据：Preferences 持久化，分别存储于 user_db（账号密码）与 userData（昵称、签名）。
八、已知限制与后续计划
已知限制
- 数据均为本地静态/内存数据，未接入网络后端，重启后收藏列表清空。
- 无真实音乐播放能力，仅做展示与收藏。
- 登录鉴权为本地明文校验，未做加密处理，仅适用于课程演示。
- 首页收藏图标点击后，列表收藏态需手动刷新页面后生效。
后续计划
[ ] 接入云端数据源，实现歌曲/艺人的动态拉取
[ ] 接入真实音频播放能力（AVPlayer）
[ ] 收藏数据本地持久化
[ ] 增加社区动态发布与评论功能
[ ] 支持深色模式与多语言切换
九、许可与声明
本项目为课程设计（Course Project）用途，图片素材与艺人资料仅用于学习演示，版权归原作者所有。
<a id="english-version"></a>
English Version
1. Overview
KPOPShareCommunity (KpopShareHub) is a K-POP music sharing community app built natively for HarmonyOS, written in ArkTS with the declarative ArkUI framework.
Designed for K-POP fans, the app covers the complete user journey of "discover music → favorite music → express yourself", offering song recommendations, artist search, random discovery, favorites management, and a personal profile center, together with full registration/login and local data persistence. The UI features a banner carousel plus card-based lists with a clean, fresh visual style.
Built-in data: 5 popular artists (BTS, TXT, BLACKPINK, Cortis, NewJeans) and 10 signature tracks.
2. Features
Module
Description
Implementation
Login / Register
Account login, new user registration, password confirmation
@ohos.data.preferences persistence, credentials stored in user_db
Home
Auto-play banner carousel, artist search entry, recommended song list
Swiper + List + ForEach rendering
Search
Fuzzy artist search by keyword; shows avatar, bio and signature works
Array.find() with case-insensitive matching; "not found" state
Discover
Horizontal "New Releases" scroller + "Hot Picks" list, one-tap refresh
Fisher–Yates shuffle algorithm for random recommendations
Favorites
Favorites list, remove from favorites, empty-state guidance
Global favoriteList state + EmptyTip component
Profile
Avatar, nickname, bio, following/follower stat cards
Reads local user profile from Preferences
Edit Profile
Edit and save nickname and personal bio
put() + flush() back to Preferences
Bottom Tabs
Home / Discover / Favorites / Profile
router.pushUrl() navigation
3. Page Structure
The app launches on the login page (pages/login); after login, users switch between the four main pages via the bottom tab bar.
pages/login        →  Login (app entry)
pages/register     →  Register
pages/Index        →  Home (carousel + search + recommended list)
pages/search       →  Artist search results
pages/discover     →  Discover (new releases / hot picks)
pages/favorite     →  My Favorites
pages/profile      →  Profile Center
pages/editProfile  →  Edit Profile
4. Tech Stack
Category
Details
Language
ArkTS (TypeScript superset)
UI Framework
ArkUI declarative paradigm (Stage model)
IDE
DevEco Studio
SDK
HarmonyOS compatibleSdkVersion 6.1.0(23)
Persistence
@ohos.data.preferences / @kit.ArkData
Routing
@ohos.router (pushUrl / replaceUrl / back)
Feedback
@ohos.promptAction (Toast)
Device
Phone
5. Getting Started
Requirements
- DevEco Studio (supporting HarmonyOS 6.1.0(23) or higher)
- HarmonyOS SDK (Stage model)
- A HarmonyOS device or the DevEco Studio emulator
Steps
# 1. Open the project root in DevEco Studio
#    File → Open → select the KPOPShareCommunity folder

# 2. Wait for Hvigor to sync dependencies (oh_modules)

# 3. Connect a device (developer mode + USB debugging enabled) or start the emulator

# 4. Click Run ▶ to build and launch the entry module
First Run
No built-in account is available. Tap "No account? Register" on the login page to create one, then log in with those credentials.
The default user in app.ets (nickname: Luu, sign: K-POP Forever) is only a display fallback for the profile page and cannot be used to log in.
6. Data Notes
- Songs: recommendSongs in entry/src/main/ets/app.ets — 10 tracks across 5 artists (static demo data).
- Artists: artistList in entry/src/main/ets/model/Artist.ets — avatar, bio and signature works.
- Favorites: global favoriteList, kept in memory and reset on app restart.
- User data: persisted via Preferences in user_db (credentials) and userData (nickname, bio).
7. Known Limitations & Roadmap
Known Limitations
- All data is local/static; no backend is connected, and the favorites list is cleared after restart.
- No real audio playback — songs are for display and favoriting only.
- Login authentication is a local plaintext check with no encryption (course demo only).
- After tapping the favorite icon on Home, the list's favorite state updates only after a manual refresh.
Roadmap
[ ] Connect a cloud data source for dynamic songs/artists
[ ] Integrate real audio playback (AVPlayer)
[ ] Persist favorites locally
[ ] Add community posting and comments
[ ] Support dark mode and multi-language
8. License & Disclaimer
This project is for course/demo purposes. Image assets and artist information are used for learning demonstration only, and their copyrights belong to their original owners.
