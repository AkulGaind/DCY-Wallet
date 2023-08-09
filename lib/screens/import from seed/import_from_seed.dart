import 'package:dcy_wallet/screens/import%20from%20seed/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

import '../../theme/gradient.dart';

class ImportFromSeed extends StatefulWidget {
  const ImportFromSeed({super.key});

  @override
  State<ImportFromSeed> createState() => _ImportFromSeedState();
}

class _ImportFromSeedState extends State<ImportFromSeed> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _seedPhraseController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _seedphrase = false;
  bool _newpassword = false;
  bool _confirmpassword = false;
  bool _togglevalue = false;
  bool _disableButton = true;
  String _newpasswordtext = "Must be at least 8 characters";

  newPasswordValidate() {
    if (_newPasswordController.text.isEmpty ||
        _newPasswordController.text.length < 8) {
      setState(() {
        _newpasswordtext = "Must be at least 8 characters";
      });
    } else if (RegExp(r'[A-Z]').hasMatch(_newPasswordController.text) &&
        RegExp(r'\d').hasMatch(_newPasswordController.text) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]')
            .hasMatch(_newPasswordController.text)) {
      setState(() {
        _newpasswordtext = "Password Strength: Strong";
      });
    } else if (RegExp(r'\d').hasMatch(_newPasswordController.text) &&
        RegExp(r'[A-Z]').hasMatch(_newPasswordController.text)) {
      setState(() {
        _newpasswordtext = "Password Strength: Medium";
      });
    } else {
      setState(() {
        _newpasswordtext = "Password Strength: Weak";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _seedPhraseController.addListener(_validateFields);
    _newPasswordController.addListener(_validateFields);
    _confirmPasswordController.addListener(_validateFields);
  }

  void _validateFields() {
    setState(() {
      _disableButton = _seedPhraseController.text.isEmpty ||
          _newPasswordController.text.isEmpty ||
          _confirmPasswordController.text.isEmpty ||
          _newPasswordController.text.length < 8 ||
          _newPasswordController.text != _confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF080A0C),
        centerTitle: true,
        title: Text(
          'Import From Seed',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 2, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: InputTextField(
                      controller: _seedPhraseController,
                      labelText: "Seed Phrase",
                      maxLines: null,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _seedphrase = !_seedphrase;
                          });
                        },
                        icon: Icon(
                            color: Colors.white,
                            _seedphrase
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined),
                      ),
                    )),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/qr.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ),
              InputTextField(
                controller: _newPasswordController,
                validator: newPasswordValidate(),
                maxLines: 1,
                labelText: "New Password",
                obscureText: !_newpassword,
                helperText: _newpasswordtext,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _newpassword = !_newpassword;
                    });
                  },
                  icon: Icon(
                      color: Colors.white,
                      _newpassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined),
                ),
              ),
              InputTextField(
                controller: _confirmPasswordController,
                // validator: confirmPasswordValidate(),
                obscureText: !_confirmpassword,
                labelText: "Confirm Password",
                errorText: (_newPasswordController.text.isNotEmpty &&
                        _confirmPasswordController.text.isNotEmpty &&
                        _newPasswordController.text !=
                            _confirmPasswordController.text)
                    ? "Your passwords must match. Please try again"
                    : null,
                maxLines: 1,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _confirmpassword = !_confirmpassword;
                    });
                  },
                  icon: Icon(
                      color: Colors.white,
                      _confirmpassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign in with Face ID?',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Transform.scale(
                      scale: 1.2,
                      child: Switch(
                        inactiveThumbColor: const Color(0xFF181E25),
                        inactiveTrackColor: const Color(0xFF384657),
                        activeColor: Colors.white,
                        trackOutlineColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        activeTrackColor: const Color(0xFF3D8DFF),
                        value: _togglevalue,
                        onChanged: (onChanged) {
                          setState(
                            () {
                              _togglevalue = onChanged;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 32, right: 24, top: 12),
                  child: RichText(
                    text: TextSpan(
                      text: 'By proceeding, you agree to these ',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            height: 1.5,
                            color: const Color(0xFF8FA2B7),
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms and Conditions.',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  height: 1.5,
                                  color: const Color(0xFF5F97FF),
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFF5F97FF)),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 250,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _disableButton
          ? Padding(
              padding: const EdgeInsets.only(
                // bottom: 42,
                top: 8,
                left: 42,
                right: 12,
              ),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFF101419),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Import',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF384657)),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                // bottom: 42,
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
                  onPressed: null,
                  child: Text(
                    'Import',
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
