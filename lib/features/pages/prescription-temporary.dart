import 'package:flutter/material.dart';
import 'package:kenema/store/prescription_store.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var prescriptions = Provider.of<prescriptionStore>(context, listen: false);
    var drugs = prescriptions.prescriptions?.prescriptions![0];
    print("hdhdh \n ${prescriptions.prescriptions}");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // Loop through each prescription group
          // for (var pre in prescriptions.prescriptions!.prescriptions!)
          Container(
            child: GridView.builder(
              shrinkWrap: true, // Allow GridView to wrap its contents
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                mainAxisSpacing: 10.0, // Spacing between rows
                crossAxisSpacing: 10.0, // Spacing between columns
                childAspectRatio: 3, // Adjust the aspect ratio as needed
              ),
              itemCount: drugs?.drugPrescriptions?.length ?? 0,
              itemBuilder: (context, index) {
                final prescription = drugs?.drugPrescriptions![index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white, // Background color for each item
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 12), // Adjust padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${prescription?.productName}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${prescription?.instruction}',
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
    );
  }
}
