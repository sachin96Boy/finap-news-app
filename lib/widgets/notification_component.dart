import 'package:flutter/material.dart';

class NotificationAlert extends StatelessWidget {
  const NotificationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Icon(Icons.notifications_none_outlined, color: Colors.white),
    );
  }
}
