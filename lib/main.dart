import 'package:flutter/material.dart';
import 'package:fmarket/sepetim.dart';
import 'package:fmarket/urunler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  //Kesin kullanmamiz gerektigini _ ile belirtiyoruz. Aksi halde hata dondurur.
  List<Widget> _icerikler = [];
  int _aktifIcerikNo = 0;

  @override
  void initState() {
    super.initState();
    _icerikler = [
      Urunler(),
      Sepetim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Uçarak Gelsin',
          style: TextStyle(
            fontSize: 25.5,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifIcerikNo, //gecerli olan buton durumu
        selectedItemColor: Colors.red.shade400,
        unselectedItemColor: Colors.grey.shade600,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Ürünler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Sepetim",
          ),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          setState(() {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          });
        },
      ),
      body: _icerikler[_aktifIcerikNo],
    );
  }
}
