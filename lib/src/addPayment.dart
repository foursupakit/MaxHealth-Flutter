import 'package:flutter/material.dart';
import 'package:basicflutter/src/addAndEditAddress.dart';

class AddPayment extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AddPayment',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AddPaymentPage(title: 'เพิ่มบัตรเครดิต'),
    );
  }
}

class AddPaymentPage extends StatefulWidget {
  AddPaymentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddPaymentPageState createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  Widget _formInputWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
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
          _entryField("ชื่อ-สกุล ที่ปรากฏบนบัตร"),
          _entryField("หมายเลขบัตร"),
          _entryField("วันหมดอายุบัตร MM/YY"),
          _entryField("CVV"),
          _entryField("ที่อยู่"),
          _entryField("รหัสไปรษณีย์"),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _entryField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != 'ที่อยู่') ...[
            TextField(
              decoration: InputDecoration(
              hintText: title,
              hintStyle: TextStyle(fontSize: 13),
              fillColor: Color(0xffffffff),
              filled: true)
            ),
          ]
          else ...[
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: title,
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
          context, MaterialPageRoute(builder: (context) => AddAndEditAddressPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2
            )
          ],
          color: Colors.blue,
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [Color(0xffab47bc), Color(0xff7b1fa2)]
          // )
        ),
        child: Text(
          'เพิ่มบัตร',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          }
        ), 
        title: Text(widget.title,
          style: TextStyle(fontSize: 18, color: Colors.black)
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            // Positioned(
            //   top: -MediaQuery.of(context).size.height * .15,
            //   right: -MediaQuery.of(context).size.width * .4,
            //   child: BezierContainer(),
            // ),
            Container(
              width: width,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .03),
                    _formInputWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}