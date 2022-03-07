import 'package:hive/hive.dart';
part 'quron_model_suralar_api.g.dart';
@HiveType(typeId: 3)
class Quron_model_api {
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? englishName;
  @HiveField(3)
  String? englishNameTranslation;
  @HiveField(4)
  String? revelationType;
  @HiveField(5)
  List<Ayahs>? ayahs;

  Quron_model_api(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.ayahs});

  Quron_model_api.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(new Ayahs.fromJson(v));
      });
    }
  }
}

@HiveType(typeId: 4)
class Ayahs {
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? text;
  @HiveField(2)
  int? numberInSurah;
  @HiveField(3)
  int? juz;
  @HiveField(4)
  int? manzil;
  @HiveField(5)
  int? page;
  @HiveField(6)
  int? ruku;
  @HiveField(7)
  int? hizbQuarter;
  @HiveField(8)
  bool? sajda;

  Ayahs(
      {this.number,
      this.text,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }
}
