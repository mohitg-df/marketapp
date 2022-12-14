import 'package:flutter/material.dart';
import 'package:marketapp/Constants/constant.dart';

TextStyle hometextstyle(context) => TextStyle(
  color: Colors.black,
  fontSize: 20 * MediaQuery.of(context).size.width * 0.001,
  fontWeight: FontWeight.w600,
);

TextStyle typesstyle(context) => TextStyle(
  fontSize: 6 * MediaQuery.of(context).size.width * 0.01,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.1,
);

TextStyle getstarted(context) => TextStyle(
  fontSize: 1.3 * MediaQuery.of(context).size.width * 0.01,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.3,
  // fontSize: 19,
);

TextStyle detailswholesale(context) => TextStyle(
  fontSize: 1.3 * MediaQuery.of(context).size.width * 0.01,
  color: kTextcolor.withOpacity(0.34),
);

TextStyle detailsretails(context) => TextStyle(
  fontSize: 1.3 * MediaQuery.of(context).size.width * 0.01,
  color: Colors.white.withOpacity(0.8),
);

TextStyle profilepicstyle(context) => TextStyle(
  fontSize: 17,
  color: Colors.white,
);

TextStyle wholesaleformheaderstyle(context) => TextStyle(
  fontSize: 1 * MediaQuery.of(context).size.width * 0.01,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
);

TextStyle stepperheadingstyle(context) => TextStyle(
  fontSize: 10 * MediaQuery.of(context).size.width * 0.001,
  fontWeight: FontWeight.w600,
);

TextStyle hintstyle(context) => TextStyle(
  fontSize: 20 * MediaQuery.of(context).size.width * 0.001,
  fontWeight: FontWeight.w500,
);

TextStyle buttontextstyle(context) => TextStyle(
  letterSpacing: 1,
  fontSize: 20 * MediaQuery.of(context).size.width * 0.001,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle cartbuttontextstyle(context) => TextStyle(
  letterSpacing: 1,
  fontSize: 1.1 * MediaQuery.of(context).size.width * 0.01,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

TextStyle submittedstyle(context) => TextStyle(
  fontSize: 10 * MediaQuery.of(context).size.width * 0.001,
  fontWeight: FontWeight.w500,
);
