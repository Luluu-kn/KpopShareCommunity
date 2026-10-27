import dataPreferences from '@ohos.data.preferences';
import router from '@ohos.router';

@Entry
@Component
struct EditProfile {
  @State nickname: string = ""
  @State sign: string = ""
  context: Context = getContext(this);

  async aboutToAppear() {
    let pref = await dataPreferences.getPreferences(this.context, "userData");
    this.nickname = await pref.get("nickname", "Luu") as string;
    this.sign = await pref.get("sign", "K-POP Forever") as string;
  }

  async save() {
    let pref = await dataPreferences.getPreferences(this.context, "userData");
    await pref.put("nickname", this.nickname);
    await pref.put("sign", this.sign);
    await pref.flush();
    router.back();
  }

  build() {
    Column() {
      Text("修改资料").fontSize(20).margin(20)
      Image($r('app.media.my_avatar')).width(100).height(100).borderRadius(50)
      TextInput({ text: this.nickname }).width("85%").margin(15).onChange(v=>this.nickname=v)
      TextInput({ text: this.sign }).width("85%").margin(15).onChange(v=>this.sign=v)
      Button("保存").width("75%").margin({ top: 20 }).onClick(()=>this.save())
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#fff")
  }
}