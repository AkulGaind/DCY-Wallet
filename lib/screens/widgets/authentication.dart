import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../../theme/swatch_color.dart';

class Authentication extends StatefulWidget {
  final EdgeInsets? margin;
  const Authentication({super.key, this.margin});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _toggleValue = false;
  bool _biometricValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sign in with Face ID?',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Transform.scale(
            scale: 1.1,
            child: Switch(
              inactiveThumbColor: surfaceSwatch[22],
              inactiveTrackColor: surfaceSwatch[18],
              activeColor: Colors.white,
              trackOutlineColor:
                  const MaterialStatePropertyAll(Colors.transparent),
              activeTrackColor: primarySwatch[5],
              value: _toggleValue,
              onChanged: (value) {
                setState(
                  () {
                    if (!_toggleValue) {
                      _toggleValue = true;
                    }
                    if (!_biometricValue) {
                      _authenticate();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'If you want to sign in with Biometrics',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _biometricValue = authenticated;
        if (!_biometricValue) {
          _toggleValue = false;
        }
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
