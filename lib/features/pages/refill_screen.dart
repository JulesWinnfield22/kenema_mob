import 'package:flutter/widgets.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/sizes.dart';

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

class RefillScreen extends StatefulWidget {
  const RefillScreen({super.key});

  @override
  State<RefillScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<RefillScreen> {
  @override
  Widget build(BuildContext context) {
    return
        // backgroundColor: Colors.grey.shade100,

        SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "Popular coverages",
              style: TextStyle(
                color: CColors.textLabel.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 120,
              ),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector();
              },
            )
          ],
        ),
      ),
    );
  }
}
