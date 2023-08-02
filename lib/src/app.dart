import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/pages/home.dart';
import 'package:flutter_clone_instagram/src/pages/search.dart';
import 'package:flutter_clone_instagram/src/viewmodel/bottom_nav_viewmodel.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({super.key});

  late BottomNavViewModel _bottomNavViewModel;

  @override
  Widget build(BuildContext context) {
    _bottomNavViewModel =
        Provider.of<BottomNavViewModel>(context, listen: false);

    return WillPopScope(
        onWillPop: () => _bottomNavViewModel.willPopAction(context),
        child: Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: Provider.of<BottomNavViewModel>(context).pageIndex,
              children: [
                const Home(),
                const Search(),
                Container(
                  child: const Center(child: Text('UPLOAD')),
                ),
                Container(
                  child: const Center(child: Text('ACTIVITY')),
                ),
                Container(
                  child: const Center(child: Text('MYPAGE')),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _bottomNavViewModel.pageIndex,
            elevation: 0,
            onTap: (value) =>
                _bottomNavViewModel.changeBottomNav(value, context),
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
        ));
  }
}
