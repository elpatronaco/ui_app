import 'package:ui_app/src/pages/basico_page.dart';
import 'package:ui_app/src/pages/botones_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_app/src/pages/hero_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'basico',
      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'botones': (BuildContext context) => BotonesPage(),
        'hero': (BuildContext context) => DetailScreen("empirestate1.jpg")
      },
    );
  }
}
