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

class CurrentPageIndex with ChangeNotifier {
  int _currentIndex = 0; // Assuming "Prescriptions" is at index 0

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Notify listeners of the change
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late ScreenData currentScreen;

  final List<ScreenData> screenDatas = [
    const ScreenData(
      title: "Home",
      icon: Icons.home_outlined,
      screen: Home(),
    ),
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
    return const DefaultTabController(
      length: 3,
      animationDuration: Duration.zero,
      child: Scaffold(
        body: TabBarView(children: [
          Home(),
          PrescriptioScreen(),
          RefillScreen(),
        ]),
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            dividerColor: Colors.transparent,
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: "Home"),
              Tab(icon: Icon(Icons.directions_transit), text: "Prescriptionsdfsdf"),
              Tab(icon: Icon(Icons.directions_bike), text: 'Refill',),
            ],
          ),
        ),
      ),
    );
  }
}
