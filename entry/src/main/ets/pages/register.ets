import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct RegisterPage {
  @State username: string = "";
  @State password: string = "";
  @State repwd: string = "";
  private dataPref: preferences.Preferences | null = null;

  async aboutToAppear() {
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.dataPref = await preferences.getPreferences(context, 'user_db');
  }

  build() {
    Column() {
      Text("注册账号")
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 80, bottom: 40 })

      TextInput({ placeholder: "请输入账号", text: this.username })
        .width("85%")
        .height(52)
        .margin(10)
        .borderRadius(12)
        .backgroundColor("#fff")
        .padding({ left: 16 })
        .onChange(v => this.username = v)

      TextInput({ placeholder: "请输入密码", text: this.password })
        .type(InputType.Password)
        .width("85%")
        .height(52)
        .margin(10)
        .borderRadius(12)
        .backgroundColor("#fff")
        .padding({ left: 16 })
        .onChange(v => this.password = v)

      TextInput({ placeholder: "请确认密码", text: this.repwd })
        .type(InputType.Password)
        .width("85%")
        .height(52)
        .margin(10)
        .borderRadius(12)
        .backgroundColor("#fff")
        .padding({ left: 16 })
        .onChange(v => this.repwd = v)

      Button("立即注册")
        .width("75%")
        .height(48)
        .backgroundColor("#3D7FFF")
        .borderRadius(12)
        .margin({ top: 25 })
        .onClick(async () => {
          if (!this.username || !this.password || !this.repwd) {
            promptAction.showToast({ message: "不能为空" });
            return;
          }
          if (this.password !== this.repwd) {
            promptAction.showToast({ message: "两次密码不一致" });
            return;
          }
          // 保存到本地存储
          await this.dataPref?.put('reg_username', this.username);
          await this.dataPref?.put('reg_password', this.password);
          await this.dataPref?.flush();
          promptAction.showToast({ message: "注册成功，请登录" });
          router.back(); // 返回登录页
        })

      Text("返回登录")
        .fontSize(14)
        .fontColor("#666")
        .margin({ top: 20 })
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F5F7FA")
    .justifyContent(FlexAlign.Start)
  }
}