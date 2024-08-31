import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenema/store/prescription_store.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/size/size.dart';
import 'package:provider/provider.dart';

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
    var prescriptions = Provider.of<prescriptionStore>(context, listen: false);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Loop through each prescription group
            for (var pre in prescriptions.prescriptions!.prescriptions!)
              Container(
                child: GridView.builder(
                  shrinkWrap: true, // Allow GridView to wrap its contents
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                    crossAxisSpacing: 10.0, // Spacing between columns
                    childAspectRatio: 5, // Adjust the aspect ratio as needed
                  ),
                  itemCount: pre.drugPrescriptions?.length ?? 0,
                  itemBuilder: (context, index) {
                    final prescription = pre.drugPrescriptions![index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white, // Background color for each item
                      ),
                      padding: EdgeInsets.all(6), // Padding of 6
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${prescription.productName}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${prescription.instruction}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
