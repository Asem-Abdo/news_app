import 'package:flutter/material.dart';

class DrobDownBottomItem extends StatelessWidget {
  const DrobDownBottomItem({
    super.key,
    this.initialValue = '',
    required this.items,
    required this.onChanged,
  });

  final String initialValue;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      initialValue: initialValue,
      items: items,
      onChanged: onChanged,
    );
  }
}
