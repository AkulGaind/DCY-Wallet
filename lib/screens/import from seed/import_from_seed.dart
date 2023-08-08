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
  bool _disableButton = false;

  @override
  void initState() {
    super.initState();
    _seedPhraseController.addListener(_validateFields);
    _newPasswordController.addListener(_validateFields);
    _confirmPasswordController.addListener(_validateFields);
  }

  void _validateFields() {
    final seedPhrase = _seedPhraseController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      _disableButton = seedPhrase.isNotEmpty &&
          newPassword.isNotEmpty &&
          newPassword.length < 8 &&
          confirmPassword.isNotEmpty &&
          newPassword == confirmPassword;
    });
  }

  String? _validateSeedPhrase(String? value) {
    if (value == null || value.isEmpty) {
      return 'Seed Phrase is required';
    } else if (value.length < 8) {
      return 'Seed Phrase must be at least 8 characters long';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Seed Phrase must contain at least one capital letter';
    } else if (!RegExp(r'\d').hasMatch(value)) {
      return 'Seed Phrase must contain at least one digit';
    } else {
      return null;
    }
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
            children: [
              Container(
                margin: const EdgeInsets.only(left: 2, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(24),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF181E25),
                          ),
                        ),
                        child: TextFormField(
                          controller: _seedPhraseController,
                          validator: _validateSeedPhrase,
                          style: Theme.of(context).textTheme.labelSmall,
                          decoration: InputDecoration(
                            labelText: "Seed Phrase",
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: const Color(0xFF6A84A0),
                                ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _seedphrase = !_seedphrase;
                                });
                              },
                              icon: Icon(
                                  color: Colors.white,
                                  _seedphrase
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                            ),
                          ),
                          maxLines: null,
                          // obscureText: !_seedphrase,
                        ),
                      ),
                    ),
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF181E25),
                  ),
                ),
                child: TextFormField(
                  controller: _newPasswordController,
                  style: Theme.of(context).textTheme.labelSmall,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    hintStyle: const TextStyle(color: Colors.white),
                    labelStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: const Color(0xFF6A84A0),
                            ),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _newpassword = !_newpassword;
                        });
                      },
                      icon: Icon(
                          color: Colors.white,
                          _newpassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                    ),
                  ),
                  maxLines: 1,
                  obscureText: !_newpassword,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(24),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF181E25),
                  ),
                ),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  style: Theme.of(context).textTheme.labelSmall,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: const Color(0xFF6A84A0),
                            ),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _confirmpassword = !_confirmpassword;
                        });
                      },
                      icon: Icon(
                          color: Colors.white,
                          _confirmpassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                    ),
                  ),
                  maxLines: 1,
                  obscureText: !_confirmpassword,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign in with Face ID?',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Switch(
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
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 32, right: 24, top: 24),
                  child: RichText(
                    text: TextSpan(
                      text: 'By proceeding, you agree to these ',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: const Color(0xFF8FA2B7),
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms and Conditions.',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
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
            ),
    );
  }
}
