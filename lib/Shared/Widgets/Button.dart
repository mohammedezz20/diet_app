// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:diet_app/Shared/Extensions/Extentions.dart';

class MyButtom extends StatelessWidget {
  MyButtom({required this.onpressed, 
  required this.text,
  this.color=Colors.teal,
  this.textColor=Colors.white,
  }
  );
  String text;
  var onpressed;
  var color;
  var textColor;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(textColor),
            backgroundColor: MaterialStateProperty.all(color),
            elevation: MaterialStateProperty.all(10.0),
    
            fixedSize: MaterialStateProperty.all(Size(context.screenWidth, context.h(50)))
            ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
