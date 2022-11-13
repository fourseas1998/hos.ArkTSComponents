import CommonConstants from '../common/constants/CommonConstants'
import prompt from '@ohos.prompt';
import router from '@ohos.router';


@Extend(TextInput) function textInputStyle(){
  .width(CommonConstants.FULL_PARENT)
  .height($r('app.float.login_input_height'))
  .padding({
    left: CommonConstants.INPUT_PADDING_LEFT
  })
  .margin({
    top: $r('app.float.input_margin_top')
  })
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .placeholderColor($r('app.color.placeholder_color'))
}

@Extend(Line) function lineStyle(){
  .width(CommonConstants.FULL_PARENT)
  .height($r('app.float.line_height'))
  .backgroundColor($r('app.color.line_color'))
}

@Extend(Text) function blueTextStyle(){
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
  .fontColor($r('app.color.login_blue_text_color'))
}

@Entry
@Component
struct LoginPage {
  @State isShowLoadingProgress: boolean = false;
  @State account: string = '';
  @State password: string = '';
  private timeOutId = null;

  /**
   * 当组件销毁时
   */
  aboutToDisappear(){
    clearTimeout(this.timeOutId);
    this.timeOutId=null;
  }

  /**
   * 图片按钮
   * @param src 图片url
   */
  @Builder imageButton(src: Resource) {
    Button({
      type: ButtonType.Circle,
      stateEffect: true
    }) {
      Image(src)
    }
    .width($r('app.float.other_login_image_size'))
    .height($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }

  /**
   * 登陆方法
   */
  login(){
    //如果未输入账号 或者 密码，则进行提示
    if(this.account === '' || this.password===''){
      prompt.showToast({
        message: $r('app.string.input_empty_tips')
      })
    }else{
      this.isShowLoadingProgress=true;
      //设置2秒等待时间，显示登陆加载动画，然后跳转页面
      if(this.timeOutId===null){
        this.timeOutId=setTimeout(()=>{
          this.isShowLoadingProgress=false;
          this.timeOutId=null;
          router.replace({
            url: 'pages/MainPage'
          })
        }, CommonConstants.LOGIN_DELAY_TIME)
      }
    }
  }

  /**
   * 构建页面
   */
  build() {
    //    垂直布局
    Column() {
      //      Logo图片
      Image($r('app.media.logo'))
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .margin({
          top: $r('app.float.logo_margin_top'),
          bottom: $r('app.float.logo_margin_bottom')
        })
      //      文字-登陆页面
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))
      //      文字-登陆说明
      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.login_more_text_color'))
        .margin({
          top: $r('app.float.login_more_margin_top'),
          bottom: $r('app.float.login_more_margin_bottom'),
        })
      //      文字输入框-账号
      TextInput({
        placeholder: $r('app.string.account')
      })
        .type(InputType.Number)
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .textInputStyle()
        .onChange((value:string) => {
          this.account = value;
        })
      //间隔线
      Line().lineStyle()
      //      文字输入框-密码
      TextInput({
        placeholder: $r('app.string.password')
      })
      .type(InputType.Password)
      .maxLength(CommonConstants.INPUT_PASSWORD_LENGTH)
      .textInputStyle()
      .onChange((value:string) => {
        this.password = value;
      })
      //间隔线
      Line().lineStyle()
      //      同一行
      Row() {
        //        短信验证码
        Text($r('app.string.message_login'))
          .blueTextStyle()
        //        忘记密码
        Text($r('app.string.forgot_password'))
          .blueTextStyle()
      }
      .width(CommonConstants.FULL_PARENT)
      .margin({
        top: $r('app.float.forgot_margin_top')
      })
      .justifyContent(FlexAlign.SpaceBetween)
      //      登陆按钮
      Button($r('app.string.login'),{
        type: ButtonType.Capsule
      })
        .width(CommonConstants.BUTTON_WIDTH)
        .height($r('app.float.login_button_height'))
        .margin({
          top: $r('app.float.login_button_margin_top'),
          bottom: $r('app.float.login_button_margin_bottom')
        })
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .onClick(()=>{
          this.login();
        })
      //      注册账号
      Text($r('app.string.register_account'))
        .fontSize($r('app.float.normal_text_size'))
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.login_blue_text_color'))
      //      登陆时加载进度框
      if (this.isShowLoadingProgress) {
        LoadingProgress()
          .width($r('app.float.login_progress_size'))
          .height($r('app.float.login_progress_size'))
          .margin({
            top: $r('app.float.login_progress_margin_top')
          })
          .color($r('app.color.loading_color'))
      }
      //主轴上面填充空白的组件
      Blank()
      //      文字-其它登陆方式
      Text($r('app.string.other_login_method'))
      .margin({
        top: $r('app.float.other_login_margin_top'),
        bottom: $r('app.float.other_login_margin_bottom')
      })
      .fontSize($r('app.float.little_text_size'))
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.other_login_text_color'))
      //      同一行
      Row({
        space: CommonConstants.LOGIN_METHODS_SPACE
      }) {
        //        图片按钮-方式1
        this.imageButton($r('app.media.login_method1'))
        //        图片按钮-方式2
        this.imageButton($r('app.media.login_method2'))
        //        图片按钮-方式3
        this.imageButton($r('app.media.login_method3'))
      }
    }
    .width(CommonConstants.FULL_PARENT)
    .height(CommonConstants.FULL_PARENT)
    .padding({
      bottom: $r('app.float.login_page_padding_bottom'),
      left: $r('app.float.page_padding_hor'),
      right: $r('app.float.page_padding_hor'),
    })
    .backgroundColor($r('app.color.background'))
  }
}