import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/size/size.dart';

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

// class CurrentScreenCubit extends Cubit<ScreenData> {
//   CurrentScreenCubit() : super(ScreenData());

//   void changeScreen(ScreenData newScreenData) {
//     // CLoggerHelper.error(newScreenData.title);
//     emit(newScreenData);
//   }
// }

class RefillScreen extends StatefulWidget {
  RefillScreen({super.key});

  @override
  State<RefillScreen> createState() => _RefillScreenState();
}

class _RefillScreenState extends State<RefillScreen> {
  List<ScreenData> ScreenDatas = [
    ScreenData(
        title: "Branches",
        subTitle: "Branches location detail",
        imageUrl: "assets/images/Preferences.png",
        arrow: ">"),
    ScreenData(
        title: "Branches",
        subTitle: "Branches location detail",
        imageUrl: "assets/images/Account.png",
        arrow: ">"),
    ScreenData(
        title: "Branches",
        subTitle: "Branches location detail",
        imageUrl: "assets/images/Setting.png",
        arrow: ">"),
    ScreenData(
        title: "Branches",
        subTitle: "Branches location detail",
        imageUrl: "assets/images/Terms&conditions.png",
        arrow: ">"),
    ScreenData(
        title: "Branches",
        subTitle: "Branches location detail",
        imageUrl: "assets/images/CheckUpdate.png",
        arrow: ">"),
    ScreenData(
      title: "Branches",
      subTitle: "Branches location detail",
      imageUrl: "assets/images/AboutHelp.png",
      arrow: ">",
    ),
    // ScreenData(
    //     title: "Branches",
    //     imageUrl: "assets/images/Logout.png",
    //     color: Color.fromARGB(255, 241, 37, 115),
    //     backgroundColor: Color.fromARGB(255, 250, 237, 237)),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                        fontSize: 20,
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
