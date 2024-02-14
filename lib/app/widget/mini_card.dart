import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiniCard extends StatelessWidget {
  final String image;
  final Function() onTap;

  const MiniCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 80,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(80),
          child: SvgPicture.network(
            image,
            fit: BoxFit.fitHeight,
            placeholderBuilder: (BuildContext context) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
