import 'package:flutter/material.dart';
import 'package:basicflutter/src/index.dart';

import 'package:basicflutter/src/home.dart';
import 'package:basicflutter/src/care.dart';
import 'package:basicflutter/src/cart.dart';

class Account extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountPage(title: 'Flutter Account Page'),
    );
  }
}

class AccountPage extends StatefulWidget {
  AccountPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _page = 3;

  void _onItemTapped(int page) {
    if (page == 3) {
      return;
    } else {
      setState(() {
        if (page == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (page == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CarePage()));
        } else if (page == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        }
      });
    }
  }

  Widget _categoryList() {
    return Container(
      color: Colors.white,
      height: 140,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.article_outlined,
                  color: Colors.blue,
                  size: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("รายการของฉัน", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[ 
                    IconButton(
                      icon: const Icon(Icons.account_balance_wallet_outlined, size: 35.0),
                      onPressed: () {

                      },
                    ),
                    Text('ที่ต้องชำระ', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: <Widget>[ 
                    IconButton(
                      icon: const Icon(Icons.inventory, size: 35.0),
                      onPressed: () {

                      },
                    ),
                    Text('ที่ต้องจัดส่ง', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: <Widget>[ 
                    IconButton(
                      icon: const Icon(Icons.local_shipping_outlined, size: 35.0),
                      onPressed: () {

                      },
                    ),
                    Text('กำลังจัดส่ง', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: <Widget>[ 
                    IconButton(
                      icon: const Icon(Icons.filter_none, size: 35.0),
                      onPressed: () {

                      },
                    ),
                    Text('รายการทั้งหมด', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: <Widget>[ 
                    IconButton(
                      icon: const Icon(Icons.favorite_outline, size: 35.0),
                      onPressed: () {

                      },
                    ),
                    Text('ที่ถูกใจ', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            )
          )
        ]
      )
    );
  }

  Widget _buyAgainWidget() {
    return Container(
      color: Colors.white,
      height: 180,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.green[200],
                        size: 35.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("สั่งซื้ออีกครั้ง", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                      )
                    ]
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("ดูทั้งหมด", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blue)),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.blue,
                        size: 30.0,
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
          _listViewSuggestCardWidget(),
        ]
      )
    );
  }

  Widget _paymentWidget() {
    return Container(
      color: Colors.white,
      height: 60,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.payment_rounded,
                    color: Colors.purple[300],
                    size: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("การชำระเงิน", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  )
                ]
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.blue,
                    size: 30.0,
                  )
                ]
              ),
            ),
          ]
        )
      )
    );
  }

  Widget _addressWidget() {
    return Container(
      color: Colors.white,
      height: 60,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.orange[200],
                    size: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("ที่อยู่ในการจัดส่ง", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  )
                ]
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.blue,
                    size: 30.0,
                  )
                ]
              ),
            ),
          ]
        )
      )
    );
  }

  Widget _contactWidget() {
    return Container(
      color: Colors.white,
      height: 60,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.contact_support_outlined,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("ติดต่อ Max Health", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  )
                ]
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.blue,
                    size: 30.0,
                  )
                ]
              ),
            ),
          ]
        )
      )
    );
  }

  Widget _cardWidget(String image) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.22,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: (){
          // Navigator.push(
          //   context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.asset(
                image,                
                height: 70,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth
              ),
            ],
          ),
        ),
      )  
    );
  }

  Widget _listViewSuggestCardWidget() {
    return Container(
      height: 94,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,     
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),         
        children: <Widget>[
          _cardWidget('assets/images/background.jpg'),
          _cardWidget('assets/images/background.jpg'),
          _cardWidget('assets/images/background.jpg'),
          _cardWidget('assets/images/background.jpg'),
          _cardWidget('assets/images/background.jpg'),
          _cardWidget('assets/images/background.jpg'),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/background.jpg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Name Test"),
            )
          ],
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chat_bubble_outline,color: Colors.white),
                onPressed: () => 
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyHomePage())
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
        height: height,
        color: Colors.grey[300],
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _categoryList(),
                    SizedBox(height: 10),
                    _buyAgainWidget(),
                    SizedBox(height: 10),
                    _paymentWidget(),
                    SizedBox(height: 10),
                    _addressWidget(),
                    SizedBox(height: 10),
                    _contactWidget(),
                    SizedBox(height: 10),
                  ]
                )
              ),
            )
          ]
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',         
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Care',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Colors.blue[800],
        backgroundColor: Colors.grey[100],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}