import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RepoStatCard extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  final Color color1;
  final Color color2;

  const RepoStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    final formattedValue = NumberFormat.compact().format(value);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1.withAlpha(25), color2.withAlpha(25)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(25)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(icon, color: color1, size: 28),
            ],
          ),
          Text(
            formattedValue,
            style: const TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
