import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomButtomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext ctx, int index) {
    switch (index) {
      case 0:
        ctx.go('/home/0');
        break;
      case 1:
        ctx.go('/home/1');
        break;
      case 2:
        ctx.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_rounded),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: "Categorias",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: "Favoritos",
        ),
      ],
    );
  }
}
