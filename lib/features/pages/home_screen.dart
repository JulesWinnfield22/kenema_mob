import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenema/features/pages/home.dart';
import 'package:kenema/features/pages/prescription_screen.dart';
import 'package:kenema/features/pages/refill_screen.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/image_string.dart';
import 'package:kenema/utils/helpers/helper_function.dart';
import 'package:kenema/utils/size/size.dart';
import 'package:provider/provider.dart';

class ScreenData extends Equatable {
  final String? title;
  final IconData? icon;
  final Widget? screen;
  final String? subTitle;

  const ScreenData({
    this.subTitle,
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

class CurrentPageIndex with ChangeNotifier {
  int _currentIndex = 0; // Assuming "Prescriptions" is at index 0
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Notify listeners of the change
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var a = 0;
  ScreenData? currentScreen;
  void cp(idx) {
    setState(() {
      a = idx;
    });
  }

  final List<ScreenData> screenDatas = [
    ScreenData(
        title: "Home",
        icon: Icons.home_outlined,
        screen: Home(),
        subTitle: "Hello Birhane"),
    ScreenData(
        title: "Prescriptions",
        icon: Icons.home_outlined,
        screen: PrescriptioScreen(),
        subTitle: "Prescriptions"),
    ScreenData(
        title: "Branches",
        icon: Icons.shield_outlined,
        screen: RefillScreen(),
        subTitle: "Branches"),
  ];

  @override
  void initState() {
    currentScreen = screenDatas[0];
    super.initState();
  }

  void changePage(int index) {
    setState(() {
      currentScreen = screenDatas[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentIndexProvider = Provider.of<CurrentPageIndex>(context);
    final currentScreen = screenDatas[currentIndexProvider.currentIndex].screen;
    String? activeTitle =
        screenDatas[currentIndexProvider.currentIndex].subTitle;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            CImages.kenema,
            height: 90,
          ),
        ),
        actions: [
          Text(
            '$activeTitle',
            style: TextStyle(
              fontSize: 18,
              color: CColors.textLabel,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
      backgroundColor: CColors.primaryBackground,
      body: currentScreen,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 10,
        padding: EdgeInsets.all(0),
        child: Container(
          width: 100.screenWidth,
          height: 0,
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: screenDatas.map((data) {
              return Expanded(
                flex: 1,
                child: Container(
                  // onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: data.title ==
                                        screenDatas[currentIndexProvider
                                                .currentIndex]
                                            .title
                                    ? [CColors.primary, CColors.primary]
                                    : [Colors.transparent, Colors.transparent],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextButton(
                              onPressed: () {
                                final selectedIndex = screenDatas.indexOf(data);
                                context
                                    .read<CurrentPageIndex>()
                                    .setCurrentIndex(selectedIndex);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Icon(
                                  data.icon,
                                  size: 25,
                                  color: data.title ==
                                          screenDatas[currentIndexProvider
                                                  .currentIndex]
                                              .title
                                      ? CColors.white
                                      : CColors.textLabel,
                                ),
                              ),
                            )),
                      ),
                      Flexible(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [CColors.primary, CColors.primary],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds);
                          },
                          child: Text(
                            data.title!,
                            style: TextStyle(
                              // backgroundColor: Colors.yellow,
                              color: data.title ==
                                      screenDatas[
                                              currentIndexProvider.currentIndex]
                                          .title
                                  ? Colors.white
                                  : CColors.textLabel,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
