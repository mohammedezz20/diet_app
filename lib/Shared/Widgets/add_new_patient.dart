import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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

class AddNewPatient extends StatelessWidget {
  const AddNewPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppInitState>(
      listener: (context, state) {
        if (state is AddPatientSuccessState) {
          context.showAwesomeSnackbar(
              contentType: ContentType.success,
              message: S.of(context).addpatientSucess,
              title: "");
        } else if (state is AddPatientFailedState) {
          context.showAwesomeSnackbar(
              contentType: ContentType.failure,
              message: S.of(context).addPatientError,
              title: "");
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.all(context.w(20)),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TypeWidget(
                          ischoise: cubit.male ? true : false,
                          ismale: true,
                          ontap: () {
                            if (!cubit.male) {
                              cubit.changeGender();
                            }
                          },
                        ),
                        SizedBox(
                          width: context.w(30),
                        ),
                        TypeWidget(
                            ischoise: cubit.male ? false : true,
                            ismale: false,
                            ontap: () {
                              if (cubit.male) {
                                cubit.changeGender();
                              }
                            }),
                      ],
                    ),
                    context.w(20).SizedBoxWithHeight,
                    TextFieldWidget(
                      inputtype: TextInputType.text,
                      isnum: false,
                      text: S.of(context).firtName,
                      controller: cubit.patientFirstNameController,
                    ),
                    context.w(20).SizedBoxWithHeight,
                    TextFieldWidget(
                      isnum: false,
                      inputtype: TextInputType.text,
                      text: S.of(context).lastName,
                      controller: cubit.patientLastNameController,
                    ),
                    context.w(20).SizedBoxWithHeight,
                    TextFieldWidget(
                      text: S.of(context).weight,
                      controller: cubit.patientweightController,
                    ),
                    context.w(20).SizedBoxWithHeight,
                    TextFieldWidget(
                      text: S.of(context).height,
                      controller: cubit.patientheightController,
                    ),
                    context.w(20).SizedBoxWithHeight,
                    TextFieldWidget(
                      text: S.of(context).age,
                      controller: cubit.patientAgeController,
                    ),
                    context.w(40).SizedBoxWithHeight,
                    Row(
                      children: [
                        Expanded(
                          child: MyButtom(
                            onpressed: () {
                              cubit.addPatient();
                              cubit.cleardata();
                              Navigator.pop(context);
                            },
                            text: S.of(context).add,
                          ),
                        ),
                        context.w(10).SizedBoxWithWidth,
                        Expanded(
                          child: MyButtom(
                            onpressed: () {
                              Navigator.pop(context);
                            },
                            text: S.of(context).cancel,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
