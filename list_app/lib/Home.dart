import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';


class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icone + Nome do jogador"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Container(
                  color: Colors.black12,
                  width: 250,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          height: 80,
                          child: ElevatedButton(
                            child: Text("Procurar/Criar sala"),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "/Roda_da_pergunta",
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          height: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: Text("Jogo rápido"),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "/Roda_da_pergunta",
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ), Text("Desempenho"),
            Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                          //childLeft: Text("$percent%",
                          childLeft: Text("30%",
                              style: TextStyle(color: Colors.white)),
                            percent: 37,
                          theme: RoundedProgressBarTheme.green),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                          //childLeft: Text("$percent%",
                            childLeft: Text("30%",
                                style: TextStyle(color: Colors.white)),
                            percent: 58,
                            theme: RoundedProgressBarTheme.blue),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                          //childLeft: Text("$percent%",
                            childLeft: Text("30%",
                                style: TextStyle(color: Colors.white)),
                            percent: 15,
                            theme: RoundedProgressBarTheme.purple),
                      ),
                      Text("Matemática"),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                          //childLeft: Text("$percent%",
                            childCenter: Text("Matemática",
                                 style: TextStyle(color: Colors.white),),
                            childLeft: Text("30%",
                                style: TextStyle(color: Colors.white)),
                            percent: 87,
                            theme: RoundedProgressBarTheme.yellow),
                      ),
                    ],
                  ),
                  color: Colors.black12,
                 /* width: 250,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          height: 80,
                          child: ElevatedButton(
                            child: Text("Desempenho"),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "/Roda_da_pergunta",
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          height: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            child: Text("Sair"),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "/Roda_da_pergunta",
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                */

                )
            )
          ],
        )
      ),
    );
  }
}


 // List _itens = [];

  /*void _carregarItens(){
    _itens = [];
    for(int i=0; i<=10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} da lista";
      item["icone"]= Image.asset("icone.png");
      _itens.add(item);
    }
  }*/
  /*final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  //final icons = [Icons.airplanemode_off, Icons.access_alarm, Icons.access_time];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
              child: Center(
                child: ListTile(
                    title: Center(child: Text(titles[index])),
                    subtitle: Center(child: Text(subtitles[index])),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                    //trailing: Icon(icons[index])),
              )));
        });
  }
    //_carregarItens();
  /*  return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              //print("item ${indice}");
              //Map<String, dynamic> item =_itens[indice];
              //print("item ${_itens[indice]["titulo"]}");
              return ListTile(
                onTap: (){
                  //print("Clique com onTap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(_itens[indice]["titulo"]),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            backgroundColor: Colors.yellow,
                          ),
                          content: Text(_itens[indice]["descricao"]),
                          actions: <Widget>[ //definir widgets
                            TextButton(
                                onPressed: (){
                                  print("Selecionado sim");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")
                            ),
                            TextButton(
                                onPressed: (){
                                  print("Selecionado não");
                                  Navigator.pop(context);
                                },
                                child: Text("Não")
                            ),
                          ],
                        );
                      }
                  );
                },
                onLongPress: (){
                  //print("Clique com onLongPress ${indice}");
                },
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            }
        ),
      ),
    );
  }*/
*/


