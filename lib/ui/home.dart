import 'package:filmshow/ui/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  _navigateToNews(){
    final route = MaterialPageRoute(builder: (_) => NewsPage());
    Navigator.push(context, route);
  }




  Widget cardHome(String text, Function navigate) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1),
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
            right: BorderSide(width: 1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        title: Text(
          text,
          textAlign: TextAlign.center,
        ),
        trailing: Icon(Icons.navigate_next),
        onTap: navigate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hey Movies"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            cardHome("News", _navigateToNews),
          ],
        ),
      ),
    );
  }
}
