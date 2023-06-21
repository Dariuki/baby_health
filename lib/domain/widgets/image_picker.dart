import 'dart:io';

import 'package:baby_health/domain/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveFilePermanently(image.path);

      setState(() => _image = imagePermanent);
    } on PlatformException catch (e) {
      ('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: image(),
            ),
            Positioned(
                bottom: 20,
                right: 20,
                child: InkWell(
                  onTap: () {
                    showBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheat(context)),
                    );
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                    size: 20,
                  ),
                ))
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget bottomSheat(context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        const Text(
          'Choose Profile photo',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              text: 'Galery',
              onPressed: () {
                pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              icon: Icons.image_outlined,
            ),
            const SizedBox(width: 20),
            MyButton(
              text: 'camera',
              onPressed: () {
                pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              icon: Icons.camera_alt_outlined,
            ),
          ],
        ),
      ]),
    );
  }

  image() => _image == null
      ? const AssetImage('images/ludzik.png')
      : FileImage(File(_image!.path));
}
