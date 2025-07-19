import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;


  const Customtext({

    required this.text,
    this.color = Colors.white,
     this.size = 24.0,
     this.fontWeight = FontWeight.normal

});


  @override
  Widget build(BuildContext context) {
    return Text(

      '$text',
      style:  TextStyle(

        color: color, fontSize: size, fontWeight: fontWeight,



      ),

    );
  }
}
