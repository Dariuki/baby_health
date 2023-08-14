import 'package:baby_health/domain/models/person_model.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile(
    this.model, {
    super.key,
  });
  final PersonModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(
              child: Text(model.name),
            ),
            Center(
              child: Text(model.age.toString()),
            ),
            Center(
              child: Text(model.weight.toString()),
            ),
            Center(
              child: Text(model.growth.toString()),
            ),
            Center(
              child: Text(model.isFemale.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
