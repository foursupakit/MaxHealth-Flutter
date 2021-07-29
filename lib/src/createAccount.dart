import 'package:flutter/material.dart';
import 'package:basicflutter/src/register.dart';
import 'package:basicflutter/src/login.dart';
import 'package:basicflutter/src/confirmSMS.dart';

class CreateAccout extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CreateAccout',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CreateAccoutPage(title: 'Flutter Create Accout Page'),
    );
  }
}

class CreateAccoutPage extends StatefulWidget {
  CreateAccoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateAccoutPageState createState() => _CreateAccoutPageState();
}

class _CreateAccoutPageState extends State<CreateAccoutPage> {
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

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('สร้างบัญชี',style: TextStyle(color: Color.fromRGBO(113,44,139,1), fontSize: 18)),
        Text('เพื่อที่เราจะได้รู้จักกันมากขึ้น',style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget _phoneNumberWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(113,44,139,1),
          width: 1.0,
          style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white,
          )
      ]),
      child: Column(
        children: <Widget>[
          _entryField("เบอร์มือถือ"),
          SizedBox(
            height: 30,
          ),
          _submitButton(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _entryField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '+66 |',
              hintStyle: TextStyle(fontSize: 13),
              fillColor: Color(0xffffffff),
              filled: true)),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => ConfirmSmsPage()));
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
          'ส่ง',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      )
    );
  }

  Widget _createAccountLoginWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: new Text('สร้างบัญชีด้วยอีเมล',
            style: new TextStyle(color: Color.fromRGBO(113,44,139,1))),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: new Text('เข้าสู่ระบบ',
            style: new TextStyle(color: Color.fromRGBO(113,44,139,1)))
          )
        ],
      ),
    );
  }

  Widget _otherChannelWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Text('ช่องทางอื่นๆ',style: TextStyle(fontSize: 16)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/background.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/background.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/background.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/background.jpg'),
                ),
              ]
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _phoneNumberWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    _createAccountLoginWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _otherChannelWidget(),
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