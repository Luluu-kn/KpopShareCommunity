import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct LoginPage {
  @State username: string = "";
  @State password: string = "";
  private dataPref: preferences.Preferences | null = null;

  async aboutToAppear() {
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.dataPref = await preferences.getPreferences(context, 'user_db');
  }

  build() {
    Column() {
      Text("KpopShareHub")
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 100, bottom: 50 })
        .fontColor("#333")

      TextInput({ placeholder: "账号", text: this.username })
        .width("85%")
        .height(52)
        .margin(10)
        .borderRadius(12)
        .backgroundColor("#fff")
        .padding({ left: 16 })
        .onChange(v => this.username = v)

      TextInput({ placeholder: "密码", text: this.password })
        .type(InputType.Password)
        .width("85%")
        .height(52)
        .margin(10)
        .borderRadius(12)
        .backgroundColor("#fff")
        .padding({ left: 16 })
        .onChange(v => this.password = v)

      Button("登录")
        .width("75%")
        .height(48)
        .backgroundColor("#3D7FFF")
        .borderRadius(12)
        .margin({ top: 25 })
        .onClick(async () => {
          if (!this.username || !this.password) {
            promptAction.showToast({ message: "账号密码不能为空" });
            return;
          }
          // 从本地存储读取注册的账号密码
          const saveUser = await this.dataPref?.get('reg_username', '');
          const savePwd = await this.dataPref?.get('reg_password', '');
          if (saveUser === this.username && savePwd === this.password) {
            promptAction.showToast({ message: "登录成功" });
            router.replaceUrl({ url: "pages/Index" });
          } else {
            promptAction.showToast({ message: "账号或密码错误" });
          }
        })

      // 跳转到注册页
      Text("没有账号？前往注册")
        .fontSize(14)
        .fontColor("#3D7FFF")
        .margin({ top: 20 })
        .onClick(() => {
          router.pushUrl({ url: "pages/register" });
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F5F7FA")
    .justifyContent(FlexAlign.Start)
  }
}