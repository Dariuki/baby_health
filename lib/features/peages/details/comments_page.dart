import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color.fromARGB(115, 227, 206, 206),
          child: const Text('uwagi'),
        ),
      ),
    );
  }
}
