import 'package:flutter/material.dart';
import 'package:basicflutter/src/index.dart';

class Start extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StartPage(title: 'Flutter Start Page'),
    );
  }
}

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },   
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.purple[900],
                Colors.purple[700],
                Colors.purple[500],
                Colors.pink[600],
                Colors.pink[500],
              ],
            ),
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/pic.png',
                fit: BoxFit.fitWidth,
              )
            )
          ),
        ),
      )
    );
  }
}