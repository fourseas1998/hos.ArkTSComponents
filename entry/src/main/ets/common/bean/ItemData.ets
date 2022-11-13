
export default class PageResource{
  /**
   * 标题文字
   */
  title: Resource;
  /**
   * 图片（非必须）
   */
  img?: Resource;
  /**
   * 其它信息（非必须）
   */
  others?: Resource;

  constructor(title:Resource,img?:Resource,others?:Resource){
    this.title=title;
    this.img=img;
    this.others=others;
  }
}