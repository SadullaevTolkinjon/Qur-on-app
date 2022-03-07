import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:namozvaqtlari/data/database.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';

class HadisPage extends StatefulWidget {
  const HadisPage({Key? key}) : super(key: key);

  @override
  _HadisPageState createState() => _HadisPageState();
}

class _HadisPageState extends State<HadisPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Hadis",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0XFFF4F7FE),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return AnimatedCard(
                duration: const Duration(milliseconds: 600),
                child: ExpansionTile(
                  title: Text(hadis[index]["nomeri"].toString()),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(getProportionScreenHeight(12.0)),
                      child: Container(
                          color: const Color(0XFFF4F7FE),
                          child: Center(
                            child: Text(
                              hadis[index]["matni"].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionScreenHeight(18)),
                              textAlign: TextAlign.start,
                            ),
                          )),
                    ),
                  ],
                ));
          },
          itemCount: hadis.length,
        ),
      ),
    );
  }
}
