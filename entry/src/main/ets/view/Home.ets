import CommonConstants from '../common/constants/CommonConstants'
import mainViewModel from '../viewmodel/MainViewModel'
import ItemData from '../common/bean/ItemData'

@Component
export default struct Home {
  private swiperController: SwiperController=new SwiperController();

  build(){
    //滑动窗口
    Scroll(){
      //垂直布局
      Column(){
        //轮播图
        Swiper(this.swiperController){
          ForEach(mainViewModel.getSwiperImages(),(img:Resource)=> {
            Image(img).borderRadius($r('app.float.home_swiper_borderRadius'))
          },img => img.id)
        }
        .margin({
          top: $r('app.float.home_swiper_margin')
        })
        .autoPlay(true)
        //表格1
        Grid(){
          ForEach(mainViewModel.getFirstGridData(),(item: ItemData)=>{
            //子
            GridItem(){
              Column(){
                Image(item.img)
                  .width($r('app.float.home_homeCell_size'))
                  .height($r('app.float.home_homeCell_size'))
                Text(item.title)
                  .margin({
                    top: $r('app.float.home_homeCell_margin')
                  })
                  .fontSize($r('app.float.little_text_size'))
              }
            }
          }, item => item.toString())
        }
        .height($r('app.float.home_grid_height'))
        .padding({
          top:$r('app.float.home_grid_padding'),
          bottom:$r('app.float.home_grid_padding')
        })
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsGap($r('app.float.home_grid_rowGap'))
        .rowsTemplate('1fr 1fr')
        //文字
        Text($r('app.string.home_list'))
          .width(CommonConstants.FULL_PARENT)
          .padding({
            left: $r('app.float.home_list_padding'),
          })
          .margin({
            top: $r('app.float.home_text_margin'),
            bottom: $r('app.float.home_text_margin'),
          })
          .fontSize($r('app.float.normal_text_size'))
          .fontWeight(FontWeight.Medium)
        //表格2
        Grid(){
          ForEach(mainViewModel.getSecondGridData(),(item:ItemData) => {
            //子
            GridItem(){
              Column(){
                Text(item.title)
                  .fontSize($r('app.float.normal_text_size'))
                  .fontWeight(FontWeight.Medium)
                Text(item.others)
                  .margin({
                    top: $r('app.float.home_list_margin')
                  })
                  .fontSize($r('app.float.little_text_size'))
                  .fontColor($r('app.color.home_grid_fontColor'))
              }
              .alignItems(HorizontalAlign.Start)
            }
            .width(CommonConstants.FULL_PARENT)
            .height(CommonConstants.FULL_PARENT)
            .padding({
              top: $r('app.float.home_list_padding'),
              left: $r('app.float.home_list_padding')
            })
            .backgroundImage(item.img)
            .backgroundImageSize(ImageSize.Cover)
            .borderRadius($r('app.float.home_backgroundImage_borderRadius'))
            .align(Alignment.TopStart)
          },item => item.toString())
        }
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.home_secondGrid_height'))
        .padding({
          left: $r('app.float.home_list_padding'),
          right: $r('app.float.home_list_padding'),
        })
        .margin({
          bottom: $r('app.float.setting_button_bottom')
        })
        .columnsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsTemplate('1fr 1fr 1fr 1fr')
        .rowsGap($r('app.float.home_grid_rowGap'))
      }
    }
  }
}