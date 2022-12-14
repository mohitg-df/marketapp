import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/Screens/Welcome_screen.dart';
import 'package:marketapp/Screens/cart_screen.dart';
import 'package:marketapp/Screens/home_screen.dart';
import 'package:marketapp/Screens/login_screen.dart';
import 'package:marketapp/Screens/profile_screen.dart';
import 'package:marketapp/Widgets_Components/order_history_widgetcomponent.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Screens/en_invoice_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        home: AnimatedSplashScreen(
          splash: 'assets/product.png',
          nextScreen: Welcomescreen(),
          splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: PageTransitionType.scale,
        ),
      ),
    );
  }
}

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets Buy',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: "/Loginscreen",
      routes: {
        "/Loginscreen": (context) => Loginpage(),
        "/Homescreen": (context) => Homescreen(),
        "/Cartscreen": (context) => Cartscreen(),
        "/Orderscreen": (context) => Orderhistwidgetcomponent(),
        "/Invoicescreen": (context) => Invoicescreen(),
      },
    );
  }
}
