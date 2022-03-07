import 'package:flutter/material.dart';
import 'package:namozvaqtlari/data/database.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';
import 'package:animated_card/animated_card.dart';

class OllohningIsmlari extends StatefulWidget {
  const OllohningIsmlari({Key? key}) : super(key: key);

  @override
  _OllohningIsmlariState createState() => _OllohningIsmlariState();
}

class _OllohningIsmlariState extends State<OllohningIsmlari> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0XFFF4F7FE),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Asmoul husno",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0XFFF4F7FE),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return AnimatedCard(
                duration: Duration(milliseconds: 600),
                child: Card(
                  child: ListTile(
                    leading: Text("${index + 1}"),
                    title: Text(
                      ismlar[index]["oqilishi"].toString(),
                      style: TextStyle(
                          fontSize: getProportionScreenHeight(20),
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      ismlar[index]["tarjimasi"].toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      ismlar[index]["arabcha"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/ismmanosi",
                          arguments: ismlar[index]);
                    },
                  ),
                ),
              );
            },
            itemCount: ismlar.length,
          ),
        ),
      ),
    );
  }
}
