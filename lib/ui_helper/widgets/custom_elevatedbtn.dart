import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final VoidCallback callback;
  final String btnName;

 const CustomElevatedButton({
     super.key,
    required this.btnName,
   required this.callback,
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 10,
          backgroundColor: Colors.deepPurple[900],
        ),
        child: Text(
          btnName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );

  }
}
