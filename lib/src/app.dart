import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(),
          body: IndexedStack(
            index: Provider.of<BottomNavController>(context).pageIndex,
            children: [
              Container(
                child: const Center(child: Text('HOME')),
              ),
              Container(
                child: const Center(child: Text('SEARCH')),
              ),
              Container(
                child: InkWell(
                  onTap: () => context.pushNamed('upload'),
                  child: const Center(
                    child: Text('UPLOAD'),
                  ),
                ),
              ),
              Container(
                child: const Center(child: Text('ACTIVITY')),
              ),
              Container(
                child: const Center(child: Text('MYPAGE')),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: Provider.of<BottomNavController>(context).pageIndex,
            elevation: 0,
            onTap: (value) =>
                Provider.of<BottomNavController>(context, listen: false)
                    .changeBottomNav(value),
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
