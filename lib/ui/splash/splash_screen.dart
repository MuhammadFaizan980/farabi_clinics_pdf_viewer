import 'package:farabi_clinics_pdf_viewer/app_assets.dart';
import 'package:farabi_clinics_pdf_viewer/ui/splash/splash_vm.dart';
import 'package:farabi_clinics_pdf_viewer/utils/app_circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<SplashVm>.reactive(
        viewModelBuilder: () => SplashVm(),
        onViewModelReady: (vm) => vm.initTimer(),
        builder: (context, vm, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            Image.asset(AppAssets.logo),
            Container(
              margin: const EdgeInsets.only(top: 32),
              height: 32,
              width: 32,
              child: AppCircularLoader(),
            ),
          ],
        ),
      ),
    );
  }
}
