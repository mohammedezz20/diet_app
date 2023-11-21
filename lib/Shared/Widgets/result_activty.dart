// ignore_for_file: must_be_immutable

import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:flutter/material.dart';

class ResultActivty extends StatelessWidget {
  ResultActivty({
    super.key,
    required this.result,
    required this.text,
  });
  String text;
  String result;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: context.h(30),
          thickness: context.h(4),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        context.h(15).SizedBoxWithHeight,
        Text(
          result,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
