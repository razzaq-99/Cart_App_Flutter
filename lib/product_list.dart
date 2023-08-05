import 'package:badges/badges.dart' as badges;
import 'package:cart_app/cart_model.dart';
import 'package:cart_app/cart_provider.dart';
import 'package:cart_app/cart_screen.dart';
import 'package:cart_app/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  DBHelper? dbHelper = DBHelper();

  List<String> ProductName = [
    'Iphone X',
    'Iphone 8+',
    'Iphone 7+',
    'Iphone 11 Pro',
    'Iphone 14 Pro',
    'Samsung S23 ultra',
    'Google Pixel 6 Pro'
  ];
  List<String> ProductUnit = ['price', 'price', 'price', 'price', 'price', 'price', 'price'];
  List<int> ProductPrice = [200, 300, 210, 512, 680, 660, 1000];
  List<String> ProductImage = [
    'https://www.shutterstock.com/image-photo/riga-latvia-march-25-2018-latest-1054927790',
    'https://www.shutterstock.com/image-photo/kyiv-ukraine-january-24-2018-front-1016925994',
    'https://www.shutterstock.com/image-photo/new-york-usa-december-28-2016-549209350',
    'https://www.shutterstock.com/image-illustration/new-york-usa-november-24-2019-1570823752',
    'https://www.shutterstock.com/image-photo/antalya-turkey-september-08-2022-newly-2199111735',
    'https://www.shutterstock.com/image-vector/realistic-vector-flat-mock-samsung-galaxy-2259804073',
    'https://www.shutterstock.com/image-photo/shenzhen-china-31-october-2021-google-2067563567',
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mobile Shopping",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Center(
              child: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.getCounter().toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: ProductName.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                  height: 100,
                                  width: 100,
                                  image: NetworkImage(
                                      ProductImage[index].toString())),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ProductName[index].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      ProductUnit[index].toString() +
                                          "  " +
                                          r"$" +
                                          ProductPrice[index].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          dbHelper!
                                              .insert(Cart(
                                                  id: index,
                                                  productId: index.toString(),
                                                  productName:
                                                      ProductName[index]
                                                          .toString(),
                                                  InitialPrice:
                                                      ProductPrice[index],
                                                  ProductPrice:
                                                      ProductPrice[index],
                                                  Quantity: 1,
                                                  unitTag: ProductUnit[index]
                                                      .toString(),
                                                  image: ProductImage[index]
                                                      .toString()))
                                              .then((value) {
                                            print("Product is added to cart");
                                            cart.addTotalPrice(double.parse(
                                                ProductPrice[index]
                                                    .toString()));
                                            cart.addCounter();
                                          }).onError((error, stackTrace) {
                                            print(error.toString());
                                          });
                                        },
                                        child: Container(
                                          height: 29,
                                          width: 85,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}

