import 'package:baby_health/domain/models/person_model.dart';
import 'package:baby_health/features/peages/details/add_visit_page.dart';
import 'package:baby_health/features/peages/details/comments_page.dart';
import 'package:baby_health/features/peages/details/disease_history_page.dart';
import 'package:baby_health/features/peages/details/profile_page.dart';
import 'package:baby_health/features/peages/details/settings_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectetPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.personModel.name),
        ),
      ),
      body: [
        const AddVisit(),
        const DiseaseHistory(),
        Profile(widget.personModel),
        const Comments(),
        const Settings()
      ][selectetPage],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: selectetPage,
        style: TabStyle.titled,
        items: const [
          TabItem(
            icon: Icons.add_circle,
            title: 'Dodaj wizyte',
          ),
          TabItem(
            icon: Icons.library_books_sharp,
            title: 'Historia chorobowa',
          ),
          TabItem(
            icon: Icons.account_circle_sharp,
            title: 'Profil dziecka',
          ),
          TabItem(
            icon: Icons.announcement_rounded,
            title: 'Uwagi',
          ),
          TabItem(
            icon: Icons.settings,
            title: 'Ustawienia',
          ),
        ],
        onTap: (int index) {
          setState(() {
            selectetPage = index;
          });
        },
      ),
    );
  }
}
