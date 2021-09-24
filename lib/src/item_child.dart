import 'package:flutter/material.dart';

class ItemChild extends StatelessWidget {
  /// index of the menu child item.
  final int index;

  /// Item menu child onTap function.
  final VoidCallback onTap;

  /// Title of the item menu child.
  final String title;

  /// Text Style of the menu child item.
  final TextStyle? style;

  const ItemChild({
    Key? key,
    required this.index,
    required this.title,
    required this.onTap,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: style ??
            const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
