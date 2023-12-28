import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuBackgroundColor: Color.fromARGB(255, 122, 107, 76),
      shadowLayer1Color: const Color.fromARGB(255, 245, 245, 245),
      shadowLayer2Color: Color.fromARGB(255, 139, 138, 100).withOpacity(0.3),
      borderRadius: 50.0,
      showShadow: true,
      mainScreen: _buildMainScreen(context),
      menuScreen: _menuScreen(context),
      drawerShadowsBackgroundColor: Color.fromARGB(255, 133, 134, 96),
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }

  Scaffold _buildMainScreen(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      body: _buildBody(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 103, 83, 83),
        selectedItemColor: Color.fromARGB(255, 43, 38, 38),
        selectedFontSize: 14.0,
        selectedIconTheme: const IconThemeData(size: 28.0),
        unselectedIconTheme: IconThemeData(size: 25.0, color: Colors.grey[500]),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: List.generate(
          5,
          (index) => BottomNavigationBarItem(
            icon: _getIconForIndex(index),
            label: 'Item $index',
          ),
        ),
      ),
    );
  }

  Container _menuScreen(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                zoomDrawerController.toggle?.call();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text('Home'),
                onTap: () {
                  _navigateToPage(0);
                },
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.black),
                title: Text('Favorites'),
                onTap: () {
                  _navigateToPage(1);
                },
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.black),
                title: Text('AR'),
                onTap: () {
                  _navigateToPage(2);
                },
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.camera, color: Colors.black),
                title: Text('Camera'),
                onTap: () {
                  _navigateToPage(3);
                },
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.post_add, color: Colors.black),
                title: Text('Post'),
                onTap: () {
                  _navigateToPage(4);
                },
              ),
            ),
            // Add your other drawer items here
          ],
        ),
      ),
    );
  }

  Widget _buildBody(int selectedIndex) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Page $selectedIndex', style: TextStyle(fontSize: 24)),
      ),
    );
  }

  void _navigateToPage(int index) {
    setState(() {
      selectedIndex = index;
      zoomDrawerController.toggle?.call();
    });
  }

  Icon _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.home);
      case 1:
        return Icon(Icons.favorite);
      case 2:
        return Icon(Icons.star);
      case 3:
        return Icon(Icons.camera);
      case 4:
        return Icon(Icons.post_add);
      default:
        return Icon(Icons.apps);
    }
  }
}
