import 'dart:ui';

import 'package:dcy_wallet/screens/new_wallet/manual_secure.dart';
import 'package:dcy_wallet/theme/swatch_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../theme/gradient.dart';

class SecureWallet extends StatefulWidget {
  const SecureWallet({super.key});

  @override
  State<SecureWallet> createState() => _SecureWalletState();
}

class _SecureWalletState extends State<SecureWallet> {
  List<String> seedPhrase = [
    "A seed phrase is a set of twelve words that contains all the information about your wallet, including your funds. It's like a secret code used to access your entire wallet.",
    "You must keep your seed phrase secret and safe. If someone gets your seed phrase, they'll gain control over your accounts. ",
    "Save it in a place where only you can access it. If you lose it, not even MetaMask can help you recover it. "
  ];
  bool _isChecked = false;

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
                    children: [
                      TextSpan(
                        text: 'Seed phrase',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet<void>(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    height: 400,
                                    color: surfaceSwatch[24],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              top: 24,
                                              bottom: 40),
                                          child: Text(
                                            "What is a 'Seed phrase'",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                        ),
                                        ...seedPhrase.map(
                                          (e) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  left: 24,
                                                  right: 24,
                                                  bottom: 8),
                                              child: Text(
                                                e,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 42,
                                              left: 24,
                                              right: 24,
                                              top: 34),
                                          width: 375,
                                          height: 52,
                                          decoration: BoxDecoration(
                                            gradient: Gradients.gradient2,
                                            borderRadius:
                                                BorderRadius.circular(80),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('I Got It'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
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
                    foregroundColor: MaterialStatePropertyAll(
                      secondarySwatch[5],
                    ),
                    fixedSize: const MaterialStatePropertyAll(Size(500, 56)),
                  ),
                  child: const Center(
                    child: Text(
                      'Import Using a Seed Phrase',
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return StatefulBuilder(
                            // this is new
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                child: Container(
                                  height: 300,
                                  color: surfaceSwatch[24],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 24,
                                            bottom: 40),
                                        child: Text(
                                          "Skip Account Security?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: primarySwatch[5],
                                                value: _isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: Text(
                                                    'I understand that if I lose my seed phrase I will not be able to access my wallet',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 32),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 16),
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStatePropertyAll(
                                                    secondarySwatch[5],
                                                  ),
                                                  fixedSize:
                                                      const MaterialStatePropertyAll(
                                                          Size(156, 56)),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Secure',
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            _isChecked
                                                ? Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 42,
                                                            left: 24,
                                                            right: 24,
                                                            top: 34),
                                                    width: 156,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                      gradient:
                                                          Gradients.gradient2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              80),
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return const ManualScreen();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child: const Text('Skip'),
                                                    ),
                                                  )
                                                : Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 42,
                                                            left: 24,
                                                            right: 24,
                                                            top: 34),
                                                    width: 156,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              80),
                                                    ),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                          surfaceSwatch[23],
                                                        ),
                                                      ),
                                                      onPressed: null,
                                                      child: Text(
                                                        'Skip',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall!
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  surfaceSwatch[
                                                                      18],
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  },
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
