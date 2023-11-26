import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'calculator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isLinux | Platform.isWindows | Platform.isMacOS) {
    setWindowMaxSize(const Size(430, 570));
    setWindowMinSize(const Size(430, 570));
  }

  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
