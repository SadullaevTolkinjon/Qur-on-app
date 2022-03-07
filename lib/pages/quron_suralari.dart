import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namozvaqtlari/service/quron_service.dart';

late String popupVal = "uz.sodik";

class QuronSuralari extends StatefulWidget {
  const QuronSuralari({Key? key}) : super(key: key);

  @override
  _QuronSuralariState createState() => _QuronSuralariState();
}

class _QuronSuralariState extends State<QuronSuralari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: const Color(0XFFF4F7FE),
        title: const Text(
          "Qur'oni Karim",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (val) async {
              setState(() async {
                popupVal = val.toString();
                await QuronService.getQuron_Api();
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Uzbek"),
                value: "uz.sodik",
              ),
              const PopupMenuItem(
                child: Text("Azerbaijan"),
                value: "az.mammadaliyev",
              ),
              const PopupMenuItem(
                child: Text("Czech"),
                value: "cs.hrbek",
              ),
              const PopupMenuItem(
                child: Text("German"),
                value: "de.aburida",
              ),
              const PopupMenuItem(
                child: Text("English"),
                value: "en.ahmedali",
              ),
              const PopupMenuItem(
                child: Text("Korean"),
                value: "ko.korean",
              ),
              const PopupMenuItem(
                child: Text("Japanese"),
                value: "ja.japanese",
              ),
              const PopupMenuItem(
                child: Text("France"),
                value: "fr.hamidullah",
              ),
              const PopupMenuItem(
                child: Text("Russian"),
                value: "ru.osmanov",
              ),
              const PopupMenuItem(
                child: Text("Arabic"),
                value: "ar.minshawi",
              )
            ],
          ),
        ],
      ),
      body: SafeArea(
          child: RefreshIndicator(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ValueListenableBuilder<Box>(
                  valueListenable: Hive.box("quron").listenable(),
                  builder: (context, box, __) {
                    final malumot = box.values.cast().toList();
                    return Container(
                      color: const Color(0XFFF4F7FE),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return AnimatedCard(
                              duration: const Duration(milliseconds: 600),
                              child: Card(
                                child: ListTile(
                                  leading: Text("${index + 1}."),
                                  title: Text(
                                      malumot[index]["englishName"].toString()),
                                  trailing:
                                      Text(malumot[index]["name"].toString()),
                                  onTap: () {
                                    Navigator.pushNamed(context, "/oyat",
                                        arguments: malumot[index]);
                                  },
                                ),
                              ));
                        },
                        itemCount: malumot.length,
                      ),
                    );
                  },
                ),
              ),
              onRefresh: () async {
                await QuronService.getQuron_Api();
              })),
    );
  }
}
