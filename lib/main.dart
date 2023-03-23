import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker/common/themes.dart';
import 'package:gym_tracker/data/shared.dart';
import 'package:gym_tracker/logic/cubit/app_cubit.dart';
import 'package:gym_tracker/presentation/screens/home_screen.dart';
import 'package:gym_tracker/presentation/screens/onboarding_screen.dart';

bool isopened = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.initShared();
  isopened = Shared.getbool("isopened") ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..loadworkouts()
        ..loadexercises(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routes: {
          '/': (context) => isopen(isopened),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}

Widget isopen(bool isopened) {
  if (isopened)
    return HomeScreen();
  else if (!isopened)
    return OnBoardingScreen();
  else
    return OnBoardingScreen();
}
