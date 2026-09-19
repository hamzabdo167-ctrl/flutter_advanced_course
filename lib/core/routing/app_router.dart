// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/features/login/logic/cubit/login_cubit.dart';
import 'package:my_new_app/features/home/ui/home_screen.dart';
import 'package:my_new_app/features/onboarding/onboarding_screeen.dart';
import 'package:my_new_app/features/login/ui/login_screen.dart';
import 'package:my_new_app/core/di/dependency_injection.dart';
import 'package:my_new_app/core/routing/routes.dart';
import 'package:my_new_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:my_new_app/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed to any screen like this

    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreeen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
