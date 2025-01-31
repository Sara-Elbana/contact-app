import 'dart:io';

import 'package:contact_app/models/contact.dart';
import 'package:contact_app/screens/widget/bottom_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/core/app_color.dart';
import 'package:contact_app/screens/widget/text_field.dart';
import 'package:image_picker/image_picker.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomSheetState createState() => _CustomBottomSheetState();

  static Future<Contact?> show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => const CustomBottomSheet(),
    );
  }
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  File? image;
  String? imageError;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        imageError = null;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (image == null) {
        setState(() {
          imageError = "Please select an image";
        });
        return;
      }
      Contact newContact = Contact(
        image: image!,
        name: nameController.text,
        number: phoneController.text,
        email: emailController.text,
      );

      Navigator.pop(context, newContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          decoration: const BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomDataWidget(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  image: image,
                  onClick: _pickImage,
                ),
                if (imageError != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      imageError!,
                      style: const TextStyle(
                        color: AppColors.red,
                      ),
                    ),
                  ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  hintText: "Enter User Name",
                  controller: nameController,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter User Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  hintText: "Enter User Email",
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter User Email";
                    } else if (RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  hintText: "Enter User Phone",
                  textInputType: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter User Phone";
                    } else if (RegExp(r"^01[0-2]\d{8}$").hasMatch(value)) {
                      return "Enter Valid Phone";
                    }
                    return null;
                  },
                ),
                //const Spacer(),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white1,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Enter user",
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
