import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/Controllers/login_controller.dart';
import 'package:marketapp/Screens/add_product_screen.dart';
import 'package:marketapp/Screens/home_screen.dart';
import 'package:marketapp/Styles/textstyle.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Loginformcomponent extends StatefulWidget {
  const Loginformcomponent({Key? key}) : super(key: key);

  @override
  _LoginformcomponentState createState() => _LoginformcomponentState();
}

class _LoginformcomponentState extends StateMVC<Loginformcomponent> {
  bool _isLoading = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  late Logincontroller _logincontroller;

  _LoginformcomponentState() : super(Logincontroller()) {
    this._logincontroller = controller as Logincontroller;
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? const Center(child: CircularProgressIndicator()) : f();
  }

  Widget f() {
    return Form(
      key: _logincontroller.loginformkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 10 * MediaQuery.of(context).size.height * 0.01,
              ),
              AutoSizeText(
                "Sign In Here !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 16 * MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                // initialValue: "prince@gmail.com",
                controller: _username,
                validator: (item) {
                  _logincontroller.loginmodel.email = item;
                  return item!.contains("@") ? null : "Enter Valid Email";
                },
                onSaved: (_username) =>
                    _logincontroller.loginmodel.email = _username,
                decoration: InputDecoration(
                  label: AutoSizeText(
                    "Enter Username/Email",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  icon: Icon(
                    Icons.email,
                    size: 22,
                  ),
                  hintText: "example@gmail.com",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20 * MediaQuery.of(context).size.height * 0.001,
              ),
              TextFormField(
                // initialValue: "prince1",
                controller: _password,
                obscureText: _logincontroller.show_password ? true : false,
                validator: (String? item) {
                  _logincontroller.loginmodel.pass = item;
                  return item!.length > 6
                      ? null
                      : "Password should be more than 6 character";
                },
                onSaved: (_password) =>
                    _logincontroller.loginmodel.pass = _password,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _logincontroller.show_password =
                            !_logincontroller.show_password;
                      });
                    },
                    icon: Icon(
                      _logincontroller.show_password
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 22,
                    ),
                  ),
                  label: AutoSizeText(
                    "Enter Password",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  icon: Icon(
                    Icons.password,
                    size: 22,
                  ),
                  hintText: "********",
                  // hintStyle: hintstyle(context),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40 * MediaQuery.of(context).size.height * 0.001,
              ),
              button(),
              SizedBox(
                height: 40 * MediaQuery.of(context).size.height * 0.001,
              ),
              forgotpass(),
              SizedBox(
                height: 16 * MediaQuery.of(context).size.height * 0.001,
              ),
              Accountcrate(),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.withOpacity(0.65),
          ),
          child: MaterialButton(
            onPressed: () {
              // Call Controller Here
              setState(() {
                if(_logincontroller.loginformkey.currentState!.validate()){
                  _isLoading = true;
                  _logincontroller.loginsubmit(context);
                }
              });
            },
            child: AutoSizeText(
              "Login",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.blueGrey.withOpacity(0.65),
        //   ),
        //   child: MaterialButton(
        //     onPressed: () {
        //
        //     },
        //     child: AutoSizeText(
        //       "Cancel",
        //       style: TextStyle(
        //         fontSize: 14.0,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget forgotpass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Forgot Password? ",
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        InkWell(
          onTap: () {
            print("Clicked on Forgot Password");
          },
          child: AutoSizeText(
            "Click Here",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget Accountcrate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Create Account? ",
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        InkWell(
          onTap: () {
            // print("Navigate to admin panel");
            // Navigator.of(context).pushReplacement(
            //   PageRouteBuilder(
            //     pageBuilder: (context, animation, secondaryAnimation) =>
            //         Addproductscreen(),
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
          child: AutoSizeText(
            "Click Here",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
