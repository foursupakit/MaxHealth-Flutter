import 'package:basicflutter/src/addAndEditAddress.dart';
import 'package:flutter/material.dart';
import 'package:basicflutter/src/payment.dart';

class CheckOut extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckOut',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CheckOutPage(title: 'Flutter CheckOut Page'),
    );
  }
}

class CheckOutPage extends StatefulWidget {
  CheckOutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Widget _containerHeaderTiltleWidget(String title, String subtitle) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title, style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          if (subtitle != '') ...[
            GestureDetector(              
              onTap: () {
                if (title == 'ที่อยู่จัดส่ง') {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddAndEditAddressPage()));  
                } else if (title == 'การจัดส่ง') {
                    Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PaymentPage(title: 'การชำระเงิน')));  
                }          
              },           
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: subtitle, style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,)),
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
          ]
        ],
      )
    );
  }

  Widget _containerHeaderSubTiltleWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.0, 0, 0, 16.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 12.0),
            child: Text('พงษ์ศักดิ์ สายชมพู', style: new TextStyle(fontWeight: FontWeight.bold))
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('บ้านเลขที่ 3 ถนนสุรัตน์นิเวศน์, ต.ท่าศาล, อ.เมืองเชียงใหม่, เชียงใหม่ 5000 ', style: new TextStyle(color: Colors.black))
          )
        ]
      )
    );
  }

  Widget _cardFlexibleWidget(String title, String subtitle, String price) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1,color: Colors.grey[400])
        ),
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
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,                 
                    children: <Widget>[
                      if (subtitle != '' && price != '') ...[
                        Text(
                          subtitle,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        Text(
                          '฿'+ price,
                          style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ]
                  ),
                ),
              )
            ],
          ),
        )
      ) 
    );
  }

  Widget _fieldDiscountWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              height: 45.0,
              child: Padding(
                padding: EdgeInsets.only(right: 0.0),                                
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'ระบุรหัสส่วนลดอื่นๆ (ถ้ามี)',
                    labelStyle: TextStyle(fontSize: 13.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    height: 1.0,            
                  )
                ),
              )
            )

          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: OutlinedButton(             
                onPressed: () {
                    // Respond to button press
                },                 
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  side: BorderSide(width: 1, color: Colors.deepPurple),
                ),                  
                child: Text("ตกลง",style: TextStyle(fontWeight: FontWeight.bold)),
              )
            )
          )
        ]
      )
    );
  }

  Widget _shipmentContainerWidget() {
    return Container(
      color: Colors.white,
      height: 170,
      child: Column(
        children: <Widget>[
          _containerHeaderTiltleWidget('การจัดส่ง','แก้ไข'),
          _cardFlexibleWidget('Kerry','จะได้รับในวันที่ 1 กพ. - 3กพ.','90'),
        ],
      ),
    );
  }

  Widget _discountContainerWidget() {
    return Container(
      color: Colors.white,
      height: 240,
      child: Column(
        children: <Widget>[
          _containerHeaderTiltleWidget('ส่วนลดแนะนำ',''),
          _cardFlexibleWidget('ส่วนลดแนะนำพิเศษ','',''),
          _fieldDiscountWidget(),
        ],
      ),
    );
  }

  Widget _totalWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
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
                child: Text('สั่งซื้อ', style: new TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PaymentPage(title: 'การชำระเงิน')));
                }
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _totalResultWidget() {
    return Container(
      color: Colors.white,                         
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Divider(color: Colors.black, height: 1),
              Column(                   
                crossAxisAlignment: CrossAxisAlignment.end,                 
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text('ยอดรวมสินค้า(1)    ฿3,690'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'ส่วนลด   ฿369',
                      style: new TextStyle(color: Colors.grey)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text('ค่าจัดส่ง    +฿90'),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          _containerHeaderTiltleWidget('ที่อยู่จัดส่ง','แก้ไข'),
                          _containerHeaderSubTiltleWidget(),
                          SizedBox(height: 10),
                          _shipmentContainerWidget(),
                          SizedBox(height: 10),
                          _discountContainerWidget(),
                          SizedBox(height: 10),
                          _containerHeaderTiltleWidget('สินค้า',''),
                          Divider(color: Colors.grey, height: 1),
                          _totalWidget(),
                          SizedBox(height: 30),
                          _totalResultWidget()
                        ],
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      ),
    );
  }
}