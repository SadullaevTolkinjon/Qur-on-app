import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:namozvaqtlari/model/compass.dart';

class CompassPage extends StatefulWidget {
  const CompassPage({Key? key}) : super(key: key);

  @override
  _CompassPageState createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return  Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );

          if (snapshot.hasError)
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          if (snapshot.hasData)
            return QiblaCompass();
          else
            return Container(
              child: Text('Error'),
            );
        },
      ),
    );
  }
}
