import 'package:flutter/material.dart';
import 'package:basicflutter/src/createAccount.dart';
import 'package:basicflutter/src/login.dart';
import 'package:basicflutter/src/home.dart';

class MyHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyHome',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter MyHome Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _imageWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/background.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Column(
      children: [
        Text('เครื่องดื่มน้ำผลไม้เบอรี่รวม',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
            height: 5,
        ),
        Text('Max Berry Plus',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        'จากการศึกษาพบว่าในผลเบอร์รี่ มีสารอาหารที่ให้คุณประโยชน์ต่อร่างกายและสุขภาพที่ดีจาก Antrocyanin, Gaba ซึ่งเป็นกรดอะมิโนที่มีความสำคัญในการเป็นสารสื่อประสาท(Neurotransitter) และสารต้านอนุมูลอิสระ Antioxidant ลดการอักเสบของเซลล์ตามส่วนต่างๆของร่างกาย ซึ่งเมื่อทานน้ำผลไม้เบอรรี่รวมสกัดเข้มข้น Max Berry Plus จะได้คุณประโยชน์ต่อสุขภาพและร่างกายหลายด้านจากสารอาหารที่มีประโยชน์ต่อสุขภาพจากผลเบอร์รี่ทั้ง 11 ชนิด',
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        child: Text("เข้าสู่ระบบ",
          style: TextStyle(fontSize: 16.0)
        ),
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width-40,50),
          padding: EdgeInsets.symmetric(horizontal: 16),
          primary: Colors.white,
          onPrimary: Color.fromRGBO(113,44,139,1),
          shape: StadiumBorder(),
          side: BorderSide(width: 1.0, color: Color.fromRGBO(113,44,139,1)),
        ),
      )
    );
  }

  Widget _createAccountButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child:ElevatedButton(
        child: Text(
          "สร้างบัญชี",
          style: TextStyle(fontSize: 16.0)
        ),
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateAccoutPage()));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width-40,50),
          padding: EdgeInsets.symmetric(horizontal: 16),
          primary: Color.fromRGBO(113,44,139,1),
          onPrimary: Colors.white,
          shape: StadiumBorder(),
        ),
      )
    );
  }

  Widget _skipButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('ข้าม',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color.fromRGBO(113,44,139,1))),
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_right, color: Color.fromRGBO(113,44,139,1)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the WelcomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: height * .06),
                    _skipButton(),
                    SizedBox(height: 10),
                    _imageWidget(),
                    SizedBox(height: 15),
                    _headerWidget(),
                    SizedBox(height: 5),
                    _titleWidget(),
                    SizedBox(height: 20),
                    _createAccountButton(),
                    SizedBox(height: 20),
                    _loginButton(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                )
              )
            ),
          ]
        ),
      ),
    );
  }
}