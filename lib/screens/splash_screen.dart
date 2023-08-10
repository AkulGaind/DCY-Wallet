import 'dart:async';

import 'package:dcy_wallet/screens/slider-screen/slider_screen.dart';
import 'package:flutter/material.dart';

import '../theme/gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SliderScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) =>
                  Gradients.customShader(bounds, Gradients.gradient2),
              child:
                  Text('DCY', style: Theme.of(context).textTheme.headlineLarge),
            ),
            Text('CRYPTO WALLET',
                style: Theme.of(context).textTheme.headlineSmall)
          ],
        ),
      ),
    );
  }
}
