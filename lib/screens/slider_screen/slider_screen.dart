import 'package:dcy_wallet/screens/slider_screen/widgets/walletthrough.dart';
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
            setState(() {
              _activestate = page;
            });
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
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80))),
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xFF202832)),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              ),
            ),
            child: Center(
                child: Text(
              'Get Started',
              style: Theme.of(context).textTheme.labelLarge,
            ))),
      )
    ]);
  }

  Widget buildDotIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _activestate ? Colors.blue : Colors.grey,
      ),
    );
  }
}
