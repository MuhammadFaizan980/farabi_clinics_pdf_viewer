import 'package:farabi_clinics_pdf_viewer/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() => runApp(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: const HomeScreen(),
      ),
    );
