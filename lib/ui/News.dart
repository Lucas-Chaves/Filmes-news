import 'package:filmshow/model/index.dart';
import 'package:filmshow/request/Request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  final ModelNews modelNews;

  const NewsPage({this.modelNews});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<ModelNews> listNews = [];
  Request r = Request();
  
  Widget showNotice(ModelNews model) {
    String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(model.publishTime);
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: Column(
        children: <Widget>[
          Image.network(model.imgUrl,
              scale: 0.1, fit: BoxFit.contain, width: MediaQuery.of(context).size.width * 0.5),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(model.head,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              model.body,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              formattedDate,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("From ${model.linkSource}"),
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Dude"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.02),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: listNews.length,
            itemBuilder: (BuildContext context, int index) {
              return showNotice(listNews[index]);
            }),
      ),
    );
  }

  init() async {
    listNews = await r.getNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }
}
