import 'package:animate_do/animate_do.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketapp/Constants/constant.dart';
import 'package:marketapp/Screens/add_product_screen.dart';
import 'package:marketapp/Widgets/login_widget.dart';

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          // actions: [
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       AutoSizeText(
          //         "|",
          //         style: TextStyle(
          //           fontSize: 25.0,
          //           color: Colors.black,
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () {
          //           // Navigator.of(context).pushReplacement(
          //           //   PageRouteBuilder(
          //           //     pageBuilder: (context, animation, secondaryAnimation) => const Sginuppage(),
          //           //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //           //       var begin = const Offset(0.0, 1.0);
          //           //       var end = Offset.zero;
          //           //       var curve = Curves.easeInBack;
          //           //
          //           //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          //           //
          //           //       return SlideTransition(
          //           //         position: animation.drive(tween),
          //           //         child: child,
          //           //       );
          //           //     },
          //           //   ),
          //           // );
          //         },
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.app_registration,
          //               color: Colors.red,
          //             ),
          //             SizedBox(
          //               width: 5.0,
          //             ),
          //             Tooltip(
          //               message: "Sign Up",
          //               child: AutoSizeText(
          //                 "Sign Up",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //                 // style: hometextstyle(context),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         width: 15.0,
          //       ),
          //     ],
          //   ),
          // ],
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 250,
                color: Colors.amber.shade400,
              ),
            ),
            Loginwidget(),
          ],
        ),
      ),
    );
  }
}
