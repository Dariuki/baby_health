import 'dart:io';

class PersonModel {
  PersonModel({
    required this.id,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.weight,
    required this.growth,
    required this.isFemale,
  });

  final String id;
  final File? image;
  final String firstName;
  final String lastName;
  final double age;
  final double weight;
  final double growth;
  final bool isFemale;

  String get name {
    return '$firstName $lastName';
  }
}
