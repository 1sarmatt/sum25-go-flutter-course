
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final int age;
  final String? avatarUrl;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.age,
    this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey[200],
              child: avatarUrl != null
                  ? ClipOval(
                      child: Image.network(
                        avatarUrl!,
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text(
                            'J',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                    )
                  : const Text(
                      'J',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(email),
                  const SizedBox(height: 4),
                  Text('Age: $age'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}