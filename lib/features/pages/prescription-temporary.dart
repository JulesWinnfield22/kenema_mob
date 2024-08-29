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
    print("abel  \n\n\n${prescriptions} \n\n\n");
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 24,
                    color: CColors.textLabel,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: ScreenDatas.map((popularCoverage) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 72,
                          width: 100.screenWidth,
                          decoration: BoxDecoration(
                            color:
                                popularCoverage.backgroundColor ?? Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: popularCoverage.color ??
                                    Colors.transparent),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Image.asset(
                                        //   popularCoverage.imageUrl ?? '',
                                        //   width: 40,
                                        //   height: 40,
                                        // ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              popularCoverage.title ?? '',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: CColors.textPrimary),
                                            ),
                                            Text(
                                              popularCoverage.subTitle ?? '',
                                              style: TextStyle(
                                                  color: CColors.textPrimary,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      popularCoverage.arrow ?? '',
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: CColors.textPrimary,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => popularCoverage.screen!));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
