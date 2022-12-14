import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/Add_cart_API.dart';
import 'package:marketapp/API/Get_Fav_pro_API.dart';
import 'package:marketapp/Models/fav_pro_model.dart';

class Homeproductlistwidgetcomponent extends StatefulWidget {
  const Homeproductlistwidgetcomponent({Key? key}) : super(key: key);

  @override
  State<Homeproductlistwidgetcomponent> createState() =>
      _HomeproductlistwidgetcomponentState();
}

class _HomeproductlistwidgetcomponentState
    extends State<Homeproductlistwidgetcomponent> {
  List<Favprolistmodel> allproductlists = [];

  List temparr = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    // print(widget.custid);
    super.initState();
    allproapicall();
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

  Future allproapicall() async {
    final allproductlists = await Favproductlistapi.favallpro(context, query);

    setState(
      () => this.allproductlists = allproductlists,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (_, orientation) {
      if (orientation == Orientation.portrait)
        return FutureBuilder(
            future: Favproductlistapi.favallpro(context, query),
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
                        allproapicall();
                        // print("Pull to Refresh the list");
                      });
                    });
                  },
                  child: Portraitmode(),
                );
              }
            });
          // Portraitmode(); // if orientation is portrait, show your portrait layout
      else
        return FutureBuilder(
            future: Favproductlistapi.favallpro(context, query),
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
                        allproapicall();
                        // print("Pull to Refresh the list");
                      });
                    });
                  },
                  child: Landscapemode(),
                );
              }
            });
    });
  }

  Widget Portraitmode(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0,),
      child: Column(
        children: [
          Expanded(
            child: allproductlists.isNotEmpty
                ? Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: allproductlists.length,
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 0.5,
                      childAspectRatio: 0.8,
                    ),
                    // scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final alldukan = allproductlists[index];
                      return product_list(alldukan);
                    },
                  ),
                ),
              ],
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

  Widget Landscapemode(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Expanded(
            child: allproductlists.isNotEmpty
                ? Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: allproductlists.length,
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 0.1,
                      childAspectRatio: 0.8,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final alldukan = allproductlists[index];
                      return product_list(alldukan);
                    },
                  ),
                ),
              ],
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

  Widget product_list(Favprolistmodel alldukan) => Column(
    children: [
      Card(
        elevation: 5.0,
        child: Container(
          padding:
          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                "${alldukan.protype}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.amber.shade400,
                radius: 40,
                child: Text(
                  '${alldukan.proname![0].toUpperCase()}',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              AutoSizeText(
                "${alldukan.proname}",
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "\u{20B9} ${alldukan.proprice}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Addcartproduct()
                            .addcartpro(context, alldukan.proid, 1);
                      });
                    },
                    child: AutoSizeText(
                      "Add",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
