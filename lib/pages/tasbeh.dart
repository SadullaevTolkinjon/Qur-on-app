import 'package:flutter/material.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';

class TasbehPage extends StatefulWidget {
  const TasbehPage({Key? key}) : super(key: key);

  @override
  _TasbehPageState createState() => _TasbehPageState();
}

class _TasbehPageState extends State<TasbehPage> {
  String subhanAllah = "SubhanAllah";
  String alhamdulillah = "Alhamdulillah";
  String ollohu_Akbar = "Ollohu Akbar";
  String none = "";
  int counter = 0;
  int zikr = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0XFFF4F7FE),
        title: const Text(
          "Tasbeh",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/masjid1.jpg"),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: getProportionScreenHeight(125),
                child: Center(
                  child: Text(
                    none,
                    style: TextStyle(
                      fontSize: getProportionScreenHeight(25),
                      fontWeight: FontWeight.w900,
                      color: const Color(0XFFF4F7FE),
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: getProportionScreenHeight(30),
                backgroundColor: Colors.white38,
                child: Text(
                  counter.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionScreenHeight(20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getProportionScreenHeight(300)),
                child: InkWell(
                  child: CircleAvatar(
                    radius: getProportionScreenHeight(50),
                    backgroundColor: Colors.white38,
                    backgroundImage:
                        const AssetImage("assets/images/finger.png"),
                  ),
                  onTap: () {
                    setState(() {
                      counter += 1;
                      hisolagich();
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  hisolagich() {
    if (counter >= 0 && counter <= 33) {
      none = subhanAllah;
    } else if (counter > 33 && counter <= 66) {
      none = alhamdulillah;
    } else if (counter > 66 && counter <= 99) {
      none = ollohu_Akbar;
    } else if (counter >= 99) {
      ollohu_Akbar = none;
      zikr += 1;
      counter = 0;

      setState(() {});
    }
  }
}
