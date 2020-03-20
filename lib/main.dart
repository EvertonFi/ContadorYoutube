import 'package:contadoryoutube/ApiCanal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

  final _input = GlobalKey<FormState>();

  String nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Contador de Inscritos', style: TextStyle(fontSize: 30),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blue[50],
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _input,
                      child: TextFormField(
                        style: TextStyle(fontSize: 30),
                        onSaved: (input) => nome = input,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    iconSize: 40,
                    color: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {
                      if (_input.currentState.validate()) {
                        _input.currentState.save();
                        print(nome.toString());
                      }
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.blue[200],
                child: Image.asset('assets/img/Icone.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Text(
                  '329',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
