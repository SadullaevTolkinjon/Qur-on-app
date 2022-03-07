import 'package:flutter/material.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';

class DuolarManosi extends StatefulWidget {
  var data;
  DuolarManosi({Key? key, this.data}) : super(key: key);

  @override
  _DuolarManosiState createState() => _DuolarManosiState();
}

class _DuolarManosiState extends State<DuolarManosi> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Color(0XFFF4F7FE),
        title: Text(widget.data["name"].toString(),style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0XFFF4F7FE),
          margin: EdgeInsets.all(getProportionScreenHeight(10)),
          child: Text(widget.data["manosi"].toString(),style: TextStyle(fontSize: getProportionScreenHeight(17)),),
        ),
      ),
    );
  }
}
