import 'package:flutter/material.dart';
import 'package:namozvaqtlari/pages/asosiy_page.dart';
import 'package:namozvaqtlari/pages/calendar.dart';
import 'package:namozvaqtlari/pages/duolar.dart';
import 'package:namozvaqtlari/pages/duolar_manosi.dart';
import 'package:namozvaqtlari/pages/farz.dart';
import 'package:namozvaqtlari/pages/firstpage.dart';
import 'package:namozvaqtlari/pages/hadis.dart';
import 'package:namozvaqtlari/pages/kompaass.dart';
import 'package:namozvaqtlari/pages/namoz_vaqt.dart';
import 'package:namozvaqtlari/pages/olloh_ismi_manosi.dart';
import 'package:namozvaqtlari/pages/ollohning_ismlari.dart';
import 'package:namozvaqtlari/pages/oyat.dart';
import 'package:namozvaqtlari/pages/oylik_taqvim.dart';
import 'package:namozvaqtlari/pages/quron_suralari.dart';
import 'package:namozvaqtlari/pages/tasbeh.dart';

class GenerateRoute {
  static routerGenerator(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const ShowPage());
      case "/namozvaqt":
        return MaterialPageRoute(builder: (context) => const NamozVaqt());
      case "/tasbeh":
        return MaterialPageRoute(builder: (context) => const TasbehPage());
      case "/ism":
        return MaterialPageRoute(
            builder: (context) => const OllohningIsmlari());
      case "/ismmanosi":
        return MaterialPageRoute(
            builder: (context) => IsmlarManosi(
                  malumot: args,
                ));
      case "/duo":
        return MaterialPageRoute(builder: (context) => const Duolar());
      case "/duolarmanosi":
        return MaterialPageRoute(
            builder: (context) => DuolarManosi(
                  data: args,
                ));
      case "/hadis":
        return MaterialPageRoute(builder: (context) => const HadisPage());
      case "/farz":
        return MaterialPageRoute(builder: (context) => const FarzAmallar());
      case "/calendar":
        return MaterialPageRoute(builder: (context) => const CalendarPage());
      case "/compass":
        return MaterialPageRoute(builder: (context) => const CompassPage());
      case "/quronsuralar":
        return MaterialPageRoute(builder: (context) => const QuronSuralari());
      case "/oyat":
        return MaterialPageRoute(
            builder: (context) => Oyatlar(
                  data: args,
                ));
      case "/taqvim":
        return MaterialPageRoute(builder: (context) => const OylikTaqvim());
    }
  }
}
