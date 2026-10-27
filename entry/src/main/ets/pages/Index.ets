// pages/Index.ets
import { Song, recommendSongs, favoriteList } from '../app'
import { SongItem } from '../components/SongItem'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State bannerImages: Resource[] = [
    $r('app.media.banner1'),
    $r('app.media.banner2'),
    $r('app.media.banner3')
  ];

  @State searchText: string = "";

  build() {
    Column() {
      Column() {
        // 轮播图
        Swiper() {
          ForEach(this.bannerImages, (imgRes: Resource) => {
            Image(imgRes)
              .width('100%')
              .height(160)
              .objectFit(ImageFit.Cover)
          })
        }
        .width('100%')
        .height(160)
        .autoPlay(true)
        .interval(3000)
        .loop(true)
        .indicator(true)

        // 搜索框
        Search({ placeholder: "搜索艺人", value: this.searchText })
          .width('90%')
          .margin({ top: 10, bottom: 10 })
          .onSubmit(() => {
            router.pushUrl({
              url: "pages/search",
              params: { keyword: this.searchText }
            })
          })

        // 推荐歌曲标题
        Text("推荐歌曲")
          .fontSize(18)
          .width('90%')
          .margin({ bottom: 10 })
          .fontWeight(FontWeight.Medium)
          .textAlign(TextAlign.Start)

        // 歌曲列表
        List() {
          ForEach(recommendSongs, (song: Song) => {
            ListItem() {
              SongItem({
                song: song,
                isFavorite: favoriteList.some(i => i.id === song.id)
              })
            }
            .margin({ bottom: 6 })
            .borderRadius(12)
          })
        }
        .width('90%')
        .layoutWeight(1)
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor("#F5F5F5")

      // ===================== 底部导航 TabBar =====================
      Row() {
        // 首页
        Column() {
          Image($r('app.media.ic_home')).width(24).height(24)
          Text("首页").fontSize(12)
        }
        .layoutWeight(1)

        // 发现
        Column() {
          Image($r('app.media.ic_discover')).width(24).height(24)
          Text("发现").fontSize(12)
        }
        .layoutWeight(1)
        .onClick(() => {
          router.pushUrl({ url: "pages/discover" })
        })

        // 收藏
        Column() {
          Image($r('app.media.ic_fav')).width(24).height(24)
          Text("收藏").fontSize(12)
        }
        .layoutWeight(1)
        .onClick(() => {
          router.pushUrl({ url: "pages/favorite" })
        })

        // 我的
        Column() {
          Image($r('app.media.ic_profile')).width(24).height(24)
          Text("我的").fontSize(12)
        }
        .layoutWeight(1)
        .onClick(() => {
          router.pushUrl({ url: "pages/profile" })
        })
      }
      .width('100%')
      .height(60)
      .backgroundColor("#fff")
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F5F5F5")
  }
}