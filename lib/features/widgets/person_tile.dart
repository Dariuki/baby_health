import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {

  const PersonTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: const _TileLook(),
      ),
    );
  }
}

class _TileLook extends StatelessWidget {

  
  const _TileLook();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CircleAvatar(
          radius: 40,
        ),
        Row(
          children: [
            const Text(
              'Imie i nazwisko',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edytuj'),
            ),
          ],
        ),
      ],
    );
  }
}
