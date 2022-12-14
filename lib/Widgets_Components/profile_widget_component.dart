import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Screens/cart_screen.dart';
import 'package:marketapp/Screens/home_screen.dart';
import 'package:marketapp/Screens/login_screen.dart';
import 'package:marketapp/Widgets_Components/order_history_widgetcomponent.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Profilewidgetcomponent extends StatefulWidget {
  const Profilewidgetcomponent({Key? key}) : super(key: key);

  @override
  State<Profilewidgetcomponent> createState() => _ProfilewidgetcomponentState();
}

class _ProfilewidgetcomponentState extends State<Profilewidgetcomponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (_, orientation) {
      if(orientation == Orientation.portrait){
        return Portrait();
      }
      else{
        return Landscape();
      }
    });
  }

  Widget Portrait(){
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 2.6 * MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                height: 0.7 * MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.blueGrey.withOpacity(0.65),
                ),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: Orderhistwidgetcomponent(),
                        // withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation
                            .cupertino,
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.history),
                      AutoSizeText(
                        "Orders",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 2.5 * MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                height: 0.7 * MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.blueGrey.withOpacity(0.65),
                ),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: Cartscreen(),
                        // withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation
                            .cupertino,
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.shopping_cart),
                      AutoSizeText(
                        "Cart",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // CircleAvatar(
          //   backgroundColor: Colors.amber,
          //   radius: 5 * MediaQuery.of(context).size.height * 0.01,
          //   child: AutoSizeText(
          //     '${Firstname[0]}',
          //     style: TextStyle(
          //       fontSize: 30.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ), //Text
          // ),
          SizedBox(
            height: 4 * MediaQuery
                .of(context)
                .size
                .height * 0.01,
          ),
          TextFormField(
            initialValue: "${Firstname} ${Lastname}",
            readOnly: true,
            decoration: InputDecoration(
              label: AutoSizeText(
                "Full Name",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            maxLines: 1,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: "${Emailid}",
            readOnly: true,
            decoration: InputDecoration(
              label: AutoSizeText(
                "Email ID",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget Landscape(){
    return Padding(
      padding: const EdgeInsets.only(
        left: 50.0,
        right: 50.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 1.5 * MediaQuery
                      .of(context)
                      .size
                      .width * 0.1,
                  height: 1.2 * MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.blueGrey.withOpacity(0.65),
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: Orderhistwidgetcomponent(),
                          // withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation
                              .cupertino,
                        );
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.history),
                        AutoSizeText(
                          "Orders",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1.5 * MediaQuery
                      .of(context)
                      .size
                      .width * 0.1,
                  height: 1.2 * MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.blueGrey.withOpacity(0.65),
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: Cartscreen(),
                          // withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation
                              .cupertino,
                        );
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.shopping_cart),
                        AutoSizeText(
                          "Cart",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // CircleAvatar(
            //   backgroundColor: Colors.amber,
            //   radius: 5 * MediaQuery.of(context).size.height * 0.01,
            //   child: AutoSizeText(
            //     '${Firstname[0]}',
            //     style: TextStyle(
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ), //Text
            // ),
            SizedBox(
              height: 4 * MediaQuery
                  .of(context)
                  .size
                  .height * 0.01,
            ),
            TextFormField(
              initialValue: "${Firstname} ${Lastname}",
              readOnly: true,
              decoration: InputDecoration(
                label: AutoSizeText(
                  "Full Name",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              maxLines: 1,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "${Emailid}",
              readOnly: true,
              decoration: InputDecoration(
                label: AutoSizeText(
                  "Email ID",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
