import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namozvaqtlari/pages/namoz_vaqt.dart';
import 'package:namozvaqtlari/service/namozvaqtlari_service.dart';
import 'package:namozvaqtlari/service/quron_service.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePageState1 createState() => _HomePageState1();
}

class _HomePageState1 extends State<HomePage1> {
  @override
  void initState() {
    super.initState();
    Serive_NAmozVaqti.getDataNamozVaqti();
    QuronService.getQuron_Api();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF4F7FE),
        elevation: 0,
        title: const Text(
          "Namoz vaqtlari",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Serive_NAmozVaqti.getDataNamozVaqti();
          QuronService.getQuron_Api();
        },
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(color: Color(0XFFF4F7FE)),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  carusel(),
                  Padding(
                    padding: EdgeInsets.all(getProportionScreenHeight(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: namozvaqt(),
                          onTap: () {
                            Navigator.pushNamed(context, "/namozvaqt");
                          },
                        ),
                        InkWell(
                          child: qiblaCompass(),
                          onTap: () {
                            Navigator.pushNamed(context, "/compass");
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionScreenHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: quron(),
                          onTap: () {
                            Navigator.pushNamed(context, "/quronsuralar");
                          },
                        ),
                        InkWell(
                          child: masjidlar(),
                          onTap: () {
                            Navigator.pushNamed(context, "/taqvim");
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionScreenHeight(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: tasbeh(),
                          onTap: () {
                            Navigator.pushNamed(context, "/tasbeh");
                          },
                        ),
                        InkWell(
                          child: duolar(),
                          onTap: () {
                            Navigator.pushNamed(context, "/duo");
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionScreenHeight(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: calendar(),
                          onTap: () {
                            Navigator.pushNamed(context, "/calendar");
                          },
                        ),
                        InkWell(
                          child: hadis(),
                          onTap: () {
                            Navigator.pushNamed(context, "/hadis");
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionScreenHeight(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: nameofAllah(),
                          onTap: () {
                            Navigator.pushNamed(context, "/ism");
                          },
                        ),
                        InkWell(
                          child: farzamallar(),
                          onTap: () {
                            Navigator.pushNamed(context, "/farz");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CarouselSlider carusel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: getProportionScreenHeight(200),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlay: true,
      ),
      itemCount: name.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ValueListenableBuilder<Box>(
        valueListenable: Hive.box("namozvaqti").listenable(),
        builder: (context, box, index) {
          final datalar = box.values.toList();
          List vaqt = [
            datalar[0]["times"]["tong_saharlik"],
            datalar[0]["times"]["quyosh"],
            datalar[0]["times"]["peshin"],
            datalar[0]["times"]["asr"],
            datalar[0]["times"]["shom_iftor"],
            datalar[0]["times"]["hufton"],
          ];
          return Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/namozvaqt.jpg"),
                  fit: BoxFit.cover),
              color: const Color(0XFFF4F7FE),
              boxShadow: [
                shadow(),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(
                  getProportionScreenHeight(10.0),
                ),
              ),
            ),
            height: getProportionScreenHeight(200),
            width: double.infinity,
            margin: EdgeInsets.all(getProportionScreenHeight(8.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: getProportionScreenHeight(8),
                      left: getProportionScreenWidth(10)),
                  child: Text(
                    name[itemIndex].toString(),
                    style: texstyle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getProportionScreenHeight(5),
                      left: getProportionScreenWidth(10.0)),
                  child: Text(
                    "${vaqt[itemIndex]}",
                    style: texstyle(),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: getProportionScreenHeight(80),
                        left: getProportionScreenWidth(170)),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Text(
                          datalar[0]["region"].toString(),
                          style: texstyle(),
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  TextStyle texstyle() {
    return TextStyle(
        fontSize: getProportionScreenHeight(20),
        fontWeight: FontWeight.bold,
        color: Colors.grey);
  }

  BoxShadow shadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(0, 5),
    );
  }

  Container farzamallar() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage("assets/images/farz.jpg")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: bottomradius(), color: Colors.white),
              child: const Center(
                child: Text(
                  "5 Farz",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container nameofAllah() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage("assets/images/ollohismlari.jpg")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: bottomradius(), color: Colors.white),
              child: const Text(
                "  Ollohning  99  ismi ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container hadis() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage("assets/images/hadis.png")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: bottomradius(),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  "Hadis",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container calendar() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage("assets/images/calendar.png")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: bottomradius(), color: Colors.white),
              child: const Center(
                child: Text(
                  "Calendar",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container duolar() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: topradius(),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/duo.webp"))),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: bottomradius(), color: Colors.white),
              child: const Center(
                child: Text(
                  "Duolar",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container tasbeh() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                image: const DecorationImage(
                    image: AssetImage("assets/images/tasbeh.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: bottomradius(), color: Colors.white),
              child: const Center(
                child: Text(
                  "Tasbeh",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container masjidlar() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage("assets/images/masjidlar.jpg")),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: bottomradius(), color: Colors.white),
                child: const Center(
                  child: Text(
                    "Oylik taqvim",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Container quron() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage("assets/images/kitob.png")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: bottomradius(), color: Colors.white),
              child: const Center(
                child: Text(
                  "Qur'on",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container qiblaCompass() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: topradius(),
                image: const DecorationImage(
                    image: AssetImage("assets/images/compas.jpg")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: bottomradius()),
              child: const Center(
                child: Text(
                  "Qibla Compass",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container namozvaqt() {
    return Container(
      height: getProportionScreenHeight(145),
      width: getProportionScreenWidth(165),
      decoration: BoxDecoration(
        boxShadow: [shadow()],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: topradius(),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage("assets/images/namozvaqt.png"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: bottomradius(),
              ),
              child: const Center(
                child: Text(
                  "Namoz Vaqtlari",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius topradius() {
    return const BorderRadius.only(
        topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0));
  }

  BorderRadius bottomradius() {
    return const BorderRadius.only(
      bottomLeft: Radius.circular(15.0),
      bottomRight: Radius.circular(15.0),
    );
  }
}
