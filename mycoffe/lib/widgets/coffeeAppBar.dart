import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoffeeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              "It's a Great Day for Coffee",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
