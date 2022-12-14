import 'package:flutter/material.dart';
import 'package:marketapp/Widgets_Components/add_product_widgetcomponent.dart';

class Addproductwidget extends StatefulWidget {
  const Addproductwidget({Key? key}) : super(key: key);

  @override
  State<Addproductwidget> createState() => _AddproductwidgetState();
}

class _AddproductwidgetState extends State<Addproductwidget> {
  @override
  Widget build(BuildContext context) {
    return Addproductwidgetcomponent();
  }
}
