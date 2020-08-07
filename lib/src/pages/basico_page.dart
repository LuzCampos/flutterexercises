import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  //maneja los estilos de las cajas de texto
  final estiloTitulo = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 16.0, color: Colors.grey[800]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Image.asset('assets/goodtheme.png');
  }

  Widget _crearTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Laguna de Pokemon', style: estiloTitulo),
                  SizedBox(height: 4.0),
                  Text('Charizard en su hábitat', style: estiloSubtitulo)
                ]),
          ),
          Icon(
            Icons.star,
            color: Colors.green[900],
            size: 28.0,
          ),
          Text(
            '41',
            style: TextStyle(),
          ),
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTER'),
        _accion(Icons.share, 'SHARED'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(children: <Widget>[
      Icon(icon, color: Colors.black),
      SizedBox(height: 3.0),
      Text(
        texto,
        style: TextStyle(fontSize: 12.0, color: Colors.black),
      ),
    ]);
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text(
        'Non deserunt sunt dolore enim consequat excepteur nostrud id eu aliquip.Eu duis proident et est excepteur ea.Voluptate quis nostrud anim ipsum incididunt velit tempor est sint veniam in adipisicing est sint veniam in.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
