// pages/discover.ets
import { Song, recommendSongs } from '../app'
import { SongItem } from '../components/SongItem'
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct DiscoverPage {
  @State recommendList: Song[] = []

  aboutToAppear() {
    this.refreshRecommend()
  }

  refreshRecommend() {
    let tempList: Song[] = []
    for (let i = 0; i < recommendSongs.length; i++) {
      tempList.push(recommendSongs[i])
    }

    for (let i = tempList.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1))
      const temp = tempList[i]
      tempList[i] = tempList[j]
      tempList[j] = temp
    }

    this.recommendList = tempList.slice(0, 4)
  }

  build() {
    Column() {
      Navigation() {
        Column() {
          Row() {
            Text("发现")
              .fontSize(32)
              .fontWeight(FontWeight.Bold)

            Column() {}
            .layoutWeight(1)

            Button("刷新")
              .width(80)
              .height(35)
              .fontSize(14)
              .backgroundColor('#0D9FFB')
              .borderRadius(18)
              .onClick(() => {
                this.refreshRecommend()
              })
          }
          .width('90%')
          .margin({ top: 10, bottom: 20 })

          Text("新歌速递")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .width('90%')
            .margin({ bottom: 15 })

          Scroll() {
            Row() {
              ForEach(this.recommendList, (song: Song) => {
                Column() {
                  Image(song.img)
                    .width(120)
                    .height(120)
                    .borderRadius(12)
                    .objectFit(ImageFit.Cover)

                  Text(song.name)
                    .fontSize(14)
                    .margin({ top: 8 })
                    .maxLines(1)
                }
                .margin({ right: 15 })
              })
            }
          }
          .scrollable(ScrollDirection.Horizontal)
          .width('100%')
          .height(160)
          .margin({ bottom: 25 })

          Text("热门推荐")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .width('90%')
            .margin({ bottom: 15 })

          List() {
            ForEach(this.recommendList, (song: Song) => {
              ListItem() {
                SongItem({ song: song, isFavorite: false })
                  .onClick(() => {
                    promptAction.showToast({
                      message: "收藏成功",
                      duration: 2000
                    })
                  })
              }
              .backgroundColor('#fff')
              .margin({ bottom: 6 })
              .borderRadius(12)
            })
          }
          .width('90%')
          .layoutWeight(1)

        }
        .width('100%')
        .backgroundColor('#F5F7FA')
      }
      .title("发现音乐")
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
  }
}