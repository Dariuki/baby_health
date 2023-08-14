import 'package:baby_health/domain/models/person_model.dart';
import 'package:baby_health/domain/widgets/person_tile.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.personModel,
  });

  final List<PersonModel> personModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: personModel.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: personModel[index].isFemale
                ? Colors.pink[200]
                : Colors.blue[200],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: PersonTile(
              personModel: personModel[index],
              isFemale: personModel[index].isFemale),
        ),
      ),
    );
  }
}
