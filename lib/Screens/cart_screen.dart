import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketapp/Constants/constant.dart';
import 'package:marketapp/Hindi_Widgets_Component/hi_cart_list_widgetcomponent.dart';
import 'package:marketapp/Screens/login_screen.dart';
import 'package:marketapp/Widgets/cart_widget.dart';
import 'package:marketapp/Widgets_Components/cart_list_widgetcomponent.dart';

class Cartscreen extends StatefulWidget {
  Cartscreen({Key? key}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Cartwidget(),
      ),
    );
  }
}
