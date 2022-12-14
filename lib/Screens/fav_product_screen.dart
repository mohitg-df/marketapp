import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/Get_Fav_pro_API.dart';
import 'package:marketapp/API/get_all_pro_API.dart';
import 'package:marketapp/Hindi_Widgets_Component/hi_home_product_list_widgetcomponent.dart';
import 'package:marketapp/Widgets_Components/home_product_list_widgetcomponent.dart';
import 'package:marketapp/Widgets_Components/wholseale_list_widgetcomponent.dart';

class Allproductscreen extends StatefulWidget {
  const Allproductscreen({Key? key}) : super(key: key);

  @override
  State<Allproductscreen> createState() => _AllproductscreenState();
}

class _AllproductscreenState extends State<Allproductscreen> {
  String query = '';

  @override
  void initState() {
    Favproductlistapi.favallpro(context, query);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Favproductlistapi.favallpro(context, query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return allproducctwidget();
          }
        });
  }

  Widget allproducctwidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText("Favourite Products",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black12,
          ),
          Expanded(
            child: Homeproductlistwidgetcomponent(),
          ),
        ],
      ),
    );
  }
}

class Hiallproductscreen extends StatefulWidget {
  const Hiallproductscreen({Key? key}) : super(key: key);

  @override
  State<Hiallproductscreen> createState() => _HiallproductscreenState();
}

class _HiallproductscreenState extends State<Hiallproductscreen> {
  String query = '';

  @override
  void initState() {
    Favproductlistapi.favallpro(context, query);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Favproductlistapi.favallpro(context, query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return allproducctwidget();
          }
        });
  }

  Widget allproducctwidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText("Favourite Products",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black12,
          ),
          Expanded(
            child: Hihomeproductlistwidgetcomponent(),
          ),
        ],
      ),
    );
  }
}
