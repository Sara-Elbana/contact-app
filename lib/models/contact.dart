// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class Contact {
  File image;
  String name;
  String number;
  String email;
  Contact({
    required this.image,
    required this.name,
    required this.number,
    required this.email,
  });

  static List<Contact> contacts = [];
}
