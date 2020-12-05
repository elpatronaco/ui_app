import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.imageLocation);

  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'imageHero',
            child: Image(
                image: AssetImage("assets/$imageLocation"),
                fit: BoxFit.contain),
          ),
        ),
        onLongPress: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
