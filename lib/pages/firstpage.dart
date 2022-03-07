import 'package:flutter/material.dart';
import 'package:namozvaqtlari/pages/asosiy_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


class ShowPage extends StatefulWidget {
  const ShowPage({Key? key}) : super(key: key);

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomePage1(),
      duration: 5000,
      imageSize: 250,
      imageSrc: "assets/images/first.png",
      text: "Namoz Vaqti",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.black,
        Colors.grey,
        Colors.white,
      ],
      backgroundColor: Colors.white,
    );
  }
}