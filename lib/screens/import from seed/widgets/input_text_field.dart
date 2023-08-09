import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final IconButton? suffixIcon;
  final int? maxLines;
  final String? labelText;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String? helperText;
  final String? errorText;
  final String? Function(String?)? validator;

  const InputTextField(
      {super.key,
      required this.controller,
      this.obscureText = false,
      this.suffixIcon,
      this.maxLines,
      this.labelText,
      this.margin,
      this.padding,
      this.helperText,
      this.errorText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      // padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF181E25),
              ),
            ),
            child: TextFormField(
              controller: controller,
              validator: validator,
              style: Theme.of(context).textTheme.labelSmall,
              decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: const Color(0xFF6A84A0),
                      ),
                  border: InputBorder.none,
                  suffixIcon: suffixIcon),
              maxLines: maxLines,
              obscureText: obscureText,
            ),
          ),
          if (helperText != null)
            Container(
              margin: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                helperText!,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                      color: const Color(0xFF6A84A0),
                    ),
              ),
            ),
          if (errorText != null)
            Container(
              margin: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                errorText!,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                      color: const Color(0xFFEF6B72),
                    ),
              ),
            )
        ],
      ),
    );
  }
}
