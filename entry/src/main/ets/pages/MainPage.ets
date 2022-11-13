import CommonConstants from '../common/constants/CommonConstants';
import Home from "../view/Home"
import Setting from "../view/Setting"

@Entry
@Component
struct MainPage{
  private tabsController: TabsController = new TabsController();
  @State index: number = CommonConstants.HOME_TAB_INDEX;

  @Builder tabTitles(title: Resource) {
    Text(title)
      .fontWeight(FontWeight.Medium)
      .fontSize($r('app.float.page_title_text_size'))
      .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
      .padding({ left: $r('app.float.mainPage_tabTitles_padding') })
  }

  @Builder baseTab(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.index === targetIndex ? selectedImg : normalImg)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.index === targetIndex ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))
    }
    .margin({ top: $r('app.float.mainPage_baseTab_margin') })
    .height($r('app.float.mainPage_barHeight'))
    .width(CommonConstants.FULL_PARENT)
    .onClick(() => {
      this.index = targetIndex;
      this.tabsController.changeIndex(this.index);
    })
  }

  build(){
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }){
      //首页
      TabContent(){
        //顶部文字
        this.tabTitles($r('app.string.mainPage_tabTitles_home'))
        //滑动窗口
        Home()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.baseTab(CommonConstants.HOME_TITLE, CommonConstants.HOME_TAB_INDEX, $r('app.media.home_selected'), $r('app.media.home_normal')))

      //我的
      TabContent(){
        //顶部文字
        this.tabTitles($r('app.string.mainPage_tabTitles_mine'))
        //滑动窗口
        Setting()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.baseTab(CommonConstants.MINE_TITLE, CommonConstants.MINE_TAB_INDEX, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .width(CommonConstants.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight($r('app.float.mainPage_barHeight'))
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.index = index;
    })
  }
}