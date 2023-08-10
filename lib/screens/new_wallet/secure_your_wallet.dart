import 'package:dcy_wallet/screens/new_wallet/manual_secure.dart';
import 'package:dcy_wallet/theme/swatch_color.dart';
import 'package:flutter/material.dart';

import '../../theme/gradient.dart';

class SecureWallet extends StatefulWidget {
  const SecureWallet({super.key});

  @override
  State<SecureWallet> createState() => _SecureWalletState();
}

class _SecureWalletState extends State<SecureWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: surfaceSwatch[24],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 24, bottom: 40),
                child: Image.asset(
                  'images/syw.png',
                  height: 295,
                  width: 295,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
                child: Text(
                  'Secure Your Wallet',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: RichText(
                  text: TextSpan(
                    text:
                        "Don't risk losing your funds. protect your wallet by saving your ",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          height: 1.5,
                          color: surfaceSwatch[9],
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Seed phrase',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  height: 1.5,
                                  color: secondarySwatch[5],
                                ),
                      ),
                      TextSpan(
                        text: ' in a place you trust.',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              height: 2,
                              color: surfaceSwatch[9],
                            ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "It's the only way to recover your wallet if you get locked out of the app or get a new device.",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: surfaceSwatch[9],
                        height: 2,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 42,
          top: 8,
          left: 24,
          right: 24,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll(secondarySwatch[5],),
                    fixedSize: const MaterialStatePropertyAll(Size(500, 56)),
                  ),
                  child: const Center(
                    child: Text(
                      'Import Using a Seed Phrase',
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: 500,
                height: 56,
                decoration: BoxDecoration(
                  gradient: Gradients.gradient2,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ManualScreen();
                        },
                      ),
                    );
                  },
                  child: const Text('Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
