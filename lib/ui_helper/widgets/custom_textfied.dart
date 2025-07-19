import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextfied extends StatelessWidget {

  final TextEditingController controller;
  final String hinttext;
  final prefixIcon;

  const CustomTextfied({

    required this.controller,
    required this.hinttext,
    required this.prefixIcon

});




  @override
  Widget build(BuildContext context) {
    return TextField(

      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      controller: controller,
      maxLength: 10,
      decoration: InputDecoration(
        hintText: hinttext,
        hintMaxLines: 1,


        prefixIcon: prefixIcon,

        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(8.0),

          borderSide: BorderSide(
            color:Colors.deepPurple,
            width: 5,
          ),


        ),
      ),


    );
  }
}
