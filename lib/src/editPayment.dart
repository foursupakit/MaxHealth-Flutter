import 'package:flutter/material.dart';
import 'package:basicflutter/src/addPayment.dart';

class EditPayment extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EditPayment',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: EditPaymentPage(title: 'Flutter EditPayment Page'),
    );
  }
}

class EditPaymentPage extends StatefulWidget {
  EditPaymentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EditPaymentPageState createState() => _EditPaymentPageState();
}

class _EditPaymentPageState extends State<EditPaymentPage> {
  Widget _containerHeaderTiltleWidget(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 16.0),
      child: Text(
        title,style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _cardFlexibleWidget(String title, String subtitle) {
    bool selected = false;

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: selected
          ? new RoundedRectangleBorder(
              side: new BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10.0))
          : new RoundedRectangleBorder(             
              side: new BorderSide(width: 1, color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(10.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(             
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/background.jpg',               
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),            
                ),
              ),
              VerticalDivider(color: Colors.black, width: 20),
              Expanded(
                child: ListTile(                 
                  title: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,                 
                    children: <Widget>[   
                      Text(
                        subtitle,
                        style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 14),
                      ),            
                    ]
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AddPaymentPage(title: 'เพิ่มบัตรเครดิต')));
                  }
                ),
              ) 
              // Checkbox(
              //   value: selected,
              //   onChanged: (value) {
              //     setState(() {
              //       selected = value;
              //     });
              //   }
              // )
            ],
          ),
        )
      ) 
    );
  }

  Widget _buttonSubmitWidget(String string) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: OutlinedButton.icon(             
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPaymentPage(title: 'เพิ่มบัตรเครดิต')));
          },                 
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),          
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(width: 1, color: Colors.blue),
          ),                  
          icon: Icon(Icons.add, color: Colors.blue),
          label: Text(string, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
        )
      ),
    );
  }

  Widget _creditCardContainerWidget() {
    return Container(
      color: Colors.white,
      height: 230,
      child: Column(
        children: <Widget>[
          _containerHeaderTiltleWidget('บัตรเครดิตของฉัน'),
          _cardFlexibleWidget('1234 56** **** 1234','หมดอายุ 8/24'),
          _buttonSubmitWidget('เพิ่มบัตรเครดิต')
        ],
      ),
    );
  }

    Widget _bankContainerWidget() {
    return Container(
      color: Colors.white,
      height: 230,
      child: Column(
        children: <Widget>[
          _containerHeaderTiltleWidget('ธนาคารของฉัน'),
          _cardFlexibleWidget('Mobile Banking','scb 123 456789 1'),
          _buttonSubmitWidget('เพิ่มบัญชี Mobile Banking')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          }
        ), 
        title: Text(widget.title,
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        // color: Colors.black,
        width: width,
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          _creditCardContainerWidget(),
                          SizedBox(height: 10),        
                          _bankContainerWidget(),
                        ],
                      )
                    ),
                  ]
                )
              )
            ),
          ]
        )
      ),
    );
  }
}