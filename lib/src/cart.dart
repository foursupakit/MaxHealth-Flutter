import 'package:flutter/material.dart';
import 'package:basicflutter/src/checkOut.dart';
import 'package:basicflutter/src/home.dart';
import 'package:basicflutter/src/account.dart';
import 'package:basicflutter/src/care.dart';

import 'package:flutter_cart/flutter_cart.dart';

import 'Utils/customTextStyle.dart';
import 'Utils/customUtils.dart';

import 'package:roundcheckbox/roundcheckbox.dart';

class SampleClass {
  var message;

  /// Creating the instance of flutter cart package.
  var cart = FlutterCart();

  /// sample function
  addToCart(dynamic _product) => {
        message = cart.addToCart(
            productId: _product.productId,
            unitPrice: _product.productPrice,
            quantity: _product.quantity,

            ///[uniqueCheck] is used to differentiate the type between item
            ///[e.g] the shirt sizes in (LARGE, MEDIUM, SMALL) the [Product ID] will remain same
            ///But if UUID is not present so, how we can differentiate between them? So in this case we will
            ///User the uniqueCheck
            uniqueCheck: _product.selectedProductType,

            ///[productDetailsObject] is used as a dump variable you can dump your object and any kind of data
            ///that you wanted use in future.
            productDetailsObject: _product),
      };

  /// This function is used to decrement the item quantity from cart
  removeItemFromCart(int index) => {
        cart.decrementItemFromCart(index),
      };

  /// This function is used to increment the item quantity into cart
  addItemToCart(int index) {
    cart.incrementItemToCart(index);
  }
}

void main() {
  var yourObject;
  SampleClass().addItemToCart(yourObject);
}

class Cart extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CartPage(title: 'Flutter Cart Page'),
    );
  }
}

class CartPage extends StatefulWidget {
  CartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _page = 2;

  void _onItemTapped(int page) {
    if (page == 2) {
      return;
    } else {
      setState(() {
        if (page == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (page == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CarePage()));
        } else if (page == 3) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
        }
      });
    }
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
              style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: (){
              //   Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: new Text(subtitle,
              style: new TextStyle(color: Colors.grey))
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardWidget(String image, String title, String subtitle, String price, String priceDiscount, {bool isRecommended = false, bool isDiscount = false}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      child: GestureDetector(
        onTap: (){
          // Navigator.push(
          //   context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(price + '  ', style: TextStyle(color: Colors.red)),
                            Text(priceDiscount, style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough))                          
                          ],                               
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
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
                            child: Text("เพิ่มลงรถเข็น",style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        )
                      ],
                    )
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
            ]
          ]
        )
      )  
    );
  }

  Widget _listViewSuggestCardWidget() {
    return Container(
      height: 340,
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

  Widget _resultWidget() {
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
                Row(
                  children: [
                    Text(
                      'ค่าจัดส่ง : ',
                      style: new TextStyle(color: Colors.black.withOpacity(0.6))
                    ),
                    Text(
                      '฿0',
                      style: new TextStyle(color: Colors.black.withOpacity(0.6))
                    ),
                  ]
                ),
                Row(
                  children: [
                    Text(
                      'ยอดรวมทั้งหมด : ',
                      style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                    ),
                    Text(
                      '฿0',
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
                    context, MaterialPageRoute(builder: (context) => CheckOutPage(title: 'เช็คเอาท์')));
                }
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _containerHeaderAddToCartTiltleWidget(String title) {
    return Container(
      // color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Text(title,
              style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listViewAddtoCartWidget() {
    return Container(
      height: 130,
      color: Colors.white,
      child: _createCartList(),
    );
  }

  Widget _createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return _createCartListItem();
      },
      itemCount: 1,
    );
  }

  Widget _createCartListItem() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              RoundCheckBox(  
                onTap: (selected) {},
                size: 30,
                checkedColor: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.green.shade200,            
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.fitWidth
                  )
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          "NIKE XTM Basketball Shoeas",
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        "Green M",
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "\$3,690.00",
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.blue),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      "1",
                                      style:
                                          CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: Container(
        //     width: 24,
        //     height: 24,
        //     alignment: Alignment.center,
        //     margin: EdgeInsets.only(right: 10, top: 8),
        //     child: Icon(
        //       Icons.close,
        //       color: Colors.white,
        //       size: 20,
        //     ),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(4)),
        //         color: Colors.green),
        //   ),
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('รถเข็น',
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
        ),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.grey[300],
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _containerHeaderAddToCartTiltleWidget('เลือกทั้งหมด'),
                    _listViewAddtoCartWidget(),
                     Container(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('ลบ',
                              style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _containerHeaderTiltleWidget('ประวัติการซื้อของฉัน','ดูทั้งหมด'),
                    _listViewSuggestCardWidget(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  ]
                )
              )
            ),
            Positioned(
              bottom: 0,  
              child: Container(
                color: Colors.white,
                child: _resultWidget()
              )
            ),
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