import 'package:dcy_wallet/theme/swatch_color.dart';
import 'package:flutter/material.dart';

import '../../theme/gradient.dart';

class ManualScreen extends StatefulWidget {
  const ManualScreen({super.key});

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  List<String> risks = [
    "You lose it",
    "You forget where you put it",
    "Someone else finds it"
  ];
  List<String> tips = [
    "Store in bank vault",
    "Store in a safe",
    "Store in multiple secret places"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: surfaceSwatch[24],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 84),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) =>
                          Gradients.customShader(bounds, Gradients.gradient4),
                      child: Text(
                        "Secure Your Wallet",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 24, right: 24, top: 12, bottom: 32),
              child: RichText(
                text: TextSpan(
                  text: "Secure your wallet's ",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        height: 1.5,
                        color: surfaceSwatch[9],
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '"Seed Phrase"',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            height: 1.5,
                            color: secondarySwatch[5],
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Manual',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Write down your seed phrase on a piece of paper and store in a safe place.',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Security level: Very strong',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, bottom: 8),
              child: Row(
                children: [
                  ...List<Widget>.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 52.67,
                      height: 2,
                      decoration: BoxDecoration(
                        color: onPrimarySwatch[5],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 4),
              child: Text(
                'Risks are:',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
              child: Column(
                children: risks.map((e) {
                  return Row(children: [
                    const Text(
                      "\u2022",
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              wordSpacing: 2,
                              height: 1.5,
                            ),
                      ),
                    )
                  ]);
                }).toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "Other options: Doesn't have to be paper!",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 4),
              child: Text(
                'Tips:',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: tips.map((e) {
                  return Row(children: [
                    const Text(
                      "\u2022",
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              wordSpacing: 2,
                              height: 1.5,
                            ),
                      ),
                    )
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 42,
          top: 8,
          left: 42,
          right: 12,
        ),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            gradient: Gradients.gradient2,
            borderRadius: BorderRadius.circular(80),
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Start',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
