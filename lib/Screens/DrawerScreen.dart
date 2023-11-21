import 'package:diet_app/Screens/bmr_calculator.dart';
import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:diet_app/Shared/bloc/LangState.dart';
import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/langCubit.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LangCubit, LangInitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LangCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.teal[800],
          body: Container(
            width: context.screenWidth * .55,
            color: Colors.teal[800],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(),
                ListTile(
                  title: Text(
                    S.of(context).language,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).en,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  leading: Radio(
                    value: 'en',
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    fillColor: MaterialStateProperty.all(Colors.white),
                    groupValue: cubit.selectedLanguage,
                    onChanged: (value) {
                      cubit.changeLang(false);
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).ar,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  leading: Radio(
                    value: 'ar',
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    fillColor: MaterialStateProperty.all(Colors.white),
                    groupValue: cubit.selectedLanguage,
                    onChanged: (value) {
                      cubit.changeLang(true);
                    },
                  ),
                ),
                //   ListTile(
                //   title: Text(

                //     S.of(context).soon,
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),

                CupertinoButton(
                    child: Container(
                      alignment: Alignment.center,
                      height: context.h(50),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: context.h(3),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        S.of(context).title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      context.jumpTo(const BMRCalculatorScreen());
                      AppCubit.get(context).drawer_Function(0.0, 0.0, 1.0);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
