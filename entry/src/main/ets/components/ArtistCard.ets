@Component
export struct ArtistCard {
  @Prop name: string
  @Prop avatar: Resource
  @Prop intro: string

  build() {
    Column() {
      Image(this.avatar)
        .width(100)
        .height(100)
        .borderRadius(50)
      Text(this.name)
        .fontSize(22)
        .fontWeight(600)
        .margin({ top: 8 })
      Text(this.intro)
        .fontSize(14)
        .fontColor("#666")
        .margin({ top: 4 })
    }
    .width('100%')
    .padding(20)
    .backgroundColor("#fff")
    .borderRadius(12)
    .margin({ top: 10 })
  }
}