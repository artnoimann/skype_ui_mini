import 'package:flutter/material.dart';
import 'package:skype_static_ui/utils/bottomBarNavigationList.dart';
import 'package:skype_static_ui/view/screens/loading_screen.dart';

class PreloaderScreen extends StatefulWidget {
  const PreloaderScreen({Key? key}) : super(key: key);

  @override
  State<PreloaderScreen> createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  int _page = 0;
  bool _loadingScreen = true;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    initialization();
    pageController = PageController();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loadingScreen = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loadingScreen
        ? Scaffold(
            body: LoadingScreen(),
          )
        : Scaffold(
            body: PageView(
              children: routesBottomNavigationBar,
              // physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    // blurStyle: BlurStyle.solid,
                    blurRadius: 0.5,
                    color: Colors.grey,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: _page,
                selectedItemColor: Colors.lightBlue,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat,
                    ),
                    label: 'Chats',
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.call,
                    ),
                    label: 'Calls',
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.perm_contact_calendar_sharp,
                    ),
                    label: 'Contacts',
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_active_outlined,
                    ),
                    label: 'Notices',
                    backgroundColor: Colors.white,
                  ),
                ],
                onTap: navigationTapped,
              ),
            ),
          );
  }
}
