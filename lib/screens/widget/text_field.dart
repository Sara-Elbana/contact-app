import 'package:contact_app/core/app_color.dart';
import 'package:flutter/material.dart';

//typedef TextFieldWidgetCallback = String? Function(String? value);

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.darkBlue,
        hintStyle: const TextStyle(
            color: AppColors.white2, fontSize: 16, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.white1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.white1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.white1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
