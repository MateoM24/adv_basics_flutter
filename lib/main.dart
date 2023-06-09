import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  const colors = [
    Color.fromARGB(255, 82, 51, 190),
    Color.fromARGB(255, 106, 20, 128)
  ];
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: const Center(
            child: Home(),
          )),
    ),
  ));
}
