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
            const SizedBox(
              height: 150,
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  height: 295,
                  width: 295,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              // padding: const EdgeInsets.only(top: 36),
              child: Column(
                children: [
                  if (subtitle != "Convenient")
                    Text(
                      subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(height: 2),
                    ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) =>
                        Gradients.customShader(bounds, Gradients.gradient2),
                    child: Text(
                        subtitle == "Convenient" ? "Convenient" : gradientText,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                height: subtitle == "Convenient" ? 2 : 1.25)),
                  ),
                  if (subtitle == "Convenient")
                    Text(
                      gradientText,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(height: 1.25),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
