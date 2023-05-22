import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/theme/custom_theme.dart';
import 'package:inventory_app/presentation/screen/home/bloc/home_cubit.dart';
import 'package:inventory_app/presentation/screen/home/home_screen.dart';
import 'package:inventory_app/presentation/screen/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.themeData,
        initialRoute: RouteName.splash,
        routes: {
          RouteName.splash: (context) => const SplashScreen(),
          RouteName.home: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
