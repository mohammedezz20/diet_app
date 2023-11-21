import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:diet_app/Shared/Widgets/Button.dart';
import 'package:diet_app/Shared/Widgets/result_activty.dart';
import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/app_states.dart';
import 'package:diet_app/Shared/network/supabase_function.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppInitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: context.h(60.0),
              right: context.w(25.0),
              left: context.w(25.0),
            ),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CupertinoButton(
                          child: Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.black,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Spacer(),
                      Text(
                        S.of(context).result,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                  context.h(30).SizedBoxWithHeight,
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "BMR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                        "${cubit.result}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                  ResultActivty(
                    text: S.of(context).activity1,
                    result: "${(cubit.result * 1.2).toStringAsFixed(2)}",
                  ),
                  ResultActivty(
                    text: S.of(context).activity2,
                    result: "${(cubit.result * 1.375).toStringAsFixed(2)}",
                  ),
                  ResultActivty(
                    text: S.of(context).activity3,
                    result: "${(cubit.result * 1.465).toStringAsFixed(2)}",
                  ),
                  ResultActivty(
                    text: S.of(context).activity4,
                    result: "${(cubit.result * 1.55).toStringAsFixed(2)}",
                  ),
                  ResultActivty(
                    text: S.of(context).activity5,
                    result: "${(cubit.result * 1.725).toStringAsFixed(2)}",
                  ),
                  ResultActivty(
                    text: S.of(context).activity6,
                    result: "${(cubit.result * 1.9).toStringAsFixed(2)}",
                  ),
                  context.h(30).SizedBoxWithHeight,
                  MyButtom(
                    onpressed: () {
                       SupaBase_Helper.fetchPatients();
                      // cubit.addPatient(
                      //   firstName: 'mohammed',
                      //   lastName: 'ezz',
                      //   age: 29,
                      //   height: 165,
                      //   weight: 60,
                      // )
                      // ;
                    },
                    text: S.of(context).creatediet,
                  ),
                  context.h(30).SizedBoxWithHeight,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
