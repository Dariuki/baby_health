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
        child: Text(model.name),
      ),
    );
  }
}
