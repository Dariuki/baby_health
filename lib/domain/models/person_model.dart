import 'package:image_picker/image_picker.dart';

class PersonModel {
  PersonModel({
    required this.image,
    required this.name,
    required this.lastName,
    required this.age,
    required this.weight,
    required this.growth,
    required this.isFemale,
  });

  final ImagePicker image;
  final String name;
  final String lastName;
  final double age;
  final double weight;
  final double growth;
  final bool isFemale;
}
