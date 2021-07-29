import 'package:flutter/material.dart';

class Subscription extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subscription',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SubscriptionPage(title: 'Flutter Subscription Page'),
    );
  }
}

class SubscriptionPage extends StatefulWidget {
  SubscriptionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
Widget _imageWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width*0.8,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/pic.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _detailHeaderWidget() {
    return Column(
      children: [
        Text('มาดื่มเครื่องดื่มน้ำผลไม้เบอรี่รวม Max Berry Plus เป็นประจำด้วยส่วนลดพิเศษเมื่อสั่งซื้อเป็นประจำทุกเดือนแบบ Subscription',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
        textAlign: TextAlign.center),
      ],
    );
  }

  Widget _detailTitleWidget() {
    return Container(
      child: Text(
        'เราจะส่ง เครื่องดื่มน้ำผลไม้เบอรี่รวม Max Berry Plus จำนวน 12 ขวด ให้คุณเป็นประจำทุกๆต้นเดือนในราคาลดพิเศษสุด พร้อมส่งฟรีทั่วประเทศ',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _subscriptiontWidget(String month, String point, String newPrice, String oldPrice) {
    return Container(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(  
          borderRadius: BorderRadius.circular(12.0),  
        ),
        child: Container(
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ 
                    Text(month, style: TextStyle(fontSize: 32, color: Colors.blue[800], fontWeight: FontWeight.bold)),
                    Text('เดือน', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                  ],
                )
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide( 
                          color: Colors.grey[400],
                          width: 1.0,
                        )
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                          Text('Subscription '+ month +' เดือน', style: TextStyle(fontSize: 14)),
                          Text('พร้อมแต้มสะสมพิเศษ '+ point  +' แต้ม', style: TextStyle(fontSize: 14, color: Colors.grey)),
                          Row(
                            children: [
                              Text('฿'+ newPrice, style: TextStyle(fontSize: 13, color: Colors.blue)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Text('฿'+ oldPrice, style: TextStyle(fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                                    Text('(ต่อเดือน)', style: TextStyle(fontSize: 13, color: Colors.grey))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    )
                  ),
                )
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,             
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 5, 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'เลือก',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ),
            ]
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ), 
        title: InkWell(
          child: Text("ย้อนกลับ", style: TextStyle(fontSize: 16, color: Colors.blue)),
          onTap: () { Navigator.pop(context); },
        )
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple[700],
              Colors.purple[500],
              Colors.purple[400],
              Colors.pink[600],
              Colors.pink[400],
              Colors.red[300],
              Colors.white,
            ],
          )
        ),
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    _imageWidget(),
                    SizedBox(height: 20),
                    _detailHeaderWidget(),
                    SizedBox(height: 10),
                    _detailTitleWidget(),
                    SizedBox(height: 20),
                    _subscriptiontWidget('3', '200', '1,900', '2,016'),
                    SizedBox(height: 5),
                    _subscriptiontWidget('6', '400', '1,800', '2,016'),
                    SizedBox(height: 5),
                    _subscriptiontWidget('12', '800', '1,680', '2,210'),
                    SizedBox(height: 5),
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