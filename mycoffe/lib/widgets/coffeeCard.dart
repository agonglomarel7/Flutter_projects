

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;

  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                coffee.image,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    alignment: Alignment.center,
                    child: const Icon(Icons.local_cafe, size: 40, color: Colors.white),
                  );
                },
              ),
            ),
          ),

          // Nom + Label
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                if (coffee.isBest)
                  const Text('Best Coffee',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),

          // Prix + Bouton
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${coffee.price}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    iconSize: 20,
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
