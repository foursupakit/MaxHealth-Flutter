import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:expandable/expandable.dart';
import 'package:basicflutter/src/home.dart';
import 'package:basicflutter/src/productDetailInfo.dart';
import 'package:basicflutter/src/checkOut.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class ProductDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProductDetail',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ProductDetailPage(title: 'Flutter ProductDetail Page'),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

int _current = 0;

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _page = 0;

  void _onItemTapped(int page) {
    if (page == 0) {
      return;
    } else {
      setState(() {
        if (page == 1) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CarePage()));
        } else if (page == 2) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (page == 3) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
        }
      });
    }
  }

  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    ),
  )).toList();

  Widget _carouselSlider() {
    return Container(
      height: 200,
      child: ClipRRect(
        child: Stack(
          children: <Widget>[
            Swiper(
              autoplay: true,
              pagination: SwiperPagination(builder: SwiperPagination.fraction),
              itemCount: imgList.length,
              control: SwiperControl(color: Colors.white),                
              itemBuilder: (context, index) {
                return Image.network(                 
                  imgList[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ]
        )
      )
    );
  }

  Widget _appBarButton() {
    return AppBar(
      toolbarHeight: 40,
      backgroundColor: Colors.white.withOpacity(0),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.black.withOpacity(0.6)),
          child: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
      ),
      primary: false,
      actions: <Widget>[
        Container(
          decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.black.withOpacity(0.6)),
          child: IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white), 
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutPage()));
            }
          ),
        ),
        Container(
          decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.black.withOpacity(0.6)),
          child: IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white), 
            onPressed: () {}
          ),
        ),
      ],
      elevation: 0,
    );
  }

  Widget _carouselSliderWidget() {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          _carouselSlider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('฿3,690', style: TextStyle(fontSize: 18, color: Colors.blue)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_sharp, color: Colors.red), 
                    onPressed: () {}
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child:  IconButton(
                      icon: Icon(Icons.reply, color: Colors.black), 
                      onPressed: () {}
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0,10.0,16.0,8.0),
            child: Text(
              'ชุด Premium Max Healthy Set - ประกอบไปด้วยเครื่องดื่มผลไม้เบอรี่รวม Max Berry Plus 12 ขวดและ Max Garlic 500 g. 2 กระป๋อง',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[                                           
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child:Text(
                          '(168)',style: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                      )
                    ]
                  ) 
                ),    
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),                                                                   
                  child: Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
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
                          Color.fromRGBO(255, 236, 120, 1)   
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
              ],
            ),
          ),
        ]
      )
    );
  }

  Widget _containerHeaderTiltleWidget(String title, String subtitle) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (subtitle == '') ...[
              Text(title,
                style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey, size: 16.0), 
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProductDetailInfoPage()));
                }
              ),
            ]
            else ...[       
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16.0, 20.0, 10.0),
                child: Text(title,
                  style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.0, 20.0, 10.0),
                  child: Text(subtitle,
                   style: TextStyle(color: Colors.grey))
                )
              ),
            ]
          ],
        ),
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

  Widget _expandTransportationWidget() {
    return ExpandableNotifier(                   
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "ตัวเลือกการจัดส่ง",
                  )
                ),
                collapsed: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text('Kerry ฿90', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),    
                    Text('จะได้รับในวันที่ 1 กพ. - 3 กพ.',
                      style: new TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text('Kerry ฿90', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                        ),                     
                        Text('จะได้รับในวันที่ 1 กพ. - 3 กพ.',
                          style: new TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    for (var _ in Iterable.generate(5))
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          child: Text(
                            'loremIpsum',
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
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
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _carouselSliderWidget(),
                    SizedBox(height: 10),
                    _expandTransportationWidget(),
                    SizedBox(height: 10),
                    _containerHeaderTiltleWidget('รายละเอียดสินค้า', ''),
                    SizedBox(height: 10),
                    _containerHeaderTiltleWidget('สินค้าแนะนำ','ดูทั้งหมด'),
                    _listViewSuggestCardWidget(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 10, right: 10, child: _appBarButton()),
          ]
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[ 
                    IconButton(
                      icon: const Icon(Icons.textsms_outlined, size: 30.0),
                      onPressed: () {
                        // Navigator.push(
                        //   context, MaterialPageRoute(builder: (context) => MyHomePage()));
                      },
                    ),
                    Text('แชท'),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CheckOutPage(title: 'เช็คเอาท์')));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blue[400],
                      ),
                      child: Center(
                        child: Text(
                          'ซื้อทันที',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(30, 65, 189, 1),
                          Color.fromRGBO(71, 87, 212, 1),
                          Color.fromRGBO(126, 83, 230, 1),
                          Color.fromRGBO(155, 94, 238, 1),
                        ],
                      )
                    ),
                    child: Center(
                      child: Text(
                        'เพิ่มลงรถเข็น',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}