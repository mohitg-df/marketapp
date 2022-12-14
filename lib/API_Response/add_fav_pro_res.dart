import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/add_fav_pro_API.dart';

class Favresponse{

  void favres(context){
    addfavprocode == 200?
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: Colors.blueGrey,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.decelerate,
      message: 'Product added in WishList',
      duration: Duration(seconds: 3),
    ).show(context)
        :
    Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    backgroundColor: Colors.blueGrey,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.decelerate,
    message: 'Product Not Added in WishList',
    duration: Duration(seconds: 3),
    ).show(context);
  }
}