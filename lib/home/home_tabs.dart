import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:range_plus_flutter_app/home/home_page.dart';
import 'package:range_plus_flutter_app/logIn_screen/create_new_Account.dart';
import 'package:range_plus_flutter_app/logIn_screen/forget_password.dart';
import 'package:range_plus_flutter_app/logIn_screen/login_screen.dart';
import 'package:range_plus_flutter_app/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/home.png'),
            size: 2.5.h,
          ),
          title: "Home",
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.black,
          inactiveColorSecondary: Colors.black),
      PersistentBottomNavBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/search.png'),
            size: 2.5.h,
          ),
          title: "Search",
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.black,
          inactiveColorSecondary: Colors.black),
      PersistentBottomNavBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/ref.png'),
            size: 2.5.h,
          ),
          title: "ref",
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.black,
          inactiveColorSecondary: Colors.black),
      PersistentBottomNavBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/persion.png'),
            size: 2.5.h,
          ),
          title: "Profile",
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: CupertinoColors.black,
          inactiveColorSecondary: Colors.black),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const LoginScreen(),
      const SplashScreen(),
      const CreateNewAccount()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
    );
    ;
  }
}
