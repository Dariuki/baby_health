import 'package:baby_health/domain/widgets/image_picker.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ImagePickerWidget(),
      ),
    );
  }
}
