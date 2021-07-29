import 'package:flutter/material.dart';
import 'package:basicflutter/src/editPayment.dart';

class Payment extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: PaymentPage(title: 'Flutter Payment Page'),
    );
  }
}

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Widget _containerHeaderTiltleWidget(String title, String subtitle) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          if (subtitle != '' && title == 'ช่องทางที่บันทึกไว้') ...[
            GestureDetector( onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => EditPaymentPage(title: 'ช่องทางการชำระเงิน')));
            },
            child: Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                      children: [
                        TextSpan(text: subtitle,
                        style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 16.0, 0),
                            child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue, size: 16),                    
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            )
          ] else ...[
            Row(
              children: <Widget>[
                RichText(
                    text: TextSpan(
                    children: [
                      TextSpan(text: subtitle,
                      style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 16.0, 0),
                          child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue, size: 16),                    
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ]
        ],
      )
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
          padding: EdgeInsets.all(16.0),
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

  Widget _shipmentContainerWidget() {
    return Container(
      color: Colors.white,
      height: 270,
      child: Column(
        children: <Widget>[
          _containerHeaderTiltleWidget('ช่องทางที่บันทึกไว้','แก้ไข'),
          _cardFlexibleWidget('1234 56** **** 1234','หมดอายุ 8/24'),
          _cardFlexibleWidget('Mobile Banking','scb 123 456789 1'),
        ],
      ),
    );
  }

  Widget _qrCodetainerWidget() {
    return Container(
      color: Colors.white,
      height: 170,
      child: Column(
        children: <Widget>[
          _containerHeaderTiltleWidget('จ่ายด้วย QR Code',''),
          _cardFlexibleWidget('QR Code สำหรับ Mobile Ranking',''),
        ],
      ),
    ); 
  }

  Widget _paymentWidget() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'ราคารวมภาษีมูลค่าเพิ่มแล้ว',
                      style: new TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 13.0)
                    ),
                    Row(
                      children: [
                        Text(
                          'ยอดรวมทั้งหมด : ',
                          style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                        Text(
                          '฿3,411',
                          style: new TextStyle(color: Colors.blue)
                        ),
                      ],
                    )
                  ],
                ),         
              ],
            ),
          )
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(30, 65, 189, 1),
                Color.fromRGBO(71, 87, 212, 1),
                Color.fromRGBO(126, 83, 230, 1),
                Color.fromRGBO(155, 94, 238, 1),
              ],
            ),
          ),
          child: MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: const StadiumBorder(),
            child: Text('ชำระเงิน', style: new TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => EditPaymentPage(title: 'ช่องทางการชำระเงิน')));
            }
          ),
        ),
        SizedBox(height: 20),
      ],
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
                          _shipmentContainerWidget(),
                          SizedBox(height: 10),
                          _qrCodetainerWidget(),                         
                        ],
                      )
                    ),
                  ]
                )
              )
            ),
            Positioned(
              bottom: 0,
              child: _paymentWidget()
            ),
          ]
        )
      ),
    );
  }
}