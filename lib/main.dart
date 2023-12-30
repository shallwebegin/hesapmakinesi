import 'package:flutter/material.dart';

void main() {
  runApp(HesapMakinesiUygulamasi());
}

class HesapMakinesiUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HesapMakinesiEkrani(),
    );
  }
}

class HesapMakinesiEkrani extends StatefulWidget {
  @override
  _HesapMakinesiEkraniState createState() => _HesapMakinesiEkraniState();
}

class _HesapMakinesiEkraniState extends State<HesapMakinesiEkrani> {
  String _sonuc = "";
  String _guncelGirdi = "";
  late double? _sayi1;
  late double? _sayi2;
  late String? _operator;

  void _rakamTiklandi(String rakam) {
    setState(() {
      _guncelGirdi += rakam;
    });
  }

  void _operatorTiklandi(String operator) {
    setState(() {
      _sayi1 = double.parse(_guncelGirdi);
      _operator = operator;
      _guncelGirdi = "";
    });
  }

  void _esittirTiklandi() {
    setState(() {
      _sayi2 = double.parse(_guncelGirdi);

      switch (_operator) {
        case "+":
          _sonuc = (_sayi1! + _sayi2!).toString();
          break;
        case "-":
          _sonuc = (_sayi1! - _sayi2!).toString();
          break;
        case "*":
          _sonuc = (_sayi1! * _sayi2!).toString();
          break;
        case "/":
          _sonuc = (_sayi1! / _sayi2!).toString();
          break;
        default:
          _sonuc = "Hata";
      }

      _guncelGirdi = "";
      _sayi1 = null;
      _sayi2 = null;
      _operator = null;
    });
  }

  void _temizleTiklandi() {
    setState(() {
      _guncelGirdi = "";
      _sayi1 = null;
      _sayi2 = null;
      _operator = null;
      _sonuc = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _sonuc,
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _rakamButonu("7"),
              _rakamButonu("8"),
              _rakamButonu("9"),
              _operatorButonu("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _rakamButonu("4"),
              _rakamButonu("5"),
              _rakamButonu("6"),
              _operatorButonu("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _rakamButonu("1"),
              _rakamButonu("2"),
              _rakamButonu("3"),
              _operatorButonu("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _rakamButonu("0"),
              _rakamButonu("."),
              _esittirButonu(),
              _operatorButonu("+"),
            ],
          ),
          SizedBox(height: 16.0),
          _temizleButonu(),
        ],
      ),
    );
  }

  Widget _rakamButonu(String rakam) {
    return ElevatedButton(
      onPressed: () => _rakamTiklandi(rakam),
      child: Text(rakam),
    );
  }

  Widget _operatorButonu(String operator) {
    return ElevatedButton(
      onPressed: () => _operatorTiklandi(operator),
      child: Text(operator),
    );
  }

  Widget _esittirButonu() {
    return ElevatedButton(
      onPressed: _esittirTiklandi,
      child: Text("="),
    );
  }

  Widget _temizleButonu() {
    return ElevatedButton(
      onPressed: _temizleTiklandi,
      child: Text("C"),
    );
  }
}
