import 'package:diet_app/Screens/DrawerScreen.dart';
import 'package:diet_app/Screens/Patient_screen.dart';

import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppInitState>(
      builder: (context,state){
       
        return Scaffold(
      body: Stack(children: [
        MyDrawer(),
        PatientScreen()
      ]),
    );
      },
       listener: (context,state){});
  }
}