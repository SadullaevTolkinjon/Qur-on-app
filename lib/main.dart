import 'package:flutter/material.dart';
import 'package:namozvaqtlari/rootes/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/namozvaqti_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NamozVaqtiApiAdapter());
  Hive.registerAdapter(TimesAdapter());
  await Hive.openBox("namozvaqti");
  await Hive.openBox("oyliktaqvim");
  // Hive.registerAdapter(QuronmodelapiAdapter());
  // Hive.registerAdapter(AyahsAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => GenerateRoute.routerGenerator(settings),
    );
  }
}
