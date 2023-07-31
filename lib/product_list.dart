import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<String> ProductName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Cherry',
    'Peach',
    'Mixed Fruits juice'
  ];
  List<String> ProductUnit = ['KG', 'KG', 'Kg', 'Dozen', 'KG', 'KG', 'item'];
  List<int> ProductPrice = [120, 130, 200, 160, 140, 80, 100];
  List<String> ProductImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mobile Shopping",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: const <Widget>[
          Center(
            child: badges.Badge(
              badgeContent: Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: ProductName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image(
                                height: 100,
                                width: 100,
                                image: NetworkImage(
                                    ProductImage[index].toString())),
                            Text(index.toString())
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
