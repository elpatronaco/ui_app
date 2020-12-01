import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:ui_app/src/components/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  final _imagesAssets = [
    "empirestate1.jpg",
    "empirestate2.jpg",
    "empirestate3.jpeg",
    "empirestate4.jpg"
  ];
  final double _maxHeightHeader = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: _maxHeightHeader,
                floating: false,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Empire State Building",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: CarouselSlider(
                    options: CarouselOptions(height: 400.0),
                    items: _imagesAssets.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.deepOrange),
                            child: Image(
                              image: AssetImage("assets/$i"),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              )
            ];
          },
          body: Center(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  _crearAcciones(),
                  Divider(
                    color: Colors.grey,
                    height: 40,
                    thickness: 1,
                    indent: 60,
                    endIndent: 60,
                  ),
                  _createInfoRow(Icons.location_on,
                      '20 W 34th St, New York, NY 10001, Estados Unidos'),
                  _createInfoRow(Icons.phone_rounded, '+1 (809) 555-1234'),
                  _createInfoRow(Icons.timer_rounded, 'Abierto de 9h a 15h'),
                  Divider(
                    color: Colors.grey,
                    height: 40,
                    thickness: 1,
                    indent: 60,
                    endIndent: 60,
                  ),
                  _crearTexto(),
                  _crearTexto(),
                  _crearTexto(),
                  _crearTexto(),
                  _crearTexto(),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createInfoRow(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.blue),
          SizedBox(width: 20.0),
          Expanded(child: Text(text))
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(children: [
          IconButton(
              icon: Icon(Icons.call),
              iconSize: 30,
              onPressed: () => launch("tel://+1 (809) 555-1234")),
          Text('LLAMAR')
        ]),
        Column(children: [
          IconButton(
              icon: Icon(Icons.navigation),
              iconSize: 30,
              onPressed: () =>
                  launchNavigation("https://goo.gl/maps/sPjmwkVsP9fZhPaC7")),
          Text('NAVEGAR')
        ]),
        Column(children: [
          IconButton(
              icon: Icon(Icons.share),
              iconSize: 30,
              onPressed: () => Share.share(
                  "Empire State Building, 20 W 34th St, New York, NY 10001, Estados Unidos")),
          Text('COMPARTIR')
        ])
      ],
    );
  }

  launchNavigation(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          'Sit minim aliqua minim laborum duis occaecat consectetur aliquip id ad deserunt. Adipisicing qui reprehenderit eu eu qui occaecat exercitation et aliqua laboris dolor. Nisi duis consectetur veniam id nulla deserunt aliqua velit ullamco. Deserunt exercitation adipisicing nostrud amet eu.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

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
                image: AssetImage("assets/$imageLocation"), fit: BoxFit.cover),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
