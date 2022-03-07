import 'package:hive/hive.dart';
part 'namozvaqti_model.g.dart';
@HiveType(typeId: 0)
class NamozVaqtiApi {
  @HiveField(0)
  int? month;
  @HiveField(1)
  int? day;
  @HiveField(2)
  Times? times;
  @HiveField(3)
  String? region;
  @HiveField(4)
  String? date;
  @HiveField(5)
  String? weekday;

  NamozVaqtiApi(
      {this.month, this.day, this.times, this.region, this.date, this.weekday});

  NamozVaqtiApi.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    day = json['day'];
    times = json['times'] != null ? new Times.fromJson(json['times']) : null;
    region = json['region'];
    date = json['date'];
    weekday = json['weekday'];
  }
}
@HiveType(typeId: 1)
class Times {
  @HiveField(0)
  String? tongSaharlik;
  @HiveField(1)
  String? quyosh;
  @HiveField(2)
  String? peshin;
  @HiveField(3)
  String? asr;
  @HiveField(4)
  String? shomIftor;
  @HiveField(5)
  String? hufton;

  Times(
      {this.tongSaharlik,
      this.quyosh,
      this.peshin,
      this.asr,
      this.shomIftor,
      this.hufton});

  Times.fromJson(Map<String, dynamic> json) {
    tongSaharlik = json['tong_saharlik'];
    quyosh = json['quyosh'];
    peshin = json['peshin'];
    asr = json['asr'];
    shomIftor = json['shom_iftor'];
    hufton = json['hufton'];
  }
}
