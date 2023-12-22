import 'package:flutter/material.dart';

class MainCardOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: const SizedBox(
        width: 300,
        height: 100,
        child: Center(child: Text('Outlined Card')),
      ),
    );
  }
}
