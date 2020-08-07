import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
              child: Column(
            children: <Widget>[
              _titulos(),
              _botonesRedondeados(),
            ],
          ))
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              // se define el begin y end(en que punto termina) para que el gradient sea vertical
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
            //Colors.red,
            //Colors.blueAccent
          ])),
    );

    // para rotar la caja hay un widget que se llama Transform.rotate
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 270.0,
        height: 270.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.0),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ])),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(top: -100, child: cajaRosa),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            title: Container()),
        BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30.0), title: Container()),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container())
      ]),
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      border: TableBorder.symmetric(
        inside : BorderSide.none, outside : BorderSide.none
        ),
      children: [
        TableRow(children: [
          _crearBotonRedondeado( Colors.blueAccent, Icons.border_all, 'General'),
          _crearBotonRedondeado( Colors.purpleAccent, Icons.directions_bus, 'Bus'),
        ]),
        TableRow(children: [
          _crearBotonRedondeado( Colors.pinkAccent, Icons.shop, 'Buy'),
          _crearBotonRedondeado( Colors.orange, Icons.insert_drive_file, 'File'),
        ]),
        TableRow(children: [
          _crearBotonRedondeado( Colors.lightBlue, Icons.movie_filter, 'Entertainer'),
          _crearBotonRedondeado( Colors.green, Icons.cloud, 'General'),
        ]),
        TableRow(children: [
          _crearBotonRedondeado( Colors.purpleAccent, Icons.border_all, 'General'),
          _crearBotonRedondeado( Colors.purpleAccent, Icons.border_all, 'General'),
        ]),
      ],
    );
  }

  Widget _crearBotonRedondeado( Color color, IconData icon, String texto) {
    // aplicarle blur al fondo //backdroupfilter

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 5),
        child: Container(
          height: 137.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:5.0),
                CircleAvatar(
                backgroundColor: color,
                radius: 25.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(texto, style: TextStyle(color: color))
            ],
          ),
        ),
      ),
    );
  }
}
