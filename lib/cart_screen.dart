import 'package:cart_app/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'cart_model.dart';
import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Selected items",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: <Widget>[
          Center(
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
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image(
                                            height: 100,
                                            width: 100,
                                            image: NetworkImage(snapshot
                                                .data![index].image
                                                .toString())),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot.data![index]
                                                        .productName
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        dbHelper!.delete(
                                                            snapshot
                                                                .data![index]
                                                                .id!);
                                                        cart.removeCounter();
                                                        cart.removeTotalPrice(
                                                            double.parse(snapshot
                                                                .data![index]
                                                                .ProductPrice
                                                                .toString()));
                                                      },
                                                      child: Icon(Icons.delete))
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                snapshot.data![index].unitTag
                                                        .toString() +
                                                    "  " +
                                                    r"$" +
                                                    snapshot.data![index]
                                                        .ProductPrice
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 29,
                                                    width: 85,
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "Add to cart",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color:
                                                                Colors.white),
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
                          }));
                } else {
                  return Text('');
                }
              }),
          Consumer<CartProvider>(builder: (context, value, child) {
            return Visibility(
              visible: value.getTotalPrice().toStringAsFixed(2) == '0.00'
                  ? false
                  : true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReusableWidget(
                        title: 'sub total : ',
                        value: r'$' + value.getTotalPrice().toStringAsFixed(2)),
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
