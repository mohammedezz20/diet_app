// ignore_for_file: must_be_immutable

import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.text,
    required this.controller,
    this.inputtype = TextInputType.number,
    this.isnum = true,
  });
  String text;
  var controller;
  var inputtype;
  bool isnum;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: context.screenWidth * .35,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        const Spacer(),
        SizedBox(
          width: context.screenWidth * .50,
          child: TextField(
            controller: controller,
            cursorColor: Colors.teal[800],
            keyboardType: inputtype,
            textAlign: TextAlign.center,
            onTap: () {},
            style: TextStyle(
                color: Colors.teal[800],
                fontSize: 18,
                fontWeight: FontWeight.bold),
            inputFormatters: [
              isnum
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.singleLineFormatter
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 3, color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 3, color: Colors.teal[800]!)),
            ),
          ),
        ),
      ],
    );
  }
}
