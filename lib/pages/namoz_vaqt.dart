import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namozvaqtlari/service/namozvaqtlari_service.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

late String popupMenu_value = "toshkent";
late List name = ["Bomdod", "Quyosh", "Peshin", "Asr", "Shom", "Hufton"];

class NamozVaqt extends StatefulWidget {
  const NamozVaqt({Key? key}) : super(key: key);

  @override
  _NamozVaqtState createState() => _NamozVaqtState();
}

class _NamozVaqtState extends State<NamozVaqt> {
  var region;

  @override
  void initState() {
    super.initState();
    Serive_NAmozVaqti.box;
    region = Serive_NAmozVaqti.box!.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: const Color(0XFFF4F7FE),
        title: const Text(
          "Namoz Vaqtlari",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          popupMenu(),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box("namozvaqti").listenable(),
          builder: (context, box, __) {
            final datas = box.values.toList();
            region = Serive_NAmozVaqti.box!.values.toList();
            List vaqt = [
              datas[0]["times"]["tong_saharlik"],
              datas[0]["times"]["quyosh"],
              datas[0]["times"]["peshin"],
              datas[0]["times"]["asr"],
              datas[0]["times"]["shom_iftor"],
              datas[0]["times"]["hufton"],
            ];

            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0XFFF4F7FE),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: getProportionScreenHeight(20)),
                    child: Container(
                      height: getProportionScreenHeight(200),
                      width: getProportionScreenWidth(350),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage("assets/images/namoz.png"),
                        ),
                        color: const Color(0XFFF4F7FE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            getProportionScreenHeight(12.0),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: getProportionScreenHeight(150),
                                left: getProportionScreenWidth(220)),
                            child: Container(
                              child: Text(region[0]["region"].toString()),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionScreenWidth(200)),
                            child: Container(
                              child: Text(region[0]["date"]
                                  .toString()
                                  .substring(0, 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionScreenHeight(500),
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.all(getProportionScreenHeight(10.0)),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                                color: const Color(0XFFF4F7FE),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      getProportionScreenHeight(11.0)),
                                ),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.notifications,
                                  size: getProportionScreenHeight(26),
                                ),
                                title: Text(
                                  name[index].toString(),
                                  style: TextStyle(
                                      fontSize: getProportionScreenHeight(20),
                                      fontWeight: FontWeight.w800),
                                ),
                                trailing: Text(
                                  vaqt[index].toString(),
                                  style: TextStyle(
                                      fontSize: getProportionScreenHeight(20),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: vaqt.length),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  PopupMenuButton<String> popupMenu() {
    return PopupMenuButton(
      onSelected: (val) async {
        setState(() {
          popupMenu_value = val.toString();

          Serive_NAmozVaqti.getDataNamozVaqti();
        });
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: Text("Toshkent"),
          value: "toshkent",
        ),
        const PopupMenuItem(
          child: Text("Andijon"),
          value: "andijon",
        ),
        const PopupMenuItem(
          child: Text("Qarshi"),
          value: "qarshi",
        ),
        const PopupMenuItem(
          child: Text("Namangan"),
          value: "namangan",
        ),
        const PopupMenuItem(
          child: Text("Farg'ona"),
          value: "quva",
        ),
        const PopupMenuItem(
          child: Text("Qo'qon"),
          value: "qo'qon",
        ),
        const PopupMenuItem(
          child: Text("Guliston"),
          value: "guliston",
        ),
        const PopupMenuItem(
          child: Text("Jizzax"),
          value: "jizzax",
        ),
        const PopupMenuItem(
          child: Text("Samarqand"),
          value: "samarqand",
        ),
        const PopupMenuItem(
          child: Text("Navoiy"),
          value: "navoiy",
        ),
        const PopupMenuItem(
          child: Text("Buxoro"),
          value: "buxoro",
        ),
        const PopupMenuItem(
          child: Text("Termiz"),
          value: "termiz",
        ),
        const PopupMenuItem(
          child: Text("Urganch"),
          value: "urganch",
        ),
        const PopupMenuItem(
          child: Text("Nukus"),
          value: "nukus",
        ),
      ],
    );
  }
}

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("ic_launcher");
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
      {int? id, String? title, String? body, int? soat, int? minut}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id!,
        title,
        body,
        tz.TZDateTime.from(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, soat!, minut!),
            tz.getLocation("America/Detroit")),
        const NotificationDetails(
          android: AndroidNotificationDetails('main_channel', "Main_channel",
              importance: Importance.max, priority: Priority.max),
          iOS: IOSNotificationDetails(
            sound: 'default.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
