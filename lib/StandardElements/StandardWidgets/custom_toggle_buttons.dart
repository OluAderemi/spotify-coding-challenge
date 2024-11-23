import 'package:flutter/material.dart';
import 'package:spotify_coding_challenge/StandardElements/StandardWidgets/custom_button.dart';
import 'package:spotify_coding_challenge/StandardElements/constants.dart';

class CustomToggleButtons extends StatelessWidget {
  final String selectedButton;
  final Function(String) onToggle;

  const CustomToggleButtons({
    super.key,
    required this.selectedButton,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          press: () => onToggle('Albums'),
          text: 'Albums',
          buttonColor: selectedButton == 'Albums' ? spotifyGreen : spotifyBlack,
          borderColor: selectedButton == 'Albums' ? spotifyGreen : spotifyWhite,
          textColor: selectedButton == 'Albums' ? spotifyWhite : spotifyWhite,
          weight: FontWeight.w500,
          height: 40,
          width: 100,
        ),
        const SizedBox(width: 20),
        CustomButton(
          press: () => onToggle('Artists'),
          text: 'Artists',
          buttonColor:
              selectedButton == 'Artists' ? spotifyGreen : spotifyBlack,
          borderColor:
              selectedButton == 'Artists' ? spotifyGreen : spotifyWhite,
          textColor: selectedButton == 'Artists' ? spotifyWhite : spotifyWhite,
          weight: FontWeight.w500,
          height: 40,
          width: 100,
        ),
      ],
    );
  }
}
