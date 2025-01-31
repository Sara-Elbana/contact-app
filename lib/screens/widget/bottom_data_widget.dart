import 'dart:io';
import 'package:contact_app/core/app_assets.dart';
import 'package:contact_app/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class BottomDataWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final File? image;
  final Future<void> Function() onClick;
  const BottomDataWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    this.image,
    required this.onClick,
  });

  @override
  State<BottomDataWidget> createState() => _BottomDataWidgetState();
}

class _BottomDataWidgetState extends State<BottomDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await widget.onClick();
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 2,
                      color: AppColors.white1,
                    ),
                  ),
                  child: widget.image == null
                      ? Lottie.asset(AppAssets.imagePerson)
                      : Image.file(widget.image!, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextFieldDisplay(
                    widget.nameController,
                    "User Name",
                  ),
                  const Divider(color: AppColors.white1),
                  _buildTextFieldDisplay(
                    widget.emailController,
                    "example@email.com",
                  ),
                  const Divider(color: AppColors.white1),
                  _buildTextFieldDisplay(
                    widget.phoneController,
                    "+200000000000",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldDisplay(
    TextEditingController controller,
    String placeholder,
  ) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        return Text(
          value.text.isEmpty ? placeholder : value.text,
          style: const TextStyle(
            color: AppColors.white1,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
