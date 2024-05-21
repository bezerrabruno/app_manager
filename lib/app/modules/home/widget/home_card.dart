import 'dart:io';

import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final Function() onTap;

  const HomeCard({super.key, required this.image, required this.onTap});

  File file() {
    return File(image);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(80),
        child: Image.file(
          file(),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
