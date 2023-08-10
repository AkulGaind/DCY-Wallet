import 'package:dcy_wallet/screens/new_wallet/create_a_new_wallet.dart';
import 'package:dcy_wallet/screens/seed_phrase/import_from_seed.dart';
import 'package:dcy_wallet/theme/gradient.dart';
import 'package:flutter/material.dart';

class WalletSetup extends StatelessWidget {
  const WalletSetup({super.key});

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
                  'images/ws.png',
                  width: 295,
                  height: 295,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('Wallet Setup',
                  style: Theme.of(context).textTheme.displayLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 42,
                top: 8,
                left: 24,
                right: 24,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF202832)),
                        fixedSize: MaterialStatePropertyAll(Size(500, 56)),
                      ),
                      child: const Center(
                        child: Text(
                          'Import Using a Seed Phrase',
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const ImportFromSeed();
                            },
                          ),
                        );
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
                              return const CreateNewWallet();
                            },
                          ),
                        );
                      },
                      child: const Text('Create a New Wallet'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
