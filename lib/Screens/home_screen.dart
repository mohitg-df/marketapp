import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketapp/Constants/constant.dart';
import 'package:marketapp/Hindi_Widgets_Component/hi_home_product_list_widgetcomponent.dart';
import 'package:marketapp/Hindi_Widgets_Component/hi_retail_widgetcomponent.dart';
import 'package:marketapp/Hindi_Widgets_Component/hi_wholsesale_widgetcomponent.dart';
import 'package:marketapp/Screens/fav_product_screen.dart';
import 'package:marketapp/Screens/profile_screen.dart';
import 'package:marketapp/Widgets_Components/order_history_widgetcomponent.dart';
import 'package:marketapp/Widgets_Components/retail_list_widgetcomponent.dart';
import 'package:marketapp/Widgets_Components/wholseale_list_widgetcomponent.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool _hasBeenPressed = false;

  List<Widget> _buildScreens() {
    return [
      _hasBeenPressed == false
          ? Allproductscreen()
          : Hiallproductscreen(),
      _hasBeenPressed == false
          ? Wholesaleprolistwidgetcomponent()
          : Hiwholesaleprolistwidgetcomponent(),
      _hasBeenPressed == false
          ? Retailprolistwidgetcomponent()
          : Hiretailprolistwidgetcomponent(),
      Profilescreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        // title: "Home",
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.work_rounded),
        // title: "Wholesale Products",
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.work_rounded),
        // title: "Retails Products",
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        // title: "Wholesale Products",
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.inventory),
      //   // title: "Wholesale Products",
      //   activeColorPrimary: CupertinoColors.white,
      //   inactiveColorPrimary: CupertinoColors.white,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blueGrey, // <-- SEE HERE
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          // centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          title: AutoSizeText(
            "Let'S Buy",
            style: GoogleFonts.acme(
              textStyle: TextStyle(
                color: apptextxcolor,
                fontSize: 18,
              ),
            ),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed("/Cartscreen");
            //   },
            //   icon: Icon(
            //     Icons.shopping_cart,
            //     color: Colors.redAccent,
            //   ),
            // ),
            IconButton(
              onPressed: () {
                setState(() {
                  _hasBeenPressed = !_hasBeenPressed;
                });
              },
              icon: Icon(
                Icons.translate,
                color:
                    _hasBeenPressed == false ? Colors.black : Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Loginscreen');
              },
              icon: Icon(
                Icons.login_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        // body: pages[pageIndex],
        // bottomNavigationBar: buildMyNavBar(context),
        body: PersistentTabView(
          context,
          controller: PersistentTabController(initialIndex: 0),
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.blueGrey,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6,
        ),
      ),
    );
  }
}
