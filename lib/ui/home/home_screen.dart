import 'package:farabi_clinics_pdf_viewer/app_assets.dart';
import 'package:farabi_clinics_pdf_viewer/ui/home/home_vm.dart';
import 'package:farabi_clinics_pdf_viewer/utils/scsreen_utils.dart';
import 'package:farabi_clinics_pdf_viewer/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<HomeVm>.reactive(
        viewModelBuilder: () => HomeVm(),
        builder: (context, vm, _) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getHomeHeader(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: vm.pickJsonFile,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 16),
                        width: getScreenWidth() * 0.5,
                        height: getScreenHeight() * 0.5,
                        color: Colors.black.withOpacity(0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_download,
                              size: getScreenWidth() * 0.1,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            Text(
                              vm.fileName ?? 'Pick JSON File',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              if (vm.fileName != null) ...[
                AppButton.expanded(
                  label: 'Parse JSON',
                  borderRadius: 0,
                  onTap: vm.parseJson,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHomeHeader() {
    return Row(
      children: [
        Image.asset(
          AppAssets.logo,
          width: getScreenWidth() * 0.07,
          height: getScreenWidth() * 0.07,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Al Farabi JSON Parser',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Parse your jaons with ease',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
