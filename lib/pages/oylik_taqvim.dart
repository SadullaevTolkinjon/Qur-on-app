import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OylikTaqvim extends StatefulWidget {
  const OylikTaqvim({Key? key}) : super(key: key);

  @override
  _OylikTaqvimState createState() => _OylikTaqvimState();
}

class _OylikTaqvimState extends State<OylikTaqvim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder<Box>(
        valueListenable: Hive.box("oyliktaqvim").listenable(),
        builder: (context, box, index) {
          final data = box.values.toList();
          List bomdod = List.generate(
              data.length, (index) => data[index]["times"]["tong_saharlik"]);
          List quyosh = List.generate(
              data.length, (index) => data[index]["times"]["quyosh"]);
          List peshin = List.generate(
              data.length, (index) => data[index]["times"]["peshin"]);
          List asr = List.generate(
              data.length, (index) => data[index]["times"]["asr"]);
          List shom = List.generate(
              data.length, (index) => data[index]["times"]["shom_iftor"]);
          List hufton = List.generate(
              data.length, (index) => data[index]["times"]["hufton"]);
          List day = List.generate(data.length, (index) => data[index]["day"]);

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Table(
                // textDirection: TextDirection.rtl,
                // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                border: TableBorder.all(
                    width: 2.0,
                    color: data[0]["day"] == DateTime.now().day
                        ? Colors.amber
                        : Colors.black),
                children: List.generate(
                  data.length,
                  (index) => TableRow(
                    children: [
                      Text(
                        "Bomdod: ${bomdod[index]}",
                        style: rang(data, index),
                      ),
                      Text("Quyosh: ${quyosh[index]}",
                          style: rang(data, index)),
                      Text("Peshin: ${peshin[index]}",
                          style: rang(data, index)),
                      Text("Asr: ${asr[index]}", style: rang(data, index)),
                      Text("Shom: ${shom[index]}", style: rang(data, index)),
                      Text("Hufton: ${hufton[index]}",
                          style: rang(data, index)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }

  TextStyle rang(List<dynamic> data, int index) => TextStyle(
      color: data[index]["day"] == DateTime.now().day
          ? Colors.amber
          : Colors.black);
}
