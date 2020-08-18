
import 'package:flutter/material.dart';
import 'models/burc.dart';
import 'utils/strings.dart';

class BurcListesi extends StatelessWidget {

  List<Burc> tumBurclar;

  BurcListesi(this.tumBurclar);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  Widget listeyiHazirla() => ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return eachBurc(context, index);
        },
        itemCount: Strings.BURC_ADLARI.length,
      );

  Widget eachBurc(BuildContext context, int index) => Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
          //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BurcDetay(index)))
          leading: Image.asset(
            "images/" + tumBurclar[index].burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            tumBurclar[index].burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade400),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              tumBurclar[index].burcTarihi,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black38),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ));
}
