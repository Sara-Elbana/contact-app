import 'package:contact_app/core/app_assets.dart';
import 'package:contact_app/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppAssets.listPurpleAnimation,
          fit: BoxFit.contain,
        ),
        const Text(
          "There is No Contacts Added Here",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.white1,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
