import 'package:dcy_wallet/theme/swatch_color.dart';
import 'package:flutter/material.dart';

import '../../theme/gradient.dart';

class ManualScreen extends StatefulWidget {
  const ManualScreen({super.key});

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 12),
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
                  margin: const EdgeInsets.only(top: 8, left: 60),
                  child: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            RichText(
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
            Text(
              'Manual',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'Write down your seed phrase on a piece of paper and store in a safe place.',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              'Security lever: Very strong',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Row(
              children: [
                Container(
                  width: 52.2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: onPrimarySwatch[5],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 52.2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: onPrimarySwatch[5],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  width: 52.2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: onPrimarySwatch[5],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            Text(
              'Risks are:',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('Item 3'),
            ),
            Text(
              "Other options: Doesn't have to be paper!",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              'Tips',
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
