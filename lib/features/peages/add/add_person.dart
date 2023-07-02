import 'dart:io';

import 'package:baby_health/domain/providers/person_pro.dart';
import 'package:baby_health/domain/widgets/button.dart';
import 'package:baby_health/domain/widgets/image_picker.dart';
import 'package:baby_health/domain/widgets/radio_switch.dart';
import 'package:baby_health/domain/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPerson extends ConsumerStatefulWidget {
  const AddPerson({
    super.key,
  });

  @override
  ConsumerState<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends ConsumerState<AddPerson> {
  File? _selectedImage;
  final _nameControler = TextEditingController();
  final _lastNameControler = TextEditingController();
  final _ageControler = TextEditingController();
  final _weightControler = TextEditingController();
  final _growthControler = TextEditingController();

  void _savePerson() {
    final name = _nameControler.text;
    final lastName = _lastNameControler.text;
    final age = _ageControler.hashCode;
    final weight = _weightControler.hashCode;
    final growth = _weightControler.hashCode;

    if (name.isEmpty ||
        _selectedImage == null ||
        lastName.isEmpty ||
        age.isEven ||
        weight.isEven ||
        growth.isEven) {
      return;
    }

    ref.read(personsProvider.notifier).addPerson(
          _selectedImage!,
          name,
          lastName,
          age.ceilToDouble(),
          weight.ceilToDouble(),
          growth.ceilToDouble(),
        );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _nameControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Dodaj'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            ImagePickerWidget(
              onSelectImage: (image) {
                _selectedImage = image;
              },
            ),
            TextFieldWidget(
              title: 'Imie',
              controller: _nameControler,
            ),
            TextFieldWidget(
              title: 'Nazwisko',
              controller: _lastNameControler,
            ),
            TextFieldWidget(
              title: 'Wiek',
              controller: _ageControler,
            ),
            TextFieldWidget(
              title: 'Waga',
              controller: _weightControler,
            ),
            TextFieldWidget(
              title: 'Wzrost',
              controller: _growthControler,
            ),
            const SizedBox(height: 30),
            const RadioSwitch(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: _savePerson,
                  icon: Icons.check_circle_outline,
                ),
                MyButton(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icons.cancel_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
