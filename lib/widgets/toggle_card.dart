import 'package:flutter/material.dart';

class ToggleCard extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;

  const ToggleCard({super.key, required this.isOn, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SwitchListTile(
        title: const Text(
          "Device Status",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(isOn ? "ON" : "OFF"),
        value: isOn,
        onChanged: onChanged,
      ),
    );
  }
}
