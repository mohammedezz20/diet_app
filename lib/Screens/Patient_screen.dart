import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:diet_app/Shared/Widgets/Button.dart';
import 'package:diet_app/Shared/Widgets/add_new_patient.dart';
import 'package:diet_app/Shared/Widgets/patient_item.dart';
import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/app_states.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppInitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: cubit.isDrawrOpen
                ? BorderRadius.circular(20.0)
                : BorderRadius.zero,
            color: Colors.white,
          ),
          transform: Matrix4.translationValues(cubit.xoffset, cubit.yoffset, 0)
            ..scale(cubit.scaleFactor),
          height: context.screenHeight,
          duration: const Duration(milliseconds: 250),
          child: Padding(
            padding: EdgeInsets.only(
              top: context.h(60.0),
              right: context.w(25.0),
              left: context.w(25.0),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          (cubit.isDrawrOpen)
                              ? cubit.drawer_Function(0.0, 0.0, 1.0)
                              : cubit.drawer_Function(context.screenWidth * .6,
                                  context.screenHeight * .2, .6);
                        },
                        child: const Icon(
                          Icons.menu,
                          size: 35,
                          color: Colors.black,
                        )),
                    const Spacer(),
                    Text(
                      S.of(context).patients,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              context.h(20).SizedBoxWithHeight,
              Expanded(
                child: (state is FetchPatientLoadingState)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.green[700],
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return PatientItem(
                            model: cubit.patientList[index],
                          );
                        },
                        itemCount: cubit.patientList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return context.h(20).SizedBoxWithHeight;
                        },
                      ),
              ),
              context.h(20).SizedBoxWithHeight,
              MyButtom(
                onpressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return const AddNewPatient();
                      });
                },
                text: S.of(context).newPatient,
              ),
              context.h(20).SizedBoxWithHeight,
            ]),
          ),
        );
      },
    );
  }
}
