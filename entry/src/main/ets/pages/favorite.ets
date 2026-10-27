// pages/favorite.ets
import { Song, favoriteList } from '../app'
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct Favorite {
  @State favData: Song[] = [...favoriteList]

  // 取消收藏：filter过滤，生成新数组赋值触发刷新
  removeFavorite(song: Song) {
    this.favData = this.favData.filter(item => item.id !== song.id)
    let idx = favoriteList.findIndex(s => s.id === song.id)//同步全局
    if(idx > -1) favoriteList.splice(idx,1)
    promptAction.showToast({ message: "已取消收藏" });
  }

  build() {
    Column() {
      Navigation() {
        Column() {
          if (this.favData.length === 0) {
            Column() {
              Text("🎵")
                .fontSize(50)
                .margin({ bottom: 10 })
              Text("暂无收藏歌曲")
                .fontSize(17)
                .fontColor("#888")
              Text("去首页收藏你喜欢的歌曲吧")
                .fontSize(14)
                .fontColor("#aaa")
                .margin({ top: 6 })
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
          } else {
            List() {
              // ForEach第三个参数：用song.id做唯一key，必加，防止渲染错乱
              ForEach(this.favData, (song: Song) => {
                ListItem() {
                  Row() {
                    Image(song.img)
                      .width(50)
                      .height(50)
                      .borderRadius(8)
                      .margin({ right:12 })

                    Text(song.name)
                      .fontSize(16)
                      .fontWeight(FontWeight.Medium)
                      .layoutWeight(1)

                    // 红色取消按钮
                    Button("取消")
                      .width(60)
                      .height(30)
                      .fontSize(12)
                      .backgroundColor("#ff5555")
                      .fontColor("#fff")
                      .borderRadius(6)
                      .onClick(()=>{
                        this.removeFavorite(song)
                      })
                  }
                  .width('100%')
                  .padding(12)
                  .backgroundColor("#ffffff")
                }
                .margin({ bottom:8 })
                .borderRadius(14)
              },(item:Song)=>item.id.toString()) // key=歌曲id
            }
            .width('90%')
            .layoutWeight(1)
            .margin({ top:15 })
          }
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#F5F7FA')
      }
      .title("我的收藏")
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
  }
}