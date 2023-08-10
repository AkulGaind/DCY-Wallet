import 'package:dcy_wallet/screens/new_wallet/secure_your_wallet.dart';
import 'package:dcy_wallet/screens/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

import '../../theme/gradient.dart';

class CreateNewWallet extends StatefulWidget {
  const CreateNewWallet({super.key});

  @override
  State<CreateNewWallet> createState() => _CreateNewWalletState();
}

class _CreateNewWalletState extends State<CreateNewWallet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _togglevalue = false;
  bool _disableButton = true;
  bool _newpassword = false;
  bool _confirmpassword = false;
  bool _isChecked = false;
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
        _newpasswordtext = "Password Strength: Good";
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
    _newPasswordController.addListener(_validateFields);
    _confirmPasswordController.addListener(_validateFields);
  }

  void _validateFields() {
    setState(() {
      _disableButton = _newPasswordController.text.isEmpty ||
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
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 24, right: 24, top: 40, bottom: 16),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) =>
                        Gradients.customShader(bounds, Gradients.gradient3),
                    child: Text("Create Password",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'This password will unlock your Metamask wallet only on this service',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: const Color(0xFF8FA2B7)),
                  ),
                ),
                InputTextField(
                  controller: _newPasswordController,
                  margin: const EdgeInsets.only(
                      left: 24, right: 24, top: 40, bottom: 12),
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
                  maxLines: 1,
                  labelText: "Confirm Password",
                  errorText: (_newPasswordController.text.isNotEmpty &&
                          _confirmPasswordController.text.isNotEmpty &&
                          _newPasswordController.text !=
                              _confirmPasswordController.text)
                      ? "Your passwords must match. Please try again"
                      : null,
                  obscureText: !_confirmpassword,
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
                  margin: const EdgeInsets.only(
                      left: 32, right: 32, top: 28, bottom: 24),
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
                          inactiveThumbColor: const Color(0xFF181E25),
                          inactiveTrackColor: const Color(0xFF384657),
                          activeColor: Colors.white,
                          trackOutlineColor: const MaterialStatePropertyAll(
                              Colors.transparent),
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
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Checkbox(
                          checkColor: Colors.white,
                          activeColor: const Color(0xFF3D8DFF),
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
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'I understand that DeGe cannot recover this password for me. ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    height: 1.5,
                                    wordSpacing: 2,
                                  ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Learn more',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          height: 1.5,
                                          color: const Color(0xFF5F97FF),
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              const Color(0xFF5F97FF)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _disableButton
          ? Padding(
              padding: const EdgeInsets.only(
                bottom: 42,
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
                  onPressed: null,
                  child: Text(
                    'Create Password',
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const SecureWallet();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Create Password',
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
