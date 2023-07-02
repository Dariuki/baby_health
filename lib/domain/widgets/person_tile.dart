import 'package:baby_health/domain/models/person_model.dart';
import 'package:baby_health/features/peages/details/details_page.dart';

import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  const PersonTile({
    super.key,
    required this.personModels,
  });
  final List<PersonModel> personModels;

  @override
  Widget build(BuildContext context) {
    if (personModels.isEmpty) {
      return const Center(
        child: Text('No person addet yet'),
      );
    }

    return ListView.builder(
      itemCount: personModels.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amber,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(personModel: personModels[index]),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(personModels[index].image),
                ),
                Text(personModels[index].name),
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
        ),
      ),
    );
  }
}
