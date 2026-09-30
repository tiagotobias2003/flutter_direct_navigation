import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int count;

  const TitleSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(subtitle, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const SizedBox(width: 4),
          Text('$count'),
        ],
      ),
    );
  }
}
