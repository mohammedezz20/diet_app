// ignore_for_file: must_be_immutable

import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/app_states.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TypeWidget extends StatelessWidget {
  TypeWidget({required this.ischoise, required this.ismale,this.ontap});
  bool ischoise;
  bool ismale;
  var ontap;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppInitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: GestureDetector(
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: ischoise ? 4.0 : 1.0,
                      color: ischoise ? Colors.teal[800]! : Colors.black12),
                  borderRadius: BorderRadius.circular(20)),
              height: context.h(170),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(ismale ? Icons.male : Icons.female,
                        size: 80,
                        color: ismale ? Color(0xffFF9356) : Color(0xffD73972)),
                    Text(ismale ? S.of(context).maletype : S.of(context).femaletype,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
