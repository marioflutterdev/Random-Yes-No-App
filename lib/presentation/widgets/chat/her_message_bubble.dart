// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HerMessageWidget extends StatelessWidget {
  final String text;
  final String? imageUlr;

  const HerMessageWidget({Key? key, required this.text, this.imageUlr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _HerImage(imageUlr),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _HerImage extends StatelessWidget {
  final String? imageUlr;

  const _HerImage(this.imageUlr);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUlr ?? 'https://i.blogs.es/0ca9a6/aa/1366_2000.jpeg',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: size.width * 0.7,
            height: 150,
            child: Center(
              child: const Text('Cargando imagen...'),
            ),
          );
        },
      ),
    );
  }
}
