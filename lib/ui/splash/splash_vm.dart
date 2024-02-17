import 'package:farabi_clinics_pdf_viewer/main.dart';
import 'package:farabi_clinics_pdf_viewer/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashVm extends ChangeNotifier {
  Future<void> initTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(navigatorKey.currentState!.context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
