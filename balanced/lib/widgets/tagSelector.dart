
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagSelector extends StatefulWidget {
  const TagSelector({super.key});

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  final List<String> tags = ['new', 'guest', 'secret','quote'];
  String selectedTag = 'new';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tags.map((tag) {
          final bool isSelected = tag == selectedTag;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ChoiceChip(
              label: Text(tag.toUpperCase()),
              selected: isSelected,
              avatar: isSelected ? const Icon(Icons.check, size: 16) : null,
              selectedColor: Colors.white,
              backgroundColor: Colors.white.withOpacity(0.3),
              labelStyle: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
              onSelected: (_) {
                setState(() {
                  selectedTag = tag;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        }).toList(),
      ),
    );
  }
}
