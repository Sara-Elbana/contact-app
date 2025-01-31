import 'package:contact_app/core/app_assets.dart';
import 'package:contact_app/core/app_color.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/screens/widget/contact_card_widget.dart';
import 'package:contact_app/screens/widget/custom_bottom_sheet.dart';
import 'package:contact_app/screens/widget/empty_list_widget.dart';
//import 'package:contact_app/screens/widget/text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = List.from(Contact.contacts);

  void _showBottomSheet() async {
    Contact? newContact = await CustomBottomSheet.show(context);
    if (newContact != null) {
      setState(() {
        Contact.contacts.add(newContact);
      });
    }
  }

  void _deleteLastContact() {
    if (contacts.isNotEmpty) {
      setState(() {
        contacts.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.routeLogo,
              ),
              Contact.contacts.isEmpty
                  ? const EmptyListWidget()
                  : Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) => ContactCardWdgit(
                          onClick: (int index) {
                            setState(() {
                              Contact.contacts.removeAt(index);
                            });
                          },
                          contact: contacts[index],
                          index: index,
                        ),
                        itemCount: contacts.length,
                      ),
                    ),
              // Image.asset(
              //   "assets/images/list-purple-Xetxuqguwn.png",
              //   fit: BoxFit.cover,
              // ),

              //const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: contacts.isNotEmpty,
                        child: FloatingActionButton(
                          backgroundColor: AppColors.red,
                          onPressed: _deleteLastContact,
                          child: const Icon(
                            Icons.delete,
                            color: AppColors.white2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: Contact.contacts.length <= 4,
                        child: FloatingActionButton(
                          backgroundColor: AppColors.white1,
                          onPressed: _showBottomSheet,
                          child: const Icon(
                            Icons.add,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
