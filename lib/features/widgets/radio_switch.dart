import 'package:flutter/material.dart';

class RadioSwitch extends StatefulWidget {
  const RadioSwitch({super.key});

  @override
  State<RadioSwitch> createState() => _RadioSwitchState();
}

class _RadioSwitchState extends State<RadioSwitch> {
  bool isFemale = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            tileColor: Colors.deepOrangeAccent.shade100,
            title: const Text('Female'),
            value: true,
            groupValue: isFemale,
            onChanged: (value) => setState(() => isFemale = value!),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            tileColor: Colors.deepOrangeAccent.shade100,
            title: const Text('Male'),
            value: false,
            groupValue: isFemale,
            onChanged: (value) => setState(() => isFemale = value!),
          ),
        ),
      ],
    );
  }
}
