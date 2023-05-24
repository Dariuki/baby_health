import 'package:baby_health/features/peages/add/add_person.dart';
import 'package:baby_health/features/widgets/person_tile.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Page'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddPerson(),
            ),
          );
        },
        child: const Icon(Icons.person_add_alt_1),
      ),
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        PersonTile(),
        PersonTile(),
        PersonTile(),
      ],
    );
  }
}
