import 'package:flutter/material.dart';

class Ancien extends StatefulWidget {
  @override
  State<Ancien> createState() => _AncienState();
}

class _AncienState extends State<Ancien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            Container(
              height: 120.0,
              width: 120.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/tickets.png',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Vous n'avez pas d'ancien ticket !",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
