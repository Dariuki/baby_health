import 'package:baby_health/features/widgets/button.dart';
import 'package:baby_health/features/widgets/radio_switch.dart';
import 'package:baby_health/features/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddPerson extends StatelessWidget {
  const AddPerson({super.key});

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
            const SizedBox(height: 30),
            TextFieldWidget(
              title: 'Imie',
            ),
            TextFieldWidget(
              title: 'Nazwisko',
            ),
            TextFieldWidget(
              title: 'Wiek',
            ),
            TextFieldWidget(
              title: 'Waga',
            ),
            TextFieldWidget(
              title: 'Wzrost',
            ),
            const SizedBox(height: 30),
            const RadioSwitch(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: 'Save', onPressed: () {}),
                MyButton(text: 'Cancel', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
