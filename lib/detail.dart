import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/network/api_service.dart';
import 'package:untitled/network/response/cat_response.dart';

void main(){
  runApp(Detail());
}

class Detail extends StatelessWidget{
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Detail',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cat Detail'),
        ),
        body: Column(children: <Widget>[
        Row(
        //ROW 1
        children: const [
          Flexible(
          child: Text(
            "Nama Kucing : Arabian Mau"
          ),
        ),
        ],
      ),
      Row(//ROW 2
          children: const [
            Flexible(
              child: Text(
                  "Nama lain kucing : Alley cat\n"
              ),
            ),
          ]),
      Row(// ROW 3
          children: const [
            Flexible(
              child: Text(
                  "Asal Kucing : United Arab Emirates\n"
              ),
            ),
          ]),
          Row(// ROW 3
              children: const [
                Flexible(
                  child: Text(
                      "Jangka Hidup : 12 - 14 Tahun\n"
                  ),
                ),
              ]),
          Row(// ROW 3
              children: const [
                Flexible(
                  child: Text(
                      "Temperamen : Affectionate, Agile, Curious, Independent, Playful, Loyal \n",
                    maxLines: 5,
                  ),
                ),
              ]),
          Row(// ROW 3
              children: const [
                Flexible(
                  child: Text(
                      "Deskripsi : Arabian Mau cats are social and energetic. Due to their energy levels, these cats do best in homes where their owners will be able to provide them with plenty of playtime, attention and interaction from their owners. These kitties are friendly, intelligent, and adaptable, and will even get along well with other pets and children.\n",
                    maxLines: 5,
                  ),
                ),
              ]),
          Row(// ROW 3
              children: const [
                Flexible(
                  child: Text(
                      "\nWikipedia URL : https://en.wikipedia.org/wiki/Arabian_Mau"
                  ),
                ),
              ]),
      ]),
    ));
  }
}