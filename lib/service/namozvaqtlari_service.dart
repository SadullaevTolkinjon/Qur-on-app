import 'dart:io';
import 'package:namozvaqtlari/pages/namoz_vaqt.dart';
import 'package:hive/hive.dart';
import 'package:namozvaqtlari/model/namozvaqti_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Serive_NAmozVaqti {
  static List datas = [];
  static int day = DateTime.now().day;
  static int month = DateTime.now().month;
  static Future<List<NamozVaqtiApi>> getDataNamozVaqti() async {
    await openPath();
    Response? response;
    String region = popupMenu_value;
    try {
      response = await Dio().get(
          "https://namozvaqti.herokuapp.com/api/monthly?region=$region&month=$month");

      await putdata(response.data);
      await putdata2(response.data);
      List myData = box!.values.toList();
      if (myData.isEmpty) {
        datas.add('nodata');
      } else {
        datas = myData;
      }
    } catch (e) {}

    return (response!.data as List)
        .map((e) => NamozVaqtiApi.fromJson(e))
        .toList();
  }

  static Box? box;
  static Box? box2;
  static Future openPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = Hive.box("namozvaqti");
    box2 = Hive.box("oyliktaqvim");
    return;
  }

  static putdata(var data) async {
    await box!.clear();
    for (var malumot in data) {
      if (malumot["day"] == day) {
        await box!.add(malumot);
      }
    }
  }

  static putdata2(var data) async {
    await box2!.clear();
    for (var malumot in data) {
      await box2!.add(malumot);
    }
  }
}
