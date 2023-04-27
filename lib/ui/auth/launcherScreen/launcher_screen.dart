import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visita/constants.dart';
import 'package:visita/pages/root_app.dart';
import 'package:visita/pages/welcome_page.dart.dart';
import 'package:visita/services/helper.dart';
import 'package:visita/ui/auth/authentication_bloc.dart';
import 'package:visita/ui/auth/onBoarding/data.dart';
import 'package:visita/ui/auth/onBoarding/on_boarding_screen.dart';
import 'package:visita/ui/auth/welcome/welcome_screen.dart';
import 'package:visita/ui/home/home_screen.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(CheckFirstRunEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(colorPrimary),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.authState) {
            case AuthState.firstRun:
              pushReplacement(
                  context,
                  OnBoardingScreen(
                    images: imageList,
                    titles: titlesList,
                    subtitles: subtitlesList,
                  ));
              break;
            case AuthState.authenticated:
              pushReplacement(context, RootApp(user: state.user!));
              break;
            case AuthState.unauthenticated:
              pushReplacement(context, const WelcomePage());
              break;
          }
        },
        child: const Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Color(colorPrimary)),
          ),
        ),
      ),
    );
  }
}
