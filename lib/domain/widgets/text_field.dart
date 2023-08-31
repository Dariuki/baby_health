import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;

  const TextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: title,
          ),
          keyboardType: keyboardType,
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
