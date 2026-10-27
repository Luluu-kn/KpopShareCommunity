import { Song, favoriteList } from '../app.ets'
import promptAction from '@ohos.promptAction'; // 弹窗提示

@Component
export struct SongItem {
  @Prop song: Song = new Song(0, '', '', $r('app.media.my_avatar'))
  @Prop isFavorite: boolean = false

  build() {
    Row() {
      Image(this.song.img)
        .width(60)
        .height(60)
        .borderRadius(8)

      Column() {
        Text(this.song.name)
          .fontSize(16)
          .fontWeight(500)
        Text(this.song.artist)
          .fontSize(12)
          .fontColor("#999")
      }
      .layoutWeight(1)
      .margin({ left: 10 })

      // ======================
      // 收藏图标（点击切换）
      // ======================
      Image(this.isFavorite ? $r('app.media.ic_fav') : $r('app.media.ic_fav_normal'))
        .width(26)
        .height(26)
        .onClick(() => {
          let index = favoriteList.findIndex(i => i.id === this.song.id)
          if (index === -1) {
            // 收藏
            favoriteList.push(this.song);
            promptAction.showToast({ message: "收藏成功" });
          } else {
            // 取消收藏
            favoriteList.splice(index, 1);
            promptAction.showToast({ message: "已取消收藏" });
          }
        })
    }
    .width('100%')
    .padding(10)
    .backgroundColor("#fff")
    .borderRadius(10)
    .margin({ bottom: 8 })
  }
}