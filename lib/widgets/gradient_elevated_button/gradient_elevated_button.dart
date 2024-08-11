
import 'package:flutter/material.dart';
import 'package:kenema/utils/constants/colors.dart';

class GradientElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const GradientElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient =
        const LinearGradient(colors: [CColors.primary, CColors.primary]),
  }) : super(key: key);

  //   const GradientElevatedButton({
  //   Key? key,
  //   required this.onPressed,
  //   required this.child,
  //   this.borderRadius,
  //   this.width,
  //   this.height = 44.0,
  //   this.gradient =
  //       const LinearGradient(colors: [CColors.lightBlue, CColors.darkBlue]),
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
