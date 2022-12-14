import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketapp/Constants/constant.dart';
import 'package:marketapp/Widgets/add_product_widget.dart';

class Addproductscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blueGrey, //change your color here
          ),
          // automaticallyImplyLeading: false,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         Adminproductscreen(),
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       var begin = const Offset(0.0, 1.0);
                    //       var end = Offset.zero;
                    //       var curve = Curves.easeInBack;
                    //
                    //       var tween = Tween(begin: begin, end: end)
                    //           .chain(CurveTween(curve: curve));
                    //
                    //       return SlideTransition(
                    //         position: animation.drive(tween),
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                  icon: Icon(
                    Icons.list,
                    color: Colors.redAccent,
                    size: 22.0,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 160,
                color: Colors.amber.shade400,
              ),
            ),
            Addproductwidget(),
          ],
        ),
      ),
    );
  }
}
