import 'package:flutter/material.dart';

class Oyatlar extends StatefulWidget {
  var data;
  Oyatlar({Key? key, this.data}) : super(key: key);

  @override
  _OyatlarState createState() => _OyatlarState();
}

class _OyatlarState extends State<Oyatlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4F7FE),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0XFFF4F7FE),
        elevation: 0,
        title: Text(
          widget.data["englishName"].toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Sura: ${widget.data["ayahs"][index]["numberInSurah"].toString()}",
                            style: const TextStyle(fontSize: 18)),
                        Container(
                          child: Text(
                            widget.data["ayahs"][index]["text"].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: widget.data["ayahs"].length,
            )),
      ),
    );
  }
}
