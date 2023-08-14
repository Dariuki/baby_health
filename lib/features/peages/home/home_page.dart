import 'package:baby_health/domain/providers/person_pro.dart';
import 'package:baby_health/features/peages/add/add_person.dart';

import 'package:baby_health/features/peages/home/home_page_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personModel = ref.watch(personsProvider);

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
      body: HomePageBody(personModel: personModel),
    );
  }
}
