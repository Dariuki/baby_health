import 'dart:io';

import 'package:baby_health/domain/providers/person_pro.dart';
import 'package:baby_health/widgets/button.dart';
import 'package:baby_health/widgets/image_picker.dart';
import 'package:baby_health/widgets/radio_switch.dart';

import 'package:baby_health/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPerson extends ConsumerStatefulWidget {
  const AddPerson({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends ConsumerState<AddPerson> {
  File? _selectedImage;
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _growthController = TextEditingController();
  bool _isFemale = true;

  void _savePerson() {
    final name = _nameController.text;
    final lastName = _lastNameController.text;
    final age = int.tryParse(_ageController.text);
    final weight = double.tryParse(_weightController.text);
    final growth = double.tryParse(_growthController.text);

    if (name.isEmpty ||
        lastName.isEmpty ||
        age == null ||
        weight == null ||
        growth == null) {
      return;
    }

    ref.read(personsProvider.notifier).addPerson(
          _selectedImage!,
          name,
          lastName,
          age.toDouble(),
          weight,
          growth,
          _isFemale,
        );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _growthController.dispose();
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
                setState(() {
                  _selectedImage = image;
                });
              },
            ),
            TextFieldWidget(
              title: 'Imie',
              controller: _nameController,
              keyboardType: TextInputType.name,
            ),
            TextFieldWidget(
              title: 'Nazwisko',
              controller: _lastNameController,
              keyboardType: TextInputType.name,
            ),
            TextFieldWidget(
              title: 'Wiek',
              controller: _ageController,
              keyboardType: TextInputType.number,
            ),
            TextFieldWidget(
              title: 'Waga',
              controller: _weightController,
              keyboardType: TextInputType.number,
            ),
            TextFieldWidget(
              title: 'Wzrost',
              controller: _growthController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            RadioSwitch(
              isFemale: _isFemale,
              onChanged: (value) {
                setState(() {
                  _isFemale = value;
                });
              },
            ),
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
