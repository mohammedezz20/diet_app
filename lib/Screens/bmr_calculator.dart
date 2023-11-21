import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:diet_app/Shared/Widgets/Button.dart';
import 'package:diet_app/Shared/Widgets/TextFieldWidget.dart';
import 'package:diet_app/Shared/Widgets/type_widget.dart';
import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/app_states.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMRCalculatorScreen extends StatelessWidget {
  const BMRCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppInitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: context.h(60.0),
              right: context.w(25.0),
              left: context.w(25.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 35,
                                color: Colors.black,
                              )),
                          const Spacer(),
                          Text(
                            S.of(context).title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.h(30),
                    ),
                    Row(
                      children: [
                        TypeWidget(
                          ischoise: cubit.ismale ? true : false,
                          ismale: true,
                          ontap: () {
                            if (!cubit.ismale) {
                              cubit.changeType();
                            }
                          },
                        ),
                        SizedBox(
                          width: context.w(30),
                        ),
                        TypeWidget(
                            ischoise: cubit.ismale ? false : true,
                            ismale: false,
                            ontap: () {
                              if (cubit.ismale) {
                                cubit.changeType();
                              }
                            }),
                      ],
                    ),
                    20.SizedBoxWithHeight,
                    TextFieldWidget(
                      text: S.of(context).weight,
                      controller: cubit.weightController,
                    ),
                    20.SizedBoxWithHeight,
                    TextFieldWidget(
                      text: S.of(context).height,
                      controller: cubit.heightController,
                    ),
                    20.SizedBoxWithHeight,
                    TextFieldWidget(
                      text: S.of(context).age,
                      controller: cubit.ageController,
                    ),
                    40.SizedBoxWithHeight,
                    MyButtom(
                      onpressed: () {
                        cubit.calculate_bmr(context);
                      },
                      text: S.of(context).calculateButtom,
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}

extension StringHelper on String {
  int ToInt() => int.parse(this);
}

extension Media_Query_Helper on BuildContext {
  get get_Screen_width => MediaQuery.sizeOf(this).width;
}
