import 'package:flutter/material.dart';

class RadioSwitch extends StatelessWidget {
  const RadioSwitch({
    super.key,
    required this.isFemale,
    required this.onChanged,
  });

  final bool isFemale;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    Color tileColor = isFemale ? Colors.pinkAccent : Colors.blueAccent;

    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.all(0),
            tileColor: tileColor,
            title: const Text('Female'),
            value: true,
            groupValue: isFemale,
            onChanged: (value) => onChanged(value!),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: RadioListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.all(0),
            tileColor: tileColor,
            title: const Text('Male'),
            value: false,
            groupValue: isFemale,
            onChanged: (value) => onChanged(value!),
          ),
        ),
      ],
    );
  }
}
