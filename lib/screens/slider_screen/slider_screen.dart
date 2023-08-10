import 'package:dcy_wallet/screens/slider_screen/widgets/wallet_through.dart';
import 'package:dcy_wallet/screens/wallet_setup/wallet_setup.dart';
import 'package:dcy_wallet/theme/swatch_color.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final PageController controller = PageController();
  int _activestate = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: (int page) {
              setState(
                () {
                  _activestate = page;
                },
              );
            },
            children: const [
              WalletThrough(
                image: 'images/wt1.png',
                subtitle: 'Property',
                gradientText: 'Diversity',
              ),
              WalletThrough(
                image: 'images/wt2.png',
                subtitle: 'Safe',
                gradientText: 'Security',
              ),
              WalletThrough(
                image: 'images/wt3.png',
                subtitle: 'Convenient',
                gradientText: 'Transaction',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDotIndicator(0),
              buildDotIndicator(1),
              buildDotIndicator(2)
            ],
          ),
        ),
        // if(_activestate == 2)
        Padding(
          padding: const EdgeInsets.only(
            bottom: 42,
            top: 8,
            left: 24,
            right: 24,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(surfaceSwatch[21]),
            ),
            child: const Center(
              child: Text(
                'Get Started',
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const WalletSetup();
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildDotIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _activestate
            ? primarySwatch[5]
            : surfaceSwatch[18],
      ),
    );
  }
}
