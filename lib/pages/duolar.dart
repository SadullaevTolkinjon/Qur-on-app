import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:namozvaqtlari/data/database.dart';

class Duolar extends StatefulWidget {
  const Duolar({Key? key}) : super(key: key);

  @override
  _DuolarState createState() => _DuolarState();
}

class _DuolarState extends State<Duolar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0XFFF4F7FE),
        title: Text(
          "Duolar",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Color(0XFFF4F7FE),
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return AnimatedCard(

                duration: Duration(milliseconds: 600),
                  child: Card(
                child: ListTile(
                  leading: Text("${index + 1}."),
                  title: Text(
                    homePage[index]["name"].toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    homePage[index]["manosi"].toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/duolarmanosi",
                      arguments: homePage[index],
                    );
                  },
                ),
              ));
            },
            itemCount: homePage.length),
      ),
    );
  }
}
