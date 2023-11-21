// ignore_for_file: must_be_immutable

import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:diet_app/Shared/Widgets/Button.dart';
import 'package:diet_app/Shared/Widgets/SessionItemWidget.dart';
import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/app_states.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:diet_app/models/patientModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SessionScreen extends StatelessWidget {
  SessionScreen({super.key, required this.patient});
  Patient patient;
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      "${patient.firstName} ${patient.lastName}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          cubit.deletePatient(patient.id);
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.delete,
                          size: 35,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              context.h(20).SizedBoxWithHeight,
              Expanded(
                child: (state is FetchPatientSessionLoadingState)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.green[700],
                        ),
                      )
                    : cubit.patienSessiontList.isEmpty
                        ? Center(
                            child: Text(S.of(context).noSessionYet,
                                style: const TextStyle(fontSize: 20)),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return Slidable(
                                  key: const ValueKey(0),
                                  startActionPane: ActionPane(
                                    // A motion is a widget used to control how the pane animates.
                                    motion: const ScrollMotion(),
                                    // All actions are defined in the children parameter.
                                    children: [
                                      // A SlidableAction can have an icon and/or a label.
                                      SlidableAction(
                                        onPressed: (_) {},
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: S.of(context).delete,
                                      ),
                                    ],
                                  ),
                                  endActionPane: ActionPane(
                                    // A motion is a widget used to control how the pane animates.
                                    motion: const ScrollMotion(),
                                    // All actions are defined in the children parameter.
                                    children: [
                                      // A SlidableAction can have an icon and/or a label.
                                      SlidableAction(
                                        onPressed: (_) {},
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: S.of(context).delete,
                                      ),
                                    ],
                                  ),
                                  child: SessionWidget(
                                      model: cubit.patienSessiontList[index]));
                            },
                            itemCount: cubit.patienSessiontList.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return context.h(20).SizedBoxWithHeight;
                            },
                          ),
              ),
              context.h(20).SizedBoxWithHeight,
              MyButtom(
                onpressed: () {
                  cubit.fetchPatientSessions(patient.id);
                },
                text: S.of(context).calculateButtom,
              ),
              context.h(20).SizedBoxWithHeight,
            ]),
          ),
        );
      },
    );
  }
}
