import 'package:flutter/material.dart';

class Nouveau extends StatefulWidget {
  @override
  State<Nouveau> createState() => _NouveauState();
}

class _NouveauState extends State<Nouveau> {
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
              "Vous n'avez pas de nouveau ticket !",
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
