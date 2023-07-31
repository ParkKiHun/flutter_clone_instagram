import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(),
          body: Container(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: 0,
            onTap: (value) {},
            items: [
              BottomNavigationBarItem(
                icon: ImageData(icon: IconsPath.homeOff),
                activeIcon: ImageData(icon: IconsPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconsPath.searchOff),
                activeIcon: ImageData(icon: IconsPath.searchOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconsPath.uploadIcon),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconsPath.activeOff),
                activeIcon: ImageData(icon: IconsPath.activeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                ),
                label: 'home',
              ),
            ],
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
