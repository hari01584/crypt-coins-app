class NewsFrame{
  String? postUrl;

  String? imgUrl;
  String? headline;
  String? desc;
  String? time;

  NewsFrame(
    this.postUrl,
    this.imgUrl,
    this.headline,
    this.desc,
    this.time,
  );

  toString(){
    return "News Item Titled "+ (headline??"null");
  }
}
