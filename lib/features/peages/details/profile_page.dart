import 'package:baby_health/domain/models/person_model.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile(
    this.model, {
    super.key,
  });
  final PersonModel model;

  String getGenderString() {
    return model.isFemale ? 'Kobieta' : 'Mężczyzna';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: FileImage(model.image!),
                  radius: 60,
                ),
                const SizedBox(height: 16),
                Text(
                  model.name,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Wiek: ${model.age.toInt()}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Płeć: ${getGenderString()}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Waga: ${model.weight.toString()}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Wzrost: ${model.growth.toInt()}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
