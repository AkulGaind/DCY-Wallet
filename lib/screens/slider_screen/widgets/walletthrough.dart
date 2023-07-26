import 'package:flutter/material.dart';

import '../../../theme/gradient.dart';

class WalletThrough extends StatelessWidget {
  final String image;
  final String gradientText;
  final String subtitle;
  const WalletThrough(
      {super.key,
      required this.image,
      required this.gradientText,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 295,
              width: 295,
            ),
            const SizedBox(height: 50),
            if(subtitle != "Convenient")
            Text(subtitle,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(height: 2)),
            ShaderMask(
              shaderCallback: (Rect bounds) =>
                  Gradients.customShader(bounds, Gradients.gradient2),
              child: Text(subtitle == "Convenient" ? "Convenient" : gradientText,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(height: subtitle == "Convenient" ? 2 : 1.25)),
            ),
            if(subtitle == "Convenient")
            Text("Transaction",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(height: 1.25))
          ],
        ),
      ),
    );
  }
}
