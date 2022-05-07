import 'package:flutter/material.dart';
//import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
//import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}



class _Home extends State<Home> {
  _recuperarBancoDados( ) async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco4.bd");
    var bd = await openDatabase(
        localBancoDados,
        version: 2,
        onCreate: (db, dbVersaoRecente){
          String Usuario = "CREATE TABLE USUARIO("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "nome TEXT NOT NULL,"
              "perguntas_certas TEXT,"
              "perguntas_totais TEXT);";
          String Materia = "CREATE TABLE MATERIA("
              "idmateria INTEGER PRIMARY KEY AUTOINCREMENT,"
              "nome_materia TEXT);";
          String Pergunta = "CREATE TABLE PERGUNTA ("
              "idpergunta INTEGER PRIMARY KEY AUTOINCREMENT,"
              "enunciado TEXT,"
              "fk_idmateria INTEGER NOT NULL,"
              "FOREIGN KEY (fk_idmateria) REFERENCES MATERIA(idmateria),"
              "alterativas_erradas TEXT,"
              "alternativa_correta TEXT);";
      //    db.execute(Usuario);


          db.execute(Materia);
          db.execute(Pergunta);
          db.execute(Usuario);
          Map<String, dynamic> dadosMateria = {
            "nome_materia" : "Literatura",
          };
          db.insert("MATERIA", dadosMateria);
          dadosMateria = {
            "nome_materia" : "Historia",
          };
          db.insert("MATERIA", dadosMateria);
          dadosMateria = {
            "nome_materia" : "Ciencia",
          };
          db.insert("MATERIA", dadosMateria);
          dadosMateria = {
            "nome_materia" : "Geografia",
          };
          db.insert("MATERIA", dadosMateria);
     //     db.execute(Pergunta);
        }
    );
    print("aberto: " + bd.isOpen.toString() );
    return bd;
  }
  _InserirMateria( ) async{
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosMateria = {
      "enunciado" : "Quantas luas tem em jupiter",
      "fk_idmateria" : 3,
      "alternativas_erradas" : "1,2,3",
      "alternativa_correta" : "4"

    };
    bd.insert("PERGUNTA", dadosMateria);
    //teste
    String sql = "SELECT * FROM PERGUNTA";
    List material = await bd.rawQuery(sql);
    for(var usu in material){
      print(" id: "+usu['idpergunta'].toString() +
          " enunciado: "+usu['enunciado'] +
          " idmateria: "+usu['fk_idmateria'].toString() +
          " wrong: "+usu['alternativas_erradas']+
          " right: "+usu['alternativa_correta']);
    }
  }


  /*_listarUsuarios() async{
    Database bd = await _recuperarBancoDados();
    String sql = "SELECT * FROM MATERIA";
    Map<String, dynamic> dadosMateria = {
      "idmateria" : 1,
      "nome_materia" : "Matematica",
    };
    int id = await bd.insert("MATERIA", dadosMateria);

    List material = await bd.rawQuery(sql);
    for(var usu in material){
      print(" id: "+usu['idmateria'].toString() +
          " nome: "+usu['nome_materia']);
      }
      }*/

  @override
  Widget build(BuildContext context) {

    //Database db = _recuperarBancoDados();

    int geografiaPercent = 32;
    int historiaPercent = 30;
    int literaturaPercent = 32;
    int cienciasPercent = 30;

    //_InserirMateria("")

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
                      ElevatedButton(
                          child: Text("Teste"),
                          onPressed: (){
                            _InserirMateria();
                          }
                      ),
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
                                "/Lista",
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
                                "/Lista",
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ), Text("Desempenho"),
            /* Center(   //comment tava aqui
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                            childCenter: Text("Geografia",
                              style: TextStyle(color: Colors.white),),
                          childLeft: Text("$geografiaPercent%",
                              style: TextStyle(color: Colors.white)),
                            percent: 37,
                          theme: RoundedProgressBarTheme.green),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                            childCenter: Text("Historia",
                              style: TextStyle(color: Colors.white),),
                            childLeft: Text("$historiaPercent%",
                                style: TextStyle(color: Colors.white)),
                            percent: 58,
                            theme: RoundedProgressBarTheme.blue),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                            childCenter: Text("Literatura",
                              style: TextStyle(color: Colors.white),),
                            childLeft: Text("$literaturaPercent%",
                                style: TextStyle(color: Colors.white)),
                            percent: 15,
                            theme: RoundedProgressBarTheme.purple),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: RoundedProgressBar(
                            childCenter: Text("Ciências",
                                 style: TextStyle(color: Colors.white),),
                            childLeft: Text("$cienciasPercent%",
                                style: TextStyle(color: Colors.white)),
                            percent: 87,
                            theme: RoundedProgressBarTheme.midnight),
                      ),
                    ],
                  ),
                  color: Colors.black12,
                )
            )*/ //O outro comentt
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

