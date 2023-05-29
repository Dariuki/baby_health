import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('safas'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Szcegóły',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'informacje o wizytach u lekarzy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_left_rounded),
            label: 'Szcegóły',
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 1) {
            return const Center(
              child: Text('informacje o wizytach u lekarzy'),
            );
          }
          if (currentIndex == 2) {
            return const Center(
              child: Text('szczeguły'),
            );
          }
          return Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              color: Colors.amber,
              child: const Text('hadsihasbf'),
            ),
          );
        },
      ),
    );
  }
}
