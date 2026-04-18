import 'package:flutter/material.dart';

class CashireMode extends StatelessWidget {
  const CashireMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cashire Mode'),
      ),
      body: const Center(
        child: Text('Welcome to Cashire Mode!'),
      ),
    );
  }
}