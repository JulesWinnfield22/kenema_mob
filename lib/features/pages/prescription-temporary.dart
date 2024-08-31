import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kenema/features/equbs/api/prescription_api.dart';
import 'package:kenema/store/prescription_store.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/size/size.dart';
import 'package:provider/provider.dart';

class ScreenData extends Equatable {
  final String? title;
  final String? subTitle;
  final String? imageUrl;
  final String? arrow;
  final Color? color;
  final Color? backgroundColor;

  final Widget? screen;

  ScreenData(
      {this.color,
      this.backgroundColor,
      this.arrow,
      this.title,
      this.subTitle,
      this.screen,
      this.imageUrl});
  @override
  List<Object?> get props => [title, screen, subTitle];
}

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<ScreenData> ScreenDatas = [
    ScreenData(
        title: "Preferences",
        subTitle: "Choose products you prefer to see.",
        imageUrl: "assets/images/Preferences.png",
        arrow: ">"),
    ScreenData(
        title: "Profile",
        subTitle: "Choose products you prefer to see.",
        imageUrl: "assets/images/Account.png",
        arrow: ">"),
    ScreenData(
        title: "Account settings",
        subTitle: "information about your device ",
        imageUrl: "assets/images/Setting.png",
        arrow: ">"),
    ScreenData(
        title: "Terms & conditions ",
        subTitle: "Read the our terms and conditions ",
        imageUrl: "assets/images/Terms&conditions.png",
        arrow: ">"),
    ScreenData(
        title: "Check for update",
        subTitle: "Check for application update.",
        imageUrl: "assets/images/CheckUpdate.png",
        arrow: ">"),
    ScreenData(
      title: "About",
      subTitle: "About Lion insurance S.C.",
      imageUrl: "assets/images/AboutHelp.png",
      arrow: ">",
    ),
    ScreenData(
        title: "Logout",
        imageUrl: "assets/images/Logout.png",
        color: Color.fromARGB(255, 241, 37, 115),
        backgroundColor: Color.fromARGB(255, 250, 237, 237)),
  ];

  @override
  Widget build(BuildContext context) {
    var prescriptions = Provider.of<prescriptionStore>(context, listen: false);

    return SingleChildScrollView(
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
    );
  }
}
