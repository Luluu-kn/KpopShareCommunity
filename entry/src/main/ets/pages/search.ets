// pages/search.ets
import router from '@ohos.router'
import { artistList, Artist } from '../model/Artist'

@Entry
@Component
struct SearchPage {
  @State keyword: string = ""
  @State resultArtist: Artist | null = null

  aboutToAppear() {
    const params = router.getParams() as Record<string, string>
    if (params && params.keyword) {
      this.keyword = params.keyword
      this.searchArtist(this.keyword)
    }
  }
//查找
  searchArtist(name: string) {
    const find = artistList.find(item =>
    item.name.toLowerCase().includes(name.toLowerCase())
    )
    this.resultArtist = find ?? null
  }

  build() {
    Column() {
      Search({ placeholder: "搜索艺人：BTS / TXT / BLACKPINK / Cortis / NewJeans", value: this.keyword })
        .width('90%')
        .margin(15)
        .onChange((val: string) => {
          this.keyword = val
        })
        // 关键：加上提交事件
        .onSubmit(() => {
          this.searchArtist(this.keyword)
        })

      if (this.resultArtist) {
        Column() {
          Image(this.resultArtist.avatar)
            .width(130)
            .height(130)
            .borderRadius(65)
            .margin({ bottom: 15 })

          Text(this.resultArtist.name)
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          Text(this.resultArtist.intro)
            .fontSize(16)
            .fontColor("#666")
            .textAlign(TextAlign.Center)
            .margin({ bottom: 15 })

          Text("代表作：" + this.resultArtist.works.join(" / "))
            .fontSize(15)
            .fontColor("#888")
        }
        .width('90%')
        .padding(20)
        .backgroundColor("#fff")
        .borderRadius(16)
      } else if (this.keyword.trim() !== "") {
        Text("未找到该艺人")
          .fontSize(17)
          .fontColor("#999")
          .margin({ top: 40 })
      }

      Column() {
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F5F5F5")
  }
}