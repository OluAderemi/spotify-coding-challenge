import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    required this.press,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.size,
    this.weight,
    this.height,
    this.width,
  });

  final String? text;
  final VoidCallback press;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final double? size;
  final FontWeight? weight;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!, width: 0.5),
            color: buttonColor,
            borderRadius: BorderRadius.circular((50))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              style: GoogleFonts.montserrat(
                color: textColor,
                fontSize: size,
                fontWeight: weight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
