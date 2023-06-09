import 'package:fashionhub/home_screen.dart';
import 'package:fashionhub/my_flutter_app_icons.dart';
import 'package:fashionhub/page2.dart';
import 'package:fashionhub/page3.dart';
import 'package:fashionhub/page4.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic selected;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: const Color.fromARGB(221, 251, 251, 251),
        items: [
          BottomBarItem(
            icon: Icon(
              MyFlutterApp.homeOutline
            ),
            selectedIcon: Icon(MyFlutterApp.home),
            selectedColor: themeColor,
            title: const Text(''),
          ),
          BottomBarItem(
            icon: Icon(MyFlutterApp.menu),
            selectedIcon: Icon(MyFlutterApp.menu),
            selectedColor: themeColor,
            title: const Text(''),
          ),
          BottomBarItem(
              icon: Icon(
                MyFlutterApp.shoppingBagOutline
              ),
              selectedIcon: Icon(
                MyFlutterApp.shoppingBag
              ),
              selectedColor: themeColor,
              title: const Text('')),
          BottomBarItem(
              icon: Icon(
                MyFlutterApp.personOutline
              ),
              selectedIcon: Icon(
                MyFlutterApp.personOutline
              ),
              selectedColor: themeColor,
              title: const Text('')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            
          });
        },
        backgroundColor: themeColor,
        child: Icon(
          MyFlutterApp.feedIconOutline,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            HomeScreen(),
            Page2(),
            Page3(),
            Page4(),
          ],
        ),
      ),
    );
  }
}
