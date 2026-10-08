import 'package:flutter/material.dart';
import 'package:my_new_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:my_new_app/features/home/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [const HomeTopBar(), DoctorsBlueContainer()]),
      ),
    );
  }
}
