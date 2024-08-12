import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/size/size.dart';

class FakeDataPopularCoverageModel {
  final String titleText;
  final String labelText;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Widget? routeTo;

  FakeDataPopularCoverageModel(
      {required this.titleText,
      required this.labelText,
      required this.icon,
      required this.iconColor,
      required this.iconBackgroundColor,
      this.routeTo});
}

class PrescriptioScreen extends StatefulWidget {
  const PrescriptioScreen({super.key});

  @override
  State<PrescriptioScreen> createState() => _PrescriptioScreenState();
}

class _PrescriptioScreenState extends State<PrescriptioScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Birhane,",
                  style: TextStyle(
                      fontSize: 18,
                      color: CColors.textLabel,
                      fontWeight: FontWeight.w100,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 24,
                    color: CColors.textLabel,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Popular coverages",
              style: TextStyle(
                color: CColors.textLabel.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              width: 100.screenWidth,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
