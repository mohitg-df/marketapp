import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 210,
                color: Colors.amber.shade400,
              ),
            ),
            nextscreen(context),
          ],
        ),
      ),
    );
  }

  Widget nextscreen(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 3 * MediaQuery.of(context).size.width * 0.1,
                height: 0.6 * MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  // color: Colors.blueGrey.withOpacity(0.65),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/Loginscreen");
                  },
                  child: AutoSizeText(
                    "Login",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 3 * MediaQuery.of(context).size.width * 0.1,
                height: 0.6 * MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  // color: Colors.blueGrey.withOpacity(0.65),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: AutoSizeText(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              AutoSizeText(
                "Build Awesome APP",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AutoSizeText(
                "Let's put your creativity on the develpoment highway",
              ),
            ],
          ),
          Image.asset(
            "assets/product.png",
            width: 7 * MediaQuery.of(context).size.width * 0.1,
            height: 4 * MediaQuery.of(context).size.height * 0.1,
          ),
        ],
      ),
    );
  }
}
