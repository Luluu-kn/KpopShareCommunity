import dataPreferences from '@ohos.data.preferences';
import router from '@ohos.router';
import { defaultUser } from '../app';

@Entry
@Component
struct ProfilePage {
  @State avatar: Resource = defaultUser.avatar
  @State nickname: string = ""
  @State sign: string = ""
  context: Context = getContext(this);

  async aboutToAppear() {
    let pref = await dataPreferences.getPreferences(this.context, "userData");
    this.nickname = await pref.get("nickname", defaultUser.nickname) as string;
    this.sign = await pref.get("sign", defaultUser.sign) as string;
  }

  build() {
    Column() {
      Navigation() {
        Column() {
          // 头像区域
          Image(this.avatar)
            .width(100)
            .height(100)
            .borderRadius(50)
            .margin({ top: 30, bottom: 12 })
            .shadow({ radius: 6, color: '#00000015', offsetX: 0, offsetY: 3 })

          Text(this.nickname)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 6 })

          Text(this.sign)
            .fontSize(14)
            .fontColor("#777")
            .margin({ bottom: 20 })

          // 关注/粉丝卡片
          Row() {
            Column() {
              Text("136").fontSize(18).fontWeight(FontWeight.Bold)
              Text("关注").fontSize(13).fontColor("#666")
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Center)

            Divider()
              .vertical(true)
              .height(25)
              .color("#E5E5E5")

            Column() {
              Text("299").fontSize(18).fontWeight(FontWeight.Bold)
              Text("粉丝").fontSize(13).fontColor("#666")
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Center)
          }
          .width('88%')
          .padding({ top: 18, bottom: 18 })
          .backgroundColor("#fff")
          .borderRadius(16)
          .shadow({ radius: 6, color: '#00000010', offsetX: 0, offsetY: 2 })
          .margin({ bottom: 25 })

          // 菜单列表（直接写在 ListItem 里，不依赖外部组件）
          List() {
            ListItem() {
              Row() {
                Text("修改资料").fontSize(16).fontColor("#333")
                Column() {
                }
                .layoutWeight(1)
                Text(">").fontSize(16).fontColor("#ccc")
              }
              .width('100%')
              .padding({ left: 20, right: 20, top: 18, bottom: 18 })
            }
            .onClick(() => router.pushUrl({ url: "pages/editProfile" }))

            ListItem() {
              Row() {
                Text("我的收藏").fontSize(16).fontColor("#333")
                Column() {
                }
                .layoutWeight(1)
                Text(">").fontSize(16).fontColor("#ccc")
              }
              .width('100%')
              .padding({ left: 20, right: 20, top: 18, bottom: 18 })
            }
            .onClick(() => router.pushUrl({ url: "pages/favorite" }))

            ListItem() {
              Row() {
                Text("退出登录").fontSize(16).fontColor("#FF4444")
                Column() {
                }
                .layoutWeight(1)
                Text(">").fontSize(16).fontColor("#ccc")
              }
              .width('100%')
              .padding({ left: 20, right: 20, top: 18, bottom: 18 })
            }
            .onClick(() => router.replaceUrl({ url: "pages/login" }))
          }
          .width('90%')
          .backgroundColor("#fff")
          .borderRadius(16)
          .shadow({ radius: 6, color: '#00000010', offsetX: 0, offsetY: 2 })
          .layoutWeight(1)

          // 替代 Spacer
          Column() {
          }
          .layoutWeight(1)
        }
        .width('100%')
        .backgroundColor("#F5F7FA")
      }
      .title("个人中心")
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F5F7FA")
  }
}