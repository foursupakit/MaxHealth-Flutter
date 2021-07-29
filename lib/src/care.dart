import 'package:flutter/material.dart';

import 'package:basicflutter/src/home.dart';
import 'package:basicflutter/src/cart.dart';
import 'package:basicflutter/src/account.dart';
import 'package:basicflutter/src/subscription.dart';

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

class Care extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CarePage(title: 'Flutter Care Page'),
    );
  }
}

class CarePage extends StatefulWidget {
  CarePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CarePageState createState() => _CarePageState();
}

class _CarePageState extends State<CarePage> {
  int _page = 1;

  void _onItemTapped(int page) {
    if (page == 1) {
      return;
    } else {
      setState(() {
        if (page == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
      color: Colors.white,
      child: Column(
        children: [
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
            items: imgList.map((item) => Container(
              child: Center(
                child: Image.network(item, fit: BoxFit.cover, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width)
              ),
            )).toList(),
          ),
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Row(
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
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 10,top: 4),
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    // color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ]
          ),
          _carouselSliderDetail()
        ]
      ),
    );
  }

  Widget _carouselSliderDetail() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  )
              )
            ]
          )
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(right: 10, top: 35),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SubscriptionPage()));
              },
              child: Text(
                'More',
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.blue),
              ),
            )
          ),
        )
      ]
    );
  }

  Widget _containerHeaderTiltleWidget(String title) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(title,
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.grey),
              onPressed: () {

              },
            ),
          ],
        ),
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
                    _containerHeaderTiltleWidget('7 วิธีดูแลสุขภาพผิวเพื่อเช้าที่สดใส'),
                    _carouselSlider(),
                    SizedBox(height: 10),
                    _containerHeaderTiltleWidget('รู้ไหม ? ดื่มเครื่องดื่มน้ำผลไม้เบอรี่รวม Max Berry Plus เป็นประจำดีอย่างไร?'),
                    _carouselSlider(),
                    SizedBox(height: 10),
                    _containerHeaderTiltleWidget('สูงวัยสุขภาพดี'),
                    _carouselSlider(),
                    SizedBox(height: 10),
                    _containerHeaderTiltleWidget('สั่งเป็นประจำทุกเดือนแบบ Subscription'),
                    _carouselSlider(),
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