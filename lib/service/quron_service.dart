import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namozvaqtlari/pages/quron_suralari.dart';

class QuronService {
  static List? datas = [];
  static Future getQuron_Api() async {
    Response? response;
    String tarjima = popupVal;
    await openPath();
    response = await Dio().get("http://api.alquran.cloud/v1/quran/$tarjima");

    await putdata(response.data["data"]["surahs"]);
    List myData = quron!.values.toList();
    if (myData.isEmpty) {
      datas!.add('nodata');
    } else {
      datas = myData;
    }

    return true;
  }

  static Box? quron;
  static Future openPath() async {
    quron = await Hive.openBox("quron");
    return;
  }

  static putdata(var data) async {
    await quron!.clear();
    for (var malumot in data) {
      await quron!.add(malumot);
    }
  }
}
