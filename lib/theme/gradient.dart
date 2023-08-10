import 'package:flutter/material.dart';

class Gradients {
  static const Gradient gradient1 = LinearGradient(
    begin: Alignment(-1.00, 0.02),
    end: Alignment(1, -0.02),
    colors: [
      Color(0xFF70A2FF),
      Color(0xFF72F6D1),
      Color(0xFF76E268),
      Color(0xFFFFD505),
      Color(0xFFF76E64),
    ],
  );

  static const Gradient gradient2 = LinearGradient(
    begin: Alignment(-1.00, 0.02),
    end: Alignment(1, -0.02),
    colors: [
      Color(0xFF89D4EB),
      Color(0xFFEF96FF),
      Color(0xFFFF56A9),
      Color(0xFFFFAA6C),
    ],
  );

  static const Gradient gradient3 = LinearGradient(
    begin: Alignment(-1.00, 0.02),
    end: Alignment(1, -0.02),
    colors: [
      Color(0xFF70A2FF),
      Color(0xFF54F0D1),
    ],
  );

  static const Gradient gradient4 = LinearGradient(
    begin: Alignment(-1.00, 0.02),
    end: Alignment(1, -0.02),
    colors: [
      Color(0xFF70A2FF),
      Color(0xFF54F0D1),
    ],
  );
    static Shader customShader(Rect bounds, Gradient? gradient) {
    return gradient!.createShader(bounds);
  }
}