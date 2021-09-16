import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_shop/model/Users.dart';
import 'package:flutter_shop/pages/CartPage.dart';
import 'package:flutter_shop/utils/Manager.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String get date => null;

  String get image => null;

  String get description => null;

  String get id => null;

  String get ownerId => null;

  String get price => null;

  String get name => null;

  String get category => null;

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(),
      home: detailsPage(id, image, description, date, name, price, category,
          ownerId, context),
    );
  }
}

Widget detailsPage(String id, String image, String description, String date,
    String name, String price, String category, String ownerId, BuildContext context) {
  return NeumorphicTheme(
    theme: NeumorphicThemeData(
      defaultTextColor: Color(0xFF3E3E3E),
      accentColor: Colors.grey,
      variantColor: Colors.black38,
      depth: 8,
      intensity: 0.65,
    ),
    themeMode: ThemeMode.light,
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Material(
        child: NeumorphicBackground(
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 350,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape:
                            NeumorphicBoxShape.roundRect(BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                      ),
                      child: Image.network(image, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 26,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Rating(),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    r"$",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 32,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    price,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 32,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text("Saint-Petersburg, Russia",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.black45)),
                        SizedBox(height: 4.0),
                        Text(
                          "Category: $category",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(height: 22.0),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8.0),

                        Container(
                          width: double.infinity,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              depth: -15,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 64),
                              child: Text(
                                description,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NeumorphicButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                        'Item has been added to the cart', style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),),
                                    content: const Text(
                                        'Do you want to continue shopping?', style: TextStyle(
                                      color: Colors.black45,
                                    ),),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => getUiDc(
                                            id,
                                            context,
                                            Manager(),
                                            ownerId,
                                            image,
                                            description,
                                            date,
                                            name,
                                            price,
                                            category),
                                        child: const Text('Home'),
                                      ),
                                      TextButton(
                                        onPressed: () => getUiDc(
                                            id,
                                            context,
                                            CartPage(),
                                            ownerId,
                                            image,
                                            description,
                                            date,
                                            name,
                                            price,
                                            category),
                                        child: const Text('Cart'),
                                      ),
                                    ],
                                  ),
                                ),
                                // () => getUiDc(id, ownerId, image,
                                // description, date, name, price, category),
                                // Fluttertoast.showToast(
                                // msg: "Product has been added to cart",
                                // toastLength: Toast.LENGTH_SHORT,
                                // gravity: ToastGravity.BOTTOM,
                                // timeInSecForIosWeb: 1,
                                // backgroundColor: Colors.tealAccent,
                                // textColor: Colors.blueGrey,
                                // fontSize: 16.0),
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    ),
  );
}

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  var _rating = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStars(),
      ],
    );
  }

  Row _buildStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) => _buildStar(rating: index + 1)),
    );
  }

  IconButton _buildStar({int rating}) {
    var _isEnable = _rating >= rating;
    return IconButton(
      icon: _isEnable ? Icon(Icons.star) : Icon(Icons.star_border),
      color: _isEnable ? Colors.yellow : Colors.grey,
      iconSize: 22,
      onPressed: () {
        _changeRating(rating);
      },
    );
  }

  void _changeRating(int newRating) {
    setState(() {
      _rating = newRating;
    });
  }
}

void getUiDd(String ownerId) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user = await auth.currentUser();
  String buyerId = user.uid;

  saveToDialogDatabase(ownerId, buyerId);
}

void saveToDialogDatabase(String ownerId, String buyerId) {
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  var data = {
    "ownerId": ownerId,
  };

  ref.child("Dialogs").child(buyerId).push().set(data);
}

void getUiDc(String id, BuildContext context, Widget page, String ownerId, String image, String description,
    String date, String name, String price, String category) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user = await auth.currentUser();
  String buyerId = user.uid;

  DatabaseReference userRef =
      FirebaseDatabase.instance.reference().child("Users").child(buyerId);

  userRef.once().then((DataSnapshot snap) {
    var KEYS = snap.value.keys;
    var DATA = snap.value;

    for (var key in KEYS) {
      print("Key of KEYS: " + key);
      print("Key of snapshot: " + snap.key);

      Users users = new Users(
          key,
          DATA[key]['firstName'],
          DATA[key]['gender'],
          DATA[key]['image'],
          DATA[key]['lastName'],
          DATA[key]['uId'],
          DATA[key]['bio'],
          DATA[key]['address'],
          DATA[key]['phone']);

      String firstName = users.firstName;
      String lastName = users.lastName;
      String bImage = users.image;

      saveToCartDatabase(id, context, page, ownerId, image, description, date, name, price,
          category, buyerId, firstName, lastName, bImage);
    }
  });
}

void saveToCartDatabase(
  String id,
  BuildContext context,
  Widget page,
  String ownerId,
  String image,
  String description,
  String date,
  String name,
  String price,
  String category,
  String buyerId,
  String firstName,
  String lastName,
  String bImage,
) {
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  var ordersData = {
    "ownerId": ownerId,
    "buyerId": buyerId,
    "firstName": firstName,
    "lastName": lastName,
    "bImage": bImage,
    "image": image,
    "description": description,
    "date": date,
    "price": price,
    "name": name,
    "category": category
  };

  var cartData = {
    "ownerId": ownerId,
    "image": image,
    "description": description,
    "date": date,
    "price": price,
    "name": name,
    "category": category
  };
  ref.child("Orders").child(ownerId).push().set(ordersData);
  ref.child("Cart").child(buyerId).push().set(cartData);

  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => page));

}
