import 'package:flutter/material.dart';

class AddAndEditAddress extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AddAndEditAddress',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AddAndEditAddressPage(title: 'Flutter Add And Edit Address Page'),
    );
  }
}

class AddAndEditAddressPage extends StatefulWidget {
  AddAndEditAddressPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddAndEditAddressPageState createState() => _AddAndEditAddressPageState();
}

class _AddAndEditAddressPageState extends State<AddAndEditAddressPage> {
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
          _entryField("รหัสไปรษณีย์"),
          _entryField("บ้านเลขที่"),
          _entryField("สำนักงาน, ตึก, คอนโด, ชั้น(ถ้ามี)"),
          _entryField("ถนน"),
          _entryField("ตำบล, แขวง"),
          _entryField("อำเภอ, เขต"),
          _entryField("จังหวัด"),
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
          if (title != 'รหัสไปรษณีย์') ...[
            TextField(
              decoration: InputDecoration(
              hintText: title,
              hintStyle: TextStyle(fontSize: 13),
              fillColor: Color(0xffffffff),
              filled: true)
            ),
          ]
          else ...[
            Text('ที่อยู่',
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            TextField(
              decoration: InputDecoration(
                hintText: title,
                hintStyle: TextStyle(fontSize: 13),
                suffixIcon: _searchButton(),
                fillColor: Color(0xffffffff),
                filled: true)),
          ]
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: EdgeInsets.symmetric(vertical: 16),
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
        color: Colors.blue,
        // gradient: LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   colors: [Color(0xffab47bc), Color(0xff7b1fa2)]
        // )
      ),
      child: Text(
        'ตกลง',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _searchButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.3,
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
        border: Border.all(color: Colors.blue),
        color: Colors.white,     
        // gradient: LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   colors: [Color(0xffab47bc), Color(0xff7b1fa2)]
        // )
      ),
      child: Text(
        'ค้นหา',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          }
        ), 
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text('ย้อนกลับ',
            style: TextStyle(fontSize: 16, color: Colors.blue)
          ),
        )
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
                padding: EdgeInsets.symmetric(horizontal: 16),
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