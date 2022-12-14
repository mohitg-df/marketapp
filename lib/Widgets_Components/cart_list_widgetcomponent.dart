import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/Checkout_API.dart';
import 'package:marketapp/API/cart_item_delete_API.dart';
import 'package:marketapp/API/cart_item_update_API.dart';
import 'package:marketapp/API/cart_list_API.dart';
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/API/pdf_api.dart';
import 'package:marketapp/API/pdf_invoice_api.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Models/cart_model.dart';
import 'package:marketapp/Models/customer.dart';
import 'package:marketapp/Models/invoice.dart';
import 'package:marketapp/Models/supplier.dart';
import 'package:marketapp/Screens/en_invoice_screen.dart';
import 'package:marketapp/Screens/hi_invoice_screen.dart';
import 'package:marketapp/Screens/labour_invoice_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Cartlistwidgetcomponent extends StatefulWidget {
  @override
  CartlistwidgetcomponentState createState() => CartlistwidgetcomponentState();
}

class CartlistwidgetcomponentState extends State<Cartlistwidgetcomponent> {
  List<InvoiceItem> invoicelist = [];

  List<CartModel> productlists = [];
  List temparr = [];
  String query = '';
  Timer? debouncer;
  bool _isLoading = false;
  dynamic sum = 0;
  dynamic clear;
  late Timer timer;
  late Future fetchalbum;
  bool clearcartdata = false;

  Future getgrandtotal() async {
    if (tokenapistatus == 200) {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearertoken'
      };
      var request = http.Request('GET', Uri.parse('$baseurl/user/totalamount'));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 201) {
        var data = jsonDecode(await response.stream.bytesToString());
        sum = data["totalCost"];
        // print(grandtotal);
      } else {
        print(response.reasonPhrase);
      }
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Authentication Failed"),
          content: const Text("Token Expire"),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/Homescreen"),
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }
  }

  Future clearallcart() async {
    if (tokenapistatus == 200) {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearertoken'
      };
      var request = http.Request('GET', Uri.parse('$baseurl/user/delete/cart'));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      clearcartdata = jsonDecode(await response.stream.bytesToString());
      switch (response.statusCode) {
        case 201:
          print("Clear Cart Data => $clearcartdata");
          setState(() {
            cartapicall();
            getgrandtotal();
          });
          break;

        default:
          // print(clearcartdata);
          break;
      }
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Authentication Failed"),
          content: const Text("Token Expire"),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/Homescreen"),
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    cartapicall();
    getgrandtotal();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void SetState() {}

  Future cartapicall() async {
    final productlists = await cartapi.getcart(context, query);

    setState(() => this.productlists = productlists);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cartapi.getcart(context, query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    cartapicall();
                    getgrandtotal();
                    // print("Pull to Refresh the list");
                  });
                });
              },
              child: cartproductlist(),
            );
          }
        });
  }

  Widget cartproductlist() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // clearallcart();
                      productlists.isNotEmpty ? clearallcart() : null;
                    });
                  },
                  child: AutoSizeText(
                    "Clear All",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              AutoSizeText(
                "Grand Total \u{20B9} $sum", //$sum
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 2 * MediaQuery.of(context).size.height * 0.01,
            child: const Divider(
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
            child: productlists.isNotEmpty
                ? ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: productlists.length,
                    itemBuilder: (context, index) {
                      final dukan = productlists[index];
                      return product_list(dukan);
                    },
                  )
                : const Center(
                    child: Text(
                      "No Item Found In Cart",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.blueGrey.withOpacity(0.65),
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black38,
                    barrierLabel: 'Label',
                    barrierDismissible: true,
                    pageBuilder: (_, __, ___) => button(),
                  );
                  // PersistentNavBarNavigator.pushNewScreen(
                  //   context,
                  //   screen: Invoicescreen(),
                  //   // withNavBar: true, // OPTIONAL VALUE. True by default.
                  //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  // );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Invoicescreen()),
                  // );
                });
              },
              child: const AutoSizeText(
                "CheckOut",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget product_list(CartModel dukan) {
    var totalproductamount = dukan.productPrize! * dukan.quantity!;

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          // right: 10.0,
          top: 5.0,
          bottom: 5.0,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                dukan.productname.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "\u{20B9} ${totalproductamount.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 5, right: 5),
                    child: CartStepperInt(
                      value: dukan.quantity,
                      style: CartStepperStyle.fromTheme(
                        Theme.of(context),
                        // radius: const Radius.circular(3),
                        shape: BoxShape.rectangle,
                      ),
                      size: 30,
                      didChangeCount: (count) {
                        if (count < 1) {
                          Cartdeleteitem.deletecartitem(context, dukan.id);
                          Future.delayed(Duration(milliseconds: 500), () {
                            setState(() {
                              cartapicall();
                              getgrandtotal();
                            });
                          });
                          return;
                        }
                        setState(() {
                          dukan.quantity = count;
                          Cartitemupdate.cartitemupdate(
                            context,
                            dukan.id,
                            count,
                          );
                          Future.delayed(Duration(milliseconds: 500), () {
                            setState(() {
                              cartapicall();
                              getgrandtotal();
                            });
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 3.0 * MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, //.shade400, //Colors.amber.withOpacity(0.65),
            ),
            child: MaterialButton(
              onPressed: () {
                // Call Controller Here
                setState(() {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: Invoicescreen(),
                    // withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                });
              },
              child: AutoSizeText(
                "English Print",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 3.0 * MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,//Colors.blueGrey.withOpacity(0.65),
            ),
            child: MaterialButton(
              onPressed: () {
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: HIinvoicescreen(),
                //   // withNavBar: true, // OPTIONAL VALUE. True by default.
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
                // Call Controller Here
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HIinvoicescreen()),
                  );
                });
              },
              child: AutoSizeText(
                "Hindi Print",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 3.0 * MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,//Colors.blueGrey.withOpacity(0.65),
            ),
            child: MaterialButton(
              onPressed: () {
                // Call Controller Here
                setState(() {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: Lobourinvoicescreen(),
                    // withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                });
              },
              child: AutoSizeText(
                "Labour Print",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
