import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inscritos = ' ';
  String urlCanal = " ";
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getInfo(String canal) async {
    if (canal != "") {
      var url =
          "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$canal&type=channel&maxResults=1&key=AIzaSyDjS5xa8lRwf7AlDa48JvVJbpTR8mcgQJI";

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var channelId = jsonResponse['items'][0]['id']['channelId'];
        var url = jsonResponse['items'][0]['snippet']['thumbnails']['medium']['url'];
        setState(() {
          urlCanal = url;
        });
        return await getCont(channelId);
      }
    }else{
      setState(() {
        inscritos = "Error";
      });
    }
  }

  getCont(String id) async {
    var url =
        "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=$id&key=AIzaSyDjS5xa8lRwf7AlDa48JvVJbpTR8mcgQJI";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var subscriberCount =
          jsonResponse['items'][0]['statistics']['subscriberCount'];
      setState(() {
        inscritos = subscriberCount;
        print(inscritos);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'Contador de Inscritos',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Wrap(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 10),
                child: TextField(
                  controller: controller,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      getInfo(controller.text);
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: urlCanal != " " ? NetworkImage(urlCanal) : NetworkImage('https://imageog.flaticon.com/icons/png/512/174/174883.png?size=1200x630f&pad=10,10,10,10&ext=png&bg=FFFFFFFF'),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 30, right: 50, left: 50, bottom: 20),
                child: Text(
                  inscritos == ' ' ? ' ' : inscritos,
                  style: TextStyle(fontSize: 50),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
