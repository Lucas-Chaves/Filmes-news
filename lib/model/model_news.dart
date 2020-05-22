class ModelNews {
  String body;
  String head;
  String imgUrl;
  String link;
  DateTime publishTime;
  String linkSource;

  ModelNews({
    this.body,
    this.head,
    this.imgUrl,
    this.link,
    this.publishTime,
    this.linkSource,
  });

  ModelNews.fromMap(Map<String, dynamic> map)
      : head = map['head'],
        body = map["body"],
        imgUrl = map['image']['url'],
        link = map['link'],
        publishTime = DateTime.parse(map['publishDateTime']),
        linkSource = map['source']['link'];
}
