import 'package:flutter/material.dart';

class ProductDetailInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProductDetailInfo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ProductDetailInfoPage(title: 'Flutter ProductDetailInfo Page'),
    );
  }
}

class ProductDetailInfoPage extends StatefulWidget {
  ProductDetailInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProductDetailInfoPageState createState() => _ProductDetailInfoPageState();
}

class _ProductDetailInfoPageState extends State<ProductDetailInfoPage> {
  Widget _cardWidget(String image, String title) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
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
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                      child: Row(
                        children: <Widget>[
                          Text('รายละเอียดสินค้า', style: TextStyle(fontSize: 13)),
                        ]
                      ),
                    ),
                    _cardWidget('assets/images/background.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'),
                    SizedBox(height: 10),
                    _cardWidget('assets/images/background.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'),
                    SizedBox(height: 10),
                    _cardWidget('assets/images/background.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'),
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