import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/image_string.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/size/size.dart';
import 'package:kenema/widgets/gradient_elevated_button/gradient_elevated_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SizedBox(
          height: 100.screenHeight,
          width: 100.screenWidth,
          child: Stack(
            children: [
              // Positioned(
              //   child: Container(
              //     width: 90.screenWidth,
              //     height: 30.screenHeight,
              //     child: CustomPaint(
              //       painter: HalfCirclePainer(),
              //     ),
              //   ),
              // ),
              Positioned(
                child: Container(
                  width: 100.screenWidth,
                  height: 70.screenHeight,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          CImages.familyImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Image.asset(
                          CImages.pattern1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(CSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.screenWidth,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Helping Society get Healthier!',
                          style: TextStyle(
                            color: CColors.textSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: CSizes.md),
                      const Text(
                        'Ensuring every resident of Addis Ababa has access to high-quality medicines and medical supplies.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CColors.textSecondaryLight,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: CSizes.spaceBtwSections),
                      GradientElevatedButton(
                        width: 100.screenWidth,
                        height: 55,
                        borderRadius: BorderRadius.circular(8.0),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: CColors.accent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
