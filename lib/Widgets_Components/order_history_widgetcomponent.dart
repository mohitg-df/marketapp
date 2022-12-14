import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/Order_History_API.dart';
import 'package:marketapp/API/WS_list_pro_API.dart';
import 'package:marketapp/Models/order_hist_model.dart';
import 'package:marketapp/Widgets/search_widget.dart';

class Orderhistwidgetcomponent extends StatefulWidget {
  @override
  OrderhistwidgetcomponentState createState() =>
      OrderhistwidgetcomponentState();
}

class OrderhistwidgetcomponentState extends State<Orderhistwidgetcomponent> {
  List<OrderHistModel> orderhist = [];

  List temparr = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    // print(widget.custid);
    super.initState();
    orderhistapicall();
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

  Future orderhistapicall() async {
    final orderhist = await Orderhistory.orderhist(context, query);

    setState(
      () => this.orderhist = orderhist,
    );
  }

  Widget buildSearch() => WSSearchWidget(
        text: query,
        hintText: 'Search Your Order Here',
        onChanged: searchProduct,
      );

  Future searchProduct(String query) async => debounce(() async {
        final orderhist = await Orderhistory.orderhist(context, query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.orderhist = orderhist;
        });
      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Orderhistory.orderhist(context, query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    orderhistapicall();
                    // print("Pull to Refresh the list");
                  });
                });
              },
              child: ordertlist(),
            );
          }
        });
  }

  Widget ordertlist() {
    return Scaffold(
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: orderhist.isNotEmpty
                ? ListView.builder(
                    itemCount: orderhist.length,
                    itemBuilder: (context, index) {
                      final orderlist = orderhist[index];
                      return product_list(orderlist);
                    },
                  )
                : Center(
                    child: AutoSizeText(
                      "No Item Found List",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget product_list(OrderHistModel orderhist) => Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber.shade400,
                radius: 24,
                child: Text(
                  '${orderhist.productname![0].toUpperCase()}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ), //Text
              ),
              title: AutoSizeText("Delivered"),
              subtitle: AutoSizeText("${orderhist.productname.toString()}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
              ),
              trailing: IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
            Divider(
              color: Colors.blueGrey.withOpacity(0.34),
            ),
          ],
        ),
      );
}
