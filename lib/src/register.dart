import 'package:flutter/material.dart';
import 'package:basicflutter/src/welcome.dart';

class Register extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: RegisterPage(title: 'Flutter Register Page'),
    );
  }
}

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Color.fromRGBO(113,44,139,1)),
            ),
            Text('ย้อนกลับ',
                style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromRGBO(113,44,139,1)))
          ],
        ),
      ),
    );
  }

  Widget _entry2Field(String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ชื่อ',
                  hintStyle: TextStyle(fontSize: 13),
                  fillColor: Color(0xffffffff),
                  filled: true))
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 31,
                ),
                Text('|')
              ]
            )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              SizedBox(
                height: 31,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'นามสกุล',
                  hintStyle: TextStyle(fontSize: 13),
                  fillColor: Color(0xffffffff),
                  filled: true))
              ],
            ),
          ),
        ]
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isPassword) ...[
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                children: <TextSpan>[
                  new TextSpan(text: title),
                  new TextSpan(text: ' สำหรับใช้เข้าสู่ระบบในครั้งถัดไป', style: new TextStyle(color: Color((0xff9e9e9e)), fontSize: 13)),
                ],
              ),
            ),
          ]
          else ...[
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                children: <TextSpan>[
                  new TextSpan(text: title),
                  new TextSpan(text: ' สำหรับใช้เข้าสู่ระบบ', style: new TextStyle(color: Color((0xff9e9e9e)), fontSize: 13)),
                ],
              ),
            ),
          ],
          SizedBox(
            height: 10,
          ),
          if (isPassword) ...[
            TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: 'รหัสผ่าน',
              hintStyle: TextStyle(fontSize: 13),
              suffixIcon: Icon(Icons.remove_red_eye),
              fillColor: Color(0xffffffff),
              filled: true)),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ยืนยันรหัสผ่านอีกครั้ง',
                  hintStyle: TextStyle(fontSize: 13),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  fillColor: Color(0xffffffff),
                  filled: true)),
              SizedBox(
                height: 10,
              ),
              Text(
                'use 8 or more characters with a mix of letters, numer & symbols',
                style: TextStyle(fontSize: 11, color: Color((0xff424242))),
              ),
          ]
          else ...[
            TextField(
              decoration: InputDecoration(
                hintText: 'example@email.com',
                hintStyle: TextStyle(fontSize: 13),
                fillColor: Color(0xffffffff),
                filled: true)),
          ]
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2)
          ],
          color: Color.fromRGBO(113,44,139,1),
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [Color(0xffab47bc), Color(0xff7b1fa2)]
          // )
        ),
        child: Text(
          'ตกลง',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 1.0,
          style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            // offset: Offset(2, 4),
            // blurRadius: 5,
            // spreadRadius: 2
          )
      ]),
      child: Column(
        children: <Widget>[
          _entry2Field("ชื่อ"),
          _entryField("อีเมล"),
          _entryField("ตั้งรหัสผ่าน", isPassword: true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () async {
      //       await Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => MyHomePage()
      //         )
      //       );
      //     }
      //   ), 
      //   title: Text("ย้อนกลับ"),
      // ),
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            // Positioned(
            //   top: -MediaQuery.of(context).size.height * .15,
            //   right: -MediaQuery.of(context).size.width * .4,
            //   child: BezierContainer(),
            // ),
            Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                  ],
                ),
              ),
            ),
            Positioned(top: 60, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}