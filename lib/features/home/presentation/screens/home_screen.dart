import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../favorite/presentation/screens/favorite_screen.dart';
import '../widgets/custom_home_bottom_navigation_bar.dart';
import '../widgets/custom_home_drawer.dart';
import '../widgets/home_screen_content.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
      });
      _controller.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 280.w,
        child: CustomHomeDrawer(scaffoldKey: _scaffoldKey),
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          if (currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        children: [
          HomeScreenContent(
            scaffoldKey: _scaffoldKey,
            onSearchPressed: () => _onItemTapped(1),
          ),
          SearchScreen(scaffoldKey: _scaffoldKey),
          FavoriteScreen(scaffoldKey: _scaffoldKey),
          ProfileScreen(scaffoldKey: _scaffoldKey),
        ],
      ),
      bottomNavigationBar: CustomHomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
