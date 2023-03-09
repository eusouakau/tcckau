import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const ButtonWidget({super.key, 
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  });

  const ButtonWidget.gameTypeButton1(
      {super.key, required this.label, required this.onTap})
      : backgroundColor = AppColors.gameTypeButton1,
        fontColor = AppColors.white,
        borderColor = AppColors.border;

  const ButtonWidget.gameTypeButton2({super.key, required this.label, required this.onTap})
      : backgroundColor = AppColors.gameTypeButton2,
        fontColor = AppColors.white,
        borderColor = AppColors.border;

  const ButtonWidget.gameTypeButton3({super.key, required this.label, required this.onTap})
      : backgroundColor = AppColors.gameTypeButton3,
        fontColor = AppColors.white,
        borderColor = AppColors.border;

  const ButtonWidget.gameTypeButton4({super.key, required this.label, required this.onTap})
      : backgroundColor = AppColors.gameTypeButton4,
        fontColor = AppColors.white,
        borderColor = AppColors.border;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
