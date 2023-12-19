import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  // * En esta variable enviaremos desde el goRouter que vista(VIEW) queremos cargar
  final Widget childView;

  const HomeScreen({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: CustomButtomNavigation(),
    );
  }
}
