import 'package:flutter/material.dart';
import 'burc_detay.dart';
import 'burc_liste.dart';
import 'models/burc.dart';
import 'utils/strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Burc> tumBurclar = veriKaynaginiHazirla();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",
      routes: {
        "/": (context) => BurcListesi(tumBurclar),
        "/burcListesi": (context) => BurcListesi(tumBurclar),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> path = settings.name.split("/");
        if (path[1] == 'burcDetay') {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(tumBurclar[int.parse(path[2])]));
        }
        return null;
      },
      title: "Burç Rehberi",
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> liste = [];

    for (int i = 0; i < Strings.BURC_ADLARI.length; i++) {
      Burc yeniBurc = new Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png",
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png");
      liste.add(yeniBurc);
    }
    return liste;
  }
}
