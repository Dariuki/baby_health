import 'dart:io';

import 'package:baby_health/domain/models/person_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class PersonsNotifier extends StateNotifier<List<PersonModel>> {
  PersonsNotifier() : super(const []);

  void addPerson(
    File? image,
    String firstName,
    String lastName,
    double age,
    double weight,
    double growth,
    bool isFemale,
  ) {
    final newPerson = PersonModel(
      id: const Uuid().v4(),
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

  void updatePerson(
    String personId,
    File? newImage,
    String newFirstName,
    String newLastName,
    double newAge,
    double newWeight,
    double newGrowth,
    bool newIsFemale,
  ) {
    final updatedPersonsList = state.map((personModel) {
      if (personModel.id == personId) {
        return PersonModel(
          id: personModel.id,
          isFemale: newIsFemale,
          image: newImage ?? personModel.image,
          firstName: newFirstName,
          lastName: newLastName,
          age: newAge,
          weight: newWeight,
          growth: newGrowth,
        );
      } else {
        return personModel;
      }
    }).toList();

    state = updatedPersonsList;
  }
}

final personsProvider =
    StateNotifierProvider<PersonsNotifier, List<PersonModel>>(
  (ref) => PersonsNotifier(),
);
