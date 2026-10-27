@Component
export struct EmptyTip {
  @Prop text: string = "暂无数据"

  build() {
    Column() {
      Text(this.text)
        .fontSize(16)
        .fontColor("#999")
    }
    .width('100%')
    .height(250)
    .justifyContent(FlexAlign.Center)
  }
}