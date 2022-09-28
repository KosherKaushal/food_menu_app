import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modal/product.dart';
import 'package:untitled/androidDialog.dart';
import 'package:untitled/previousOrder.dart';
import 'package:untitled/restaurantCard.dart';
import 'package:untitled/uiAssistance.dart';

import 'bestsellerCard.dart';
import 'iosDialog.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemCount = 0;
  int itemCount1 = 0;
  int itemCount2 = 0;
  int itemCount3 = 0;
  int itemCount4 = 0;
  int itemCount5 = 0;
  int itemCount6 = 0;

  List<Product> product = [];

  int finalAmount = 0;
  int finalAmount1 = 0;
  int finalAmount2 = 0;
  int finalAmount3 = 0;
  int finalAmount4 = 0;
  int finalAmount5 = 0;
  int finalAmount6 = 0;

  bool isOrderPlaced = false;

  @override
  Widget build(BuildContext context) {
    var totalAmount = finalAmount +
        finalAmount1 +
        finalAmount2 +
        finalAmount3 +
        finalAmount4 +
        finalAmount5 +
        finalAmount6;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CupertinoNavigationBar(
        middle: Text('Food Menu App'),
      ),
      persistentFooterButtons: <Widget>[
        ListTile(
          title: Text(
            'Total amount',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          enabled: itemCount == 0 &&
                  itemCount1 == 0 &&
                  itemCount2 == 0 &&
                  itemCount3 == 0 &&
                  itemCount4 == 0 &&
                  itemCount5 == 0 &&
                  itemCount6 == 0
              ? false
              : true,
          subtitle: Text(
            "\u{20B9}$totalAmount",
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: 17.0),
          ),
          trailing: Text(
            'Place Order',
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: 17.0),
          ),
          tileColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          visualDensity: VisualDensity.compact,
          minVerticalPadding: 0.0,
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pop(true);
                  });
                  return Platform.isIOS
                      ? const IOSDialog(
                          message: 'Order Placed!',
                          icon: CupertinoIcons.checkmark,
                        )
                      : const AndroidDialog(
                          message: 'Order Placed!',
                          icon: Icons.check,
                        );
                });
            setState(() {
              finalAmount = 0;
              finalAmount1 = 0;
              finalAmount2 = 0;
              finalAmount3 = 0;
              finalAmount4 = 0;
              finalAmount5 = 0;
              finalAmount6 = 0;
              itemCount = 0;
              itemCount1 = 0;
              itemCount2 = 0;
              itemCount3 = 0;
              itemCount4 = 0;
              itemCount5 = 0;
              itemCount6 = 0;
              isOrderPlaced = true;
            });
          },
        )
      ],
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          // physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: RestaurantCard(),
                ),
                Visibility(
                    visible: isOrderPlaced == true ? true : false,
                    child: UIAssistance.verticalSpaceSmall()),
                Visibility(
                  visible: isOrderPlaced == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Previously Ordered Items',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                UIAssistance.verticalSpaceSmall(),
                Visibility(
                  visible: isOrderPlaced == true ? true : false,
                  child: ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PreviousOrder(
                            name: product[i].title,
                            price: product[i].price,
                            quantity: product[i].quantity),
                      );
                    },
                    itemCount: product.length,
                  ),
                ),
                UIAssistance.verticalSpaceSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Popular items',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                UIAssistance.verticalSpaceMedium(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BestsellerCard(
                    price: 229,
                    iconData: CupertinoIcons.star_fill,
                    visibility: true,
                    itemName: 'Corn & Peas Sandwich',
                    reviews: 21,
                    id: '',
                    addButton: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///minus
                        itemCount != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount--;
                                  });
                                  var totalPrice = 229 * itemCount;
                                  finalAmount = totalPrice;
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  CupertinoIcons.minus_square_fill,
                                  size: 28.0,
                                ))
                            : Container(),

                        ///increment text
                        Text(
                          itemCount.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                        ///plus
                        IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount++;
                              });
                              var totalPrice = 229 * itemCount;
                              finalAmount = totalPrice;
                              product.add(Product(
                                  title: 'Corn & Peas Sandwich',
                                  quantity: itemCount,
                                  price: finalAmount));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              CupertinoIcons.plus_square_fill,
                              size: 28.0,
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BestsellerCard(
                    price: 210,
                    iconData: CupertinoIcons.star_fill,
                    visibility: false,
                    itemName: 'Veg Delight Sandwich',
                    reviews: 63,
                    addButton: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///minus
                        itemCount1 != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount1--;
                                  });
                                  var totalPrice = 210 * itemCount1;
                                  finalAmount1 = totalPrice;
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  CupertinoIcons.minus_square_fill,
                                  size: 28.0,
                                ))
                            : Container(),

                        ///increment text
                        Text(
                          itemCount1.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                        ///plus
                        IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount1++;
                              });
                              var totalPrice = 210 * itemCount1;
                              finalAmount1 = totalPrice;
                              product.add(Product(
                                  title: 'Veg Delight Sandwich',
                                  quantity: itemCount1,
                                  price: finalAmount1));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              CupertinoIcons.plus_square_fill,
                              size: 28.0,
                            )),
                      ],
                    ),
                    id: '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BestsellerCard(
                    price: 252,
                    iconData: CupertinoIcons.star_fill,
                    visibility: true,
                    itemName: 'Veg Seekh Salad',
                    reviews: 8,
                    addButton: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///minus
                        itemCount2 != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount2--;
                                  });
                                  var totalPrice = 252 * itemCount2;
                                  finalAmount2 = totalPrice;
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  CupertinoIcons.minus_square_fill,
                                  size: 28.0,
                                ))
                            : Container(),

                        ///increment text
                        Text(
                          itemCount2.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                        ///plus
                        IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount2++;
                              });
                              var totalPrice = 252 * itemCount2;
                              finalAmount2 = totalPrice;
                              product.add(Product(
                                  title: 'Veg Seekh Salad',
                                  quantity: itemCount2,
                                  price: finalAmount2));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              CupertinoIcons.plus_square_fill,
                              size: 28.0,
                            )),
                      ],
                    ),
                    id: '',
                  ),
                ),
                UIAssistance.verticalSpaceSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Breakfast Sandwiches',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                UIAssistance.verticalSpaceSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BestsellerCard(
                    price: 181,
                    iconData: CupertinoIcons.star_fill,
                    visibility: false,
                    itemName: 'Egg & Cheese Sandwich',
                    reviews: 9,
                    id: '',
                    addButton: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///minus
                        itemCount3 != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount3--;
                                  });
                                  var totalPrice = 181 * itemCount3;
                                  finalAmount3 = totalPrice;
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  CupertinoIcons.minus_square_fill,
                                  size: 28.0,
                                ))
                            : Container(),

                        ///increment text
                        Text(
                          itemCount3.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                        ///plus
                        IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount3++;
                              });
                              var totalPrice = 181 * itemCount3;
                              finalAmount3 = totalPrice;
                              product.add(Product(
                                  title: 'Egg & Cheese Sandwich',
                                  quantity: itemCount3,
                                  price: finalAmount3));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              CupertinoIcons.plus_square_fill,
                              size: 28.0,
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BestsellerCard(
                    price: 200,
                    iconData: CupertinoIcons.star_fill,
                    visibility: false,
                    itemName: 'Chicken Slice, Egg & Cheese Sandwich',
                    reviews: 10,
                    id: '',
                    addButton: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///minus
                        itemCount4 != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount4--;
                                  });
                                  var totalPrice = 200 * itemCount4;
                                  finalAmount4 = totalPrice;
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  CupertinoIcons.minus_square_fill,
                                  size: 28.0,
                                ))
                            : Container(),

                        ///increment text
                        Text(
                          itemCount4.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                        ///plus
                        IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount4++;
                              });
                              var totalPrice = 200 * itemCount4;
                              finalAmount4 = totalPrice;
                              product.add(Product(
                                  title: 'Chicken Slice, Egg & Cheese Sandwich',
                                  quantity: itemCount4,
                                  price: finalAmount4));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              CupertinoIcons.plus_square_fill,
                              size: 28.0,
                            )),
                      ],
                    ),
                  ),
                ),
                UIAssistance.verticalSpaceSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Salads',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                UIAssistance.verticalSpaceSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BestsellerCard(
                    price: 252,
                    iconData: CupertinoIcons.star_fill,
                    visibility: true,
                    itemName: 'Mexican Patty Salad',
                    reviews: 12,
                    id: '',
                    addButton: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///minus
                        itemCount5 != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount5--;
                                  });
                                  var totalPrice = 252 * itemCount5;
                                  finalAmount5 = totalPrice;
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  CupertinoIcons.minus_square_fill,
                                  size: 28.0,
                                ))
                            : Container(),

                        ///increment text
                        Text(
                          itemCount5.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                        ///plus
                        IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount5++;
                              });
                              var totalPrice = 252 * itemCount5;
                              finalAmount5 = totalPrice;
                              product.add(Product(
                                  title: 'Mexican Patty Salad',
                                  quantity: itemCount5,
                                  price: finalAmount5));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              CupertinoIcons.plus_square_fill,
                              size: 28.0,
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BestsellerCard(
                    price: 267,
                    iconData: CupertinoIcons.star_fill,
                    visibility: false,
                    itemName: 'Tandoori Tofu Salad',
                    reviews: 10,
                    addButton: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///minus
                        itemCount6 != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemCount6--;
                                  });
                                  var totalPrice = 267 * itemCount6;
                                  finalAmount6 = totalPrice;
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: const Icon(
                                  CupertinoIcons.minus_square_fill,
                                  size: 28.0,
                                ))
                            : Container(),

                        ///increment text
                        Text(
                          itemCount6.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                        ///plus
                        IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount6++;
                              });
                              var totalPrice = 267 * itemCount6;
                              finalAmount6 = totalPrice;
                              product.add(Product(
                                  title: 'Tandoori Tofu Salad',
                                  quantity: itemCount6,
                                  price: finalAmount6));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              CupertinoIcons.plus_square_fill,
                              size: 28.0,
                            )),
                      ],
                    ),
                    id: '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
