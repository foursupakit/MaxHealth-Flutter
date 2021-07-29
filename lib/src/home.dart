import 'package:flutter/material.dart';
import 'package:basicflutter/src/productDetail.dart';

import 'package:basicflutter/src/cart.dart';
import 'package:basicflutter/src/account.dart';
import 'package:basicflutter/src/care.dart';

import 'package:carousel_slider/carousel_slider.dart';

int _current = 0;

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(title: 'Flutter Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  void _onItemTapped(int page) {
    if (page == 0) {
      return;
    } else {
      setState(() {
        if (page == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CarePage()));
        } else if (page == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (page == 3) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
        }
      });
    }
  }

  Widget _carouselSlider() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
            items: imgList.map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Image.network(item, fit: BoxFit.cover, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,)
                ),
              ),
            ).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: _current == index
                    ? 40.0
                    : 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),                           
                  color: _current == index
                    ? Colors.blue
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),    
              );
            }).toList(),
          ), 
        ]
      ),
    );
  }

  Widget _cardWidget(String image, String title, String subtitle, String price, String discount, {bool isRecommended = false, bool isDiscount = false, bool isNew = false, bool isFavorite = false}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
        },
        child: Stack(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.asset(
                    image,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth
                  ),
                  ListTile(
                    title: Text(title),
                    subtitle: Text(
                      subtitle,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal :16.0),
                    child: Row(
                      children: [
                        Text(price, style: TextStyle(fontSize: 13, color: Colors.blue)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            discount, style: TextStyle(fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough)
                          )                                           
                        )
                      ],                               
                    ),
                  ),
                ],
              ),
            ),
            if (isDiscount) ...[
              Positioned(
                top: -12,
                right: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_sharp,size: 60,color: Colors.blue[600]),
                ),
              ),
              Positioned(
                top: 14,
                right: 13,
                child: Text('-10%', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
              ),
            ],
            if (isRecommended) ...[
              Positioned(
                top: MediaQuery.of(context).size.width * 0.33,
                left: -12,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),                                                                   
                  child: Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(204, 154, 38, 1),
                          Color.fromRGBO(212, 162, 46, 1),
                          Color.fromRGBO(218, 168, 52, 1),
                          Color.fromRGBO(227, 177, 61, 1),
                          Color.fromRGBO(237, 187, 71, 1),
                          Color.fromRGBO(245, 195, 79, 1),
                          Color.fromRGBO(255, 236, 120, 1),               
                        ],
                      )
                    ),
                    child: Center(
                      child: Text(
                        'Recommended',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              )
            ],
            if (isNew) ...[
              Positioned(
                top: MediaQuery.of(context).size.width * 0.33,
                left: -12,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),                                                                   
                  child: Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(105, 32, 142, 1),
                          Color.fromRGBO(145, 56, 167, 1),
                          Color.fromRGBO(202, 58, 176, 1),
                          Color.fromRGBO(242, 61, 146, 1),      
                          Color.fromRGBO(247, 23, 70, 1),
                          Color.fromRGBO(226, 27, 34, 1),      
                        ],
                      )
                    ),
                    child: Center(
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              )
            ],
            if (isFavorite) ...[
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite,size: 30,color: Colors.red),
                ),
              ),
            ],
          ]
        )
      ) 
    );
  }

  Widget _listViewSuggestCardWidget() {
    return Container(
      height: 280,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,     
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),         
        children: <Widget>[
          _cardWidget('assets/images/background.jpg','เครื่องดื่มน้ำผลไม้','Max Berry Plus...','฿1,814.40','฿2,016', isRecommended: true , isDiscount: true),
          _cardWidget('assets/images/background.jpg','ชุด Max Garlic Set','ประกอบไปด้วย...','฿1,814.40','', isRecommended: true),
          _cardWidget('assets/images/background.jpg','เครื่องดื่มน้ำผลไม้','Max Berry Plus...','฿1,814.40','฿2,016'),
          _cardWidget('assets/images/background.jpg','ชุด Max Garlic Set','ประกอบไปด้วย...','฿1,814.40',''),
          _cardWidget('assets/images/background.jpg','เครื่องดื่มน้ำผลไม้','Max Berry Plus...','฿1,814.40','฿2,016'),
          _cardWidget('assets/images/background.jpg','ชุด Max Garlic Set','ประกอบไปด้วย...','฿1,814.40',''),
        ],
      )
    );
  }

  Widget _listViewNewCardWidget() {
    return Container(
      height: 280,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,     
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),        
        children: <Widget>[
          _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250','', isNew: true),
          _cardWidget('assets/images/background.jpg','กาแฟอันเดอร์ shade Bird...','ขนาด 250 กรัม','฿1,680','', isNew: true),
          _cardWidget('assets/images/background.jpg','เครื่องดื่มน้ำผลไม้','Max Berry Plus...','฿1,820','', isNew: true),
          _cardWidget('assets/images/background.jpg','ชุด Max Garlic Set','ประกอบไปด้วย...','฿1,900','', isNew: true),
          _cardWidget('assets/images/background.jpg','เครื่องดื่มน้ำผลไม้','Max Berry Plus...','฿1,900','', isNew: true),
          _cardWidget('assets/images/background.jpg','ชุด Max Garlic Set','ประกอบไปด้วย...','฿1,900','', isNew: true),
        ],
      )
    );
  }

  Widget _containerHeaderTiltleWidget(String title, String subtitle) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
              style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            GestureDetector(
              // onTap: (){
              //   Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => LoginPage()));
              // },
              child: new Text(subtitle,
              style: new TextStyle(color: Colors.grey))
            ),
          ],
        ),
      ),
    );
  }

  Widget _productForYouWidget() {
    return Container(
      child: Column(
        children: <Widget>[ 
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('สินค้าสำหรับคุณ',
                    style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 280,
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250','', isDiscount: true, isNew: true, isFavorite: true),
                      ),
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250','', isRecommended: true, isFavorite: true),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250','', isRecommended: true, isDiscount: true),
                      ),
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250','', isRecommended: true),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250',''),
                      ),
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250',''),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250',''),
                      ),
                      Expanded(
                        child: _cardWidget('assets/images/background.jpg','ข้าวน้ำตาลต่ำ กข43','ขนาดถุง 5 กิโลกรัม','฿250',''),
                      ),
                    ],
                  ),
                ),
              ],
            ),   
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        title: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            prefixText: ' ',
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.tune, color: Colors.grey),
                onPressed: () {

                },
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline, color: Colors.grey),
                onPressed: () {

                },
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
                    _carouselSlider(),
                    _containerHeaderTiltleWidget('สินค้าแนะนำ','ดูทั้งหมด'),
                    _listViewSuggestCardWidget(),
                    SizedBox(height: 10),
                    _containerHeaderTiltleWidget('สินค้าใหม่','ดูทั้งหมด'),
                    _listViewNewCardWidget(),
                    _productForYouWidget(),
                  ]
                )
              )
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