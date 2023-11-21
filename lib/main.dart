// ignore_for_file: must_be_immutable

import 'package:diet_app/Screens/SplashScreen.dart';
import 'package:diet_app/Shared/bloc/Block_Observer.dart';
import 'package:diet_app/Shared/bloc/LangState.dart';
import 'package:diet_app/Shared/bloc/app_bloc.dart';
import 'package:diet_app/Shared/bloc/langCubit.dart';
import 'package:diet_app/Shared/network/shared_pref_helper.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();
  bool isArabic = CachHelper.getData(key: 'isArabic') ?? false;
  await Supabase.initialize(
    url: "https://euaaucooigtbeqgnlnuq.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1YWF1Y29vaWd0YmVxZ25sbnVxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc4OTYzNTEsImV4cCI6MjAxMzQ3MjM1MX0.eQJIkcikl7a7G45YarZbaCxkcB2xTnDNFXmHjfH-43I",
    authFlowType: AuthFlowType.pkce,
  );

  runApp(MainApp(
    isArabic: isArabic,
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key, required this.isArabic});
  bool isArabic;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
              create: (context) => AppCubit()..fetchPatient()),
          BlocProvider<LangCubit>(
              create: (context) => LangCubit()..changeLang(isArabic)),
        ],
        child: BlocConsumer<LangCubit, LangInitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              locale: Locale(LangCubit.get(context).selectedLanguage),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              // theme: ThemeData(
              //   useMaterial3: true
              // ),
              supportedLocales: S.delegate.supportedLocales,
              // home: const BMRCalculatorScreen(),
              home: SplashScreen(),
            );
          },
        ));
  }
}
