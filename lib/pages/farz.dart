import 'package:flutter/material.dart';
import 'package:namozvaqtlari/data/database.dart';
import 'package:namozvaqtlari/size_config/size_config.dart';

class FarzAmallar extends StatefulWidget {
  const FarzAmallar({Key? key}) : super(key: key);

  @override
  _FarzAmallarState createState() => _FarzAmallarState();
}

class _FarzAmallarState extends State<FarzAmallar>
    with TickerProviderStateMixin {
  TabController? _tabController;
  int tabvalue = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.black),
        title: Text("5 Farz",style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Color(0XFFF4F7FE),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                unselectedLabelColor: Colors.teal.shade100,
                controller: _tabController,
                labelColor: Colors.teal.shade800,
                indicatorColor: Colors.teal,
                onTap: (val) {
                  setState(() {
                    tabvalue = val;
                  });
                },
                tabs: const [
                  Tab(
                    text: "Iymon",
                  ),
                  Tab(
                    text: "Namoz",
                  ),
                  Tab(
                    text: "Zakot",
                  ),
                  Tab(
                    text: "Ro'za",
                  ),
                  Tab(
                    text: "Haj",
                  )
                ],
              ),
              Container(
                color:Color(0XFFF4F7FE),
                child: Text(
                  farz[tabvalue]["sharhi"].toString(),
                  style: TextStyle(
                    fontSize: getProportionScreenHeight(16),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
