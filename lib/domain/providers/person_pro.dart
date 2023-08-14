import 'dart:io';

import 'package:baby_health/domain/models/person_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonsNotifier extends StateNotifier<List<PersonModel>> {
  PersonsNotifier() : super(const []);

  void addPerson(
    File image,
    String firstName,
    String lastName,
    double age,
    double weight,
    double growth,
    bool isFemale,
  ) {
    final newPerson = PersonModel(
      isFemale: isFemale,
      image: image,
      firstName: firstName,
      lastName: lastName,
      age: age,
      weight: weight,
      growth: growth,
      
    );
    state = [newPerson, ...state];
  }
}

final personsProvider =
    StateNotifierProvider<PersonsNotifier, List<PersonModel>>(
  (ref) => PersonsNotifier(),
);
