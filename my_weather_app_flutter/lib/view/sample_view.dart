import 'package:flutter/material.dart';

class SampleView extends StatelessWidget {
  const SampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sample View'),
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
