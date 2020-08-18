import 'package:burc_rehberi_new/models/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  Burc index;
  
  BurcDetay(this.index);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color baskinRenk;
  @override
  Widget build(BuildContext context) {
    PaletteGenerator palette;

    Future<PaletteGenerator> fpalette = PaletteGenerator.fromImageProvider(
            AssetImage("images/" + widget.index.burcBuyukResim))
        .then((value) {
      palette = value;
      setState(() {
        baskinRenk = palette.dominantColor.color;
      });
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              expandedHeight: 250,
              backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
              pinned: true,
              //backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    widget.index.burcAdi + " Burcu ve Özellikleri",
                  ),
                  centerTitle: true,
                  background: Image.asset(
                    "images/" + widget.index.burcBuyukResim,
                    fit: BoxFit.cover,
                  ))),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SingleChildScrollView(
                  child: Text(
                    widget.index.burcDetay,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                )),
          ),
        ],
        primary: false,
      ),
    );
  }
}
