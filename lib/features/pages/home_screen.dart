import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenema/features/pages/prescription_screen.dart';
import 'package:kenema/features/pages/refill_screen.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/image_string.dart';
import 'package:kenema/utils/helpers/helper_function.dart';
import 'package:kenema/utils/size/size.dart';

class ScreenData extends Equatable {
  final String? title;
  final IconData? icon;
  final Widget? screen;

  const ScreenData({
    this.title,
    this.icon,
    this.screen,
  });
  @override
  List<Object?> get props => [title, icon, screen];
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ScreenData> screenDatas = [
    const ScreenData(
      title: "Prescriptions",
      icon: Icons.home_outlined,
      screen: PrescriptioScreen(),
    ),
    const ScreenData(
      title: "Refill",
      icon: Icons.shield_outlined,
      screen: RefillScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              CImages.kenema,
              height: 50,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('home'),
              onTap: () {
                CHelperFunction.navigateToScreen(context, const HomeScreen(),
                    pushReplacement: true);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      backgroundColor: CColors.primaryBackground,
      body: SizedBox(
        height: 100.screenHeight,
        width: 100.screenWidth,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 10,
        child: Container(
          width: 100.screenWidth,
          height: 40,
          color: Colors.white,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: screenDatas.map((data) {
                return Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Icon(
                                data.icon,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Flexible(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [CColors.primary, CColors.primary],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: Text(
                              data.title!,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
