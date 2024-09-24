import 'package:flutter/material.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_entity.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.character,
  });
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: ShapeDecoration(
          color: const Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          shadows: const [
            BoxShadow(
              color: Color.fromARGB(255, 211, 211, 211),
              offset: Offset(0, 2),
              blurRadius: 1,
            ),
          ],
        ),
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                foregroundImage: NetworkImage(character.image),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      character.gender == 'Male'
                          ? const Icon(Icons.male, color: Colors.blue)
                          : const Icon(Icons.female, color: Colors.pink),
                      const SizedBox(width: 5),
                      Text(character.species,
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 10),
                      const Text('|'),
                      const SizedBox(width: 10),
                      Text('Status: ${character.status}',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  Text('From: ${character.origin['name']}'),
                  Text(
                    'Location: ${character.location['name']}',
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
