import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:basicflutter/src/register.dart';

class ConfirmSms extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConfirmSms',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ConfirmSmsPage(title: 'Flutter Confirm SMS Page'),
    );
  }
}

class ConfirmSmsPage extends StatefulWidget {
  ConfirmSmsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConfirmSmsPageState createState() => _ConfirmSmsPageState();
}

class _ConfirmSmsPageState extends State<ConfirmSmsPage> {
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

  Widget _phoneNumberWidget() {
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
          )
      ]),
      child: Column(
        children: <Widget>[
          _entryField("รหัส SMS"),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          OTPTextField(
            length: 4,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 50,
            fieldStyle: FieldStyle.underline,
            style: TextStyle(
              fontSize: 17
            ),
            onChanged: (pin) {
              print("Changed: " + pin);
            },
            onCompleted: (pin) {
              print("Completed: " + pin);
            },
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
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
        child: Text("ต่อไป", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _sendEmailAgainWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            // onTap: (){
            //   Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => RegisterPage()));
            // },
            child: new Text('ส่ง SMS อีกครั้ง',
            style: new TextStyle(color: Color.fromRGBO(113,44,139,1)))
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
                    _phoneNumberWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    _sendEmailAgainWidget(),
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