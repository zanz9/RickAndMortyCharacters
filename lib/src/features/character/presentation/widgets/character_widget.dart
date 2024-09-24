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
          color: Colors.white,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              foregroundImage: NetworkImage(character.image),
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Wrap(
                    children: [
                      character.gender == 'Male'
                          ? const Icon(Icons.male, color: Colors.blue)
                          : const Icon(Icons.female, color: Colors.pink),
                      const SizedBox(width: 5),
                      Text(character.species,
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 5),
                      const Text('|'),
                      const SizedBox(width: 5),
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
            ),
          ],
        ),
      ),
    );
  }
}
