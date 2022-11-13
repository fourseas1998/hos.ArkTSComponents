
import CommonConstants from '../common/constants/CommonConstants';
import ItemData from '../common/bean/ItemData';
import mainViewModel from '../viewmodel/MainViewModel';

@Component
export default struct Setting {

  @Builder settingCell(item: ItemData){
    Row(){
      Row({space:CommonConstants.COMMON_SPACE}){
        Image(item.img)
          .width($r('app.float.setting_size'))
          .height($r('app.float.setting_size'))
        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }

      if(item.others===null){
        Image($r('app.media.right_grey'))
          .width($r('app.float.setting_jump_width'))
          .height($r('app.float.setting_jump_height'))
      }else{
        Toggle({type: ToggleType.Switch, isOn: false})
      }

    }
    .width(CommonConstants.FULL_PARENT)
    .padding({left:$r('app.float.setting_settingCell_left'),right:$r('app.float.setting_settingCell_right')})
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build(){
    Scroll(){
      Column({
        space: CommonConstants.COMMON_SPACE
      }){
        //
        Row(){
          //头像
          Image($r('app.media.account'))
            .width($r('app.float.setting_account_size'))
            .height($r('app.float.setting_account_size'))
          Column(){
            Text($r('app.string.setting_account_name'))
              .fontSize($r('app.float.setting_account_fontSize'))
            Text($r('app.string.setting_account_email'))
              .fontSize($r('app.float.little_text_size'))
              .margin({ top: $r('app.float.setting_name_margin') })
          }
          .margin({left:$r('app.float.setting_account_margin')})
          .alignItems(HorizontalAlign.Start)
        }
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.setting_account_height'))
        .margin({top:$r('app.float.setting_account_margin')})
        .padding({left:$r('app.float.setting_account_padding')})
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.setting_account_borderRadius'))
        .alignItems(VerticalAlign.Center)

        List(){
          ForEach(mainViewModel.getSettingListData(),(item:ItemData)=>{
            ListItem(){
              this.settingCell(item);
            }
            .height('38fp')
          },item=>item.toString())
        }
        .padding({
          top: $r('app.float.setting_list_padding'),
          bottom: $r('app.float.setting_list_padding')
        })
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.setting_list_borderRadius'))
        .divider({
          strokeWidth: $r('app.float.setting_list_strokeWidth'),
          color: Color.Grey,
          startMargin: $r('app.float.setting_list_startMargin'),
          endMargin: $r('app.float.setting_list_endMargin')
        })
        //填充空白
        Blank()
        //退出登陆按钮
        Button($r('app.string.setting_button'),{type: ButtonType.Capsule})
          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.login_button_height'))
          .margin({bottom:$r('app.float.setting_button_bottom')})
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.setting_button_fontColor'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.setting_button_backgroundColor'))

      }
      .height('100%')
    }
  }
}