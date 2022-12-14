import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/Add_cart_API.dart';
import 'package:marketapp/API/WS_list_pro_API.dart';
import 'package:marketapp/Controllers/add_cart_controller.dart';
import 'package:marketapp/Models/wholesale_pro_list_model.dart';
import 'package:marketapp/Styles/textstyle.dart';
import 'package:marketapp/Widgets/search_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Hiwholesaleprolistwidgetcomponent extends StatefulWidget {
  @override
  HiwholesaleprolistwidgetcomponentState createState() =>
      HiwholesaleprolistwidgetcomponentState();
}

class HiwholesaleprolistwidgetcomponentState
    extends State<Hiwholesaleprolistwidgetcomponent> {
  List<Wholesaleprolistmodel> wsproductlists = [];

  List temparr = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    // print(widget.custid);
    super.initState();
    wsapicall();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future wsapicall() async {
    final wsproductlists = await WSProductlistapi.getProducts(context, query);

    setState(() => this.wsproductlists = wsproductlists);
  }

  Widget buildSearch() => WSSearchWidget(
        text: query,
        hintText: 'Search Wholesale Product Name',
        onChanged: searchProduct,
      );

  Future searchProduct(String query) async => debounce(() async {
        final wsproductlists =
            await WSProductlistapi.getProducts(context, query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.wsproductlists = wsproductlists;
        });
      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: WSProductlistapi.getProducts(context, query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                buildSearch(),
                wholesaleproductlist(),
              ],
            );
          }
        });
  }

  Widget wholesaleproductlist() {
    return Expanded(
      child: wsproductlists.isNotEmpty
          ? ListView.builder(
              itemCount: wsproductlists.length,
              itemBuilder: (context, index) {
                final wsdukan = wsproductlists[index];
                return product_list(wsdukan);
              },
            )
          : Center(
              child: Text(
                "No Item Found List",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }

  Widget product_list(Wholesaleprolistmodel wsdukan) => Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber.shade400,
                radius: 24,
                child: Text(
                  '${wsdukan.hindiname[0].toUpperCase()}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ), //Text
              ),
              title: Text(wsdukan.hindiname),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "\u{20B9} ${wsdukan.proprice.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Addcartproduct().addcartpro(context, wsdukan.proid, 1);
                      // setState(() {
                      //   _hasBeenPressed = !_hasBeenPressed;
                      // });
                      //  Hit API To Add Product in Cart
                    },
                    child: AutoSizeText(
                      "Add",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        // color: _hasBeenPressed ? Colors.blueGrey
                        //     : Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.blueGrey.withOpacity(0.34),
            ),
          ],
        ),
      );
}
