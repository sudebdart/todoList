import 'package:flutter/material.dart';

BottomNavigationBar navBar(index, onTapChange) {
  return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "New"),
        BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded), label: "Progress"),
        BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline), label: "Completed"),
        BottomNavigationBarItem(
            icon: Icon(Icons.cancel_outlined), label: "Canceled")
      ],
      currentIndex: index,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        onTapChange(index);
      });
}
