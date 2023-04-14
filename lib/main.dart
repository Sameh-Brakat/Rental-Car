import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_rental_car/shared/bloc_observer.dart';
import 'package:turbo_rental_car/shared/components/constants.dart';
import 'package:turbo_rental_car/shared/cubit/cubit.dart';
import 'package:turbo_rental_car/shared/network/local/cashe_helper.dart';
import 'package:turbo_rental_car/shared/styles/themes.dart';
import 'layout/home_layout.dart';
import 'modules/login/cubit/cubit.dart';
import 'modules/login/login_screen.dart';
import 'modules/on_boarding/onboarding_screen.dart';
import 'modules/register/cubit/cubit.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  await Firebase.initializeApp();

  Widget widget;

  dynamic onBoarding = CacheHelper.getData(key: 'onBoard');
  uId = CacheHelper.getData(key: 'uId');


  if (onBoarding != null) {
    if (uId != null) {
      widget = MyHomePage();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RentalCarCubit()..getUserData()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: lightMode,
        // darkTheme: darkMode,
        home: startWidget,
        // onBoarding ? LoginScreen() : OnBoardingScreen(),
      ),
    );
  }
}
