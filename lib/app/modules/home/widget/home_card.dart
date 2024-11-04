import 'dart:io';

import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final Function() onTap;

  const HomeCard({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(80),
        child: Image.file(
          File(image),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
