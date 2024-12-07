import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tap_2/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('clase/logo_halo.png'),
      logoWidth: 150,
      title: const Text('Bienvenidos a mi App', style: TextStyle(fontSize: 30),),
      showLoader: true,
      loadingText: const Text('Cargando aplicación ....'),
      navigator: const LoginScreen(),
      durationInSeconds: 4,
      gradientBackground: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 134, 142, 184),
          Color.fromARGB(255, 51, 74, 158)
        ]
      ),
    );
  }
}
