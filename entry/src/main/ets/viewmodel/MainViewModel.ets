
import ItemData from '../common/bean/ItemData'

export class MainViewModel{
  /**
   * 获取轮播图资源
   */
  getSwiperImages(): Array<Resource>{
    let swiperImages: Resource[]=[
      $r('app.media.fig1'),
      $r('app.media.fig2'),
      $r('app.media.fig3'),
      $r('app.media.fig4'),
    ];
    return swiperImages;
  }

  /**
   * 获取第1个表格的数据资源
   */
  getFirstGridData(): Array<ItemData>{
    let firstGridData: ItemData[] = [
      new ItemData($r('app.string.my_love'), $r('app.media.love')),
      new ItemData($r('app.string.history_record'), $r('app.media.record')),
      new ItemData($r('app.string.message'), $r('app.media.message')),
      new ItemData($r('app.string.shopping_cart'), $r('app.media.shopping')),
      new ItemData($r('app.string.my_goal'), $r('app.media.target')),
      new ItemData($r('app.string.group'), $r('app.media.circle')),
      new ItemData($r('app.string.favorites'), $r('app.media.favorite')),
      new ItemData($r('app.string.recycle_bin'), $r('app.media.recycle'))
    ];
    return firstGridData;
  }

  /**
   * 获取第2个表格的数据资源
   */
  getSecondGridData(): Array<ItemData> {
    let secondGridData: ItemData[] = [
      new ItemData($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top')),
      new ItemData($r('app.string.mainPage_new'), $r('app.media.new'), $r('app.string.mainPage_text_new')),
      new ItemData($r('app.string.mainPage_brand'), $r('app.media.brand'), $r('app.string.mainPage_text_brand')),
      new ItemData($r('app.string.mainPage_found'), $r('app.media.found'), $r('app.string.mainPage_text_found')),
    new ItemData($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top')),
    new ItemData($r('app.string.mainPage_new'), $r('app.media.new'), $r('app.string.mainPage_text_new')),
    new ItemData($r('app.string.mainPage_brand'), $r('app.media.brand'), $r('app.string.mainPage_text_brand')),
    new ItemData($r('app.string.mainPage_found'), $r('app.media.found'), $r('app.string.mainPage_text_found'))
    ];
    return secondGridData;
  }

  /**
   * 获取设置页数据资源
   */
  getSettingListData(): Array<ItemData> {
    let settingListData: ItemData[] = [
      new ItemData($r('app.string.setting_list_news'), $r("app.media.news"), $r("app.string.setting_toggle")),
      new ItemData($r('app.string.setting_list_data'), $r("app.media.data"), null),
      new ItemData($r('app.string.setting_list_menu'), $r("app.media.menu"), null),
      new ItemData($r('app.string.setting_list_about'), $r("app.media.about"), null),
      new ItemData($r('app.string.setting_list_storage'), $r("app.media.storage"), null),
      new ItemData($r('app.string.setting_list_privacy'), $r("app.media.privacy"), null)
    ];
    return settingListData;
  }

}

export default new MainViewModel();