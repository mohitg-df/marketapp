import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/Add_cart_API.dart';
import 'package:marketapp/API/R_list_pro_API.dart';
import 'package:marketapp/Models/retail_pro_list_model.dart';
import 'package:marketapp/Styles/textstyle.dart';
import 'package:marketapp/Widgets/search_widget.dart';

class Hiretailprolistwidgetcomponent extends StatefulWidget {
  @override
  HiretailprolistwidgetcomponentState createState() =>
      HiretailprolistwidgetcomponentState();
}

class HiretailprolistwidgetcomponentState
    extends State<Hiretailprolistwidgetcomponent> {
  List<Retailprolistmodel> rproductlists = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    rapicall();
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

  Future rapicall() async {
    final productlists = await RProductlistapi.getProducts(context, query);

    setState(() => this.rproductlists = productlists);
  }

  Widget buildSearch() => WSSearchWidget(
        text: query,
        hintText: 'Search Retail Product Name',
        onChanged: searchProduct,
      );

  Future searchProduct(String query) async => debounce(() async {
        final productlists = await RProductlistapi.getProducts(context, query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.rproductlists = productlists;
        });
      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RProductlistapi.getProducts(context, query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                buildSearch(),
                retailproductlist(),
              ],
            );
          }
        });
  }

  Widget retailproductlist() {
    return Expanded(
      child: rproductlists.isNotEmpty
          ? ListView.builder(
              itemCount: rproductlists.length,
              itemBuilder: (context, index) {
                final rdukan = rproductlists[index];
                return InkWell(
                  onTap: () {
                    Addcartproduct().addcartpro(context, rdukan.rproid, 1);
                  },
                  child: product_list(rdukan),
                );
              },
            )
          : Center(
              child: Text(
                "No Item Found In Cart",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 10 * MediaQuery.of(context).size.width * 0.001,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }

  Widget product_list(Retailprolistmodel rdukan) => Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber.shade400,
                radius: 24,
                child: Text(
                  '${rdukan.rhindiname[0].toUpperCase()}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ), //Text
              ),
              title: Text(rdukan.rhindiname.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "\u{20B9} ${rdukan.rproprice.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Addcartproduct().addcartpro(context, rdukan.rproid, 1);
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
