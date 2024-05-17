import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMiniCard extends StatelessWidget {
  final String image;
  final Function() onTap;

  const HomeMiniCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: 120,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(80),
          child: SvgPicture.network(
            image,
            fit: BoxFit.fitHeight,
            placeholderBuilder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
