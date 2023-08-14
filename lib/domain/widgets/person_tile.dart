import 'package:flutter/material.dart';
import 'package:baby_health/domain/models/person_model.dart';
import 'package:baby_health/features/peages/details/details_page.dart';

class PersonTile extends StatelessWidget {
  final PersonModel personModel;

  const PersonTile({
    Key? key,
    required this.personModel,
    required bool isFemale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsPage(personModel: personModel),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: FileImage(personModel.image),
            ),
            Text(personModel.name),
            Row(
              children: [
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edytuj'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
