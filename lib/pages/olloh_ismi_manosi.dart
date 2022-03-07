import 'package:flutter/material.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';

class IsmlarManosi extends StatefulWidget {
  var malumot;
  IsmlarManosi({Key? key, this.malumot}) : super(key: key);

  @override
  _IsmlarManosiState createState() => _IsmlarManosiState();
}

class _IsmlarManosiState extends State<IsmlarManosi> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0XFFF4F7FE),
        title: Text(
          widget.malumot["oqilishi"].toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0XFFF4F7FE),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: getProportionScreenHeight(20.0)),
                    child: Container(
                      height: getProportionScreenHeight(200),
                      decoration: const BoxDecoration(
                          color: Colors.white38,
                          image: DecorationImage(
                              image: AssetImage("assets/images/naqsh.png"),
                              fit: BoxFit.fill)),
                      child: Center(
                        child: Text(
                          widget.malumot["arabcha"].toString(),
                          style: TextStyle(
                          
                              fontSize: getProportionScreenHeight(45),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionScreenHeight(
                          25.0,
                        ),
                        left: getProportionScreenWidth(10),
                        right: getProportionScreenWidth(10.0)),
                    child: Container(
                      child: Center(
                        child: Text(
                          widget.malumot["tarjimasi"].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: getProportionScreenHeight(16),
                              color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
