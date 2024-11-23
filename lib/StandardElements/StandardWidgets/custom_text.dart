import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText({super.key, this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.figtree(
        textStyle: TextStyle(
            fontSize: size ?? 16,
            color: color ?? Colors.black,
            fontWeight: weight ?? FontWeight.normal),
      ),
    );
  }
}
