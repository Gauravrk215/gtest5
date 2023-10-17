import '../../Entity/btest1/Gter1/Gter1_entity_list_screen.dart';

import 'dart:async';
// ignore: unused_import
import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:authsec_flutter/Entity/Productmodel/entity_list_screen.dart';
import 'package:authsec_flutter/Entity/imagemodel/imageentity_list_screen.dart';
import 'package:authsec_flutter/providers/token_manager.dart';
import 'package:authsec_flutter/resources/api_constants.dart';
import 'package:authsec_flutter/screens/login_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:authsec_flutter/providers/tab_navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class TabbedLayoutComponent extends StatefulWidget {
  final Map<String, dynamic> userData;
  const TabbedLayoutComponent({Key? key, required this.userData})
      : super(key: key);
  @override
  _TabbedLayoutComponentState createState() => _TabbedLayoutComponentState();
}

class _TabbedLayoutComponentState extends State<TabbedLayoutComponent> {
  int _currentTab = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void setTab(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userAuthKey = TokenManager.getToken().toString();

    print('user auth key is .....' + userAuthKey);

    List<Widget> screens = [
      HomeDashboardScreen(
        userData: widget.userData,
      ),

      const StaticChartsScreen(), // Add the new widget here
    ];

    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 50,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _logoutUser();
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 60.0,
                child: DrawerHeader(
                  // margin: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              ListTile(
                title: const Text('Menu 1'),
                onTap: () {
                  Navigator.pop(context); // Closes the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EntityListScreen(), //go to get all entity
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Menu 2'),
                onTap: () {
                  // Handle menu 2 tap
                  Navigator.pop(context); // Closes the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageEntityListScreen(), //go to get all entity
                    ),
                  );
                  // Add your logic for menu 2 here
                },
              ),
              ListTile(
                title: const Text('Menu 3'),
                onTap: () {
                  // Handle menu 2 tap
                  Navigator.pop(context); // Closes the drawer
                  // Add your logic for menu 2 here
                },
              ),

              // NEW MENU
ListTile(
                title: const Text('Gter1'),
                onTap: () {
                  Navigator.pop(context); // Closes the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          gter1_entity_list_screen(), //go to get all entity
                    ),
                  );
                },
              ),

            ],
          ),
        ),
        backgroundColor: const Color(0xfffefefe),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: googleNavBar(),
        body: screens.isEmpty
            ? const Text("Loading...")
            : ListView.builder(
                itemCount: screens.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => screens[index],
              ),
      ),
    );
  }

  Future<void> _logoutUser() async {
    try {
      String logouturl = "${ApiConstants.baseUrl}/token/logout";
      var response = await http.get(Uri.parse(logouturl));

      if (response.statusCode <= 209) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } else {
        const Text('failed to logout');
      }
    } catch (error) {
      print('Error occurred during logout: $error');
    }
  }

  Widget googleNavBar() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.18, vertical: 1),
        child: GNav(
          haptic: false,
          gap: 6,
          activeColor: const Color(0xFF0070BA),
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          duration: const Duration(milliseconds: 300),
          color: const Color(0xFF243656),
          tabs: [
            GButton(
              icon: FluentIcons.home_32_regular,
              iconSize: 36,
              text: 'Home',
              onPressed: () {
                print('home');
              },
            ),
            GButton(
              icon: FluentIcons.people_32_regular,
              iconSize: 36,
              text: 'Contacts',
              onPressed: () {
                print('contacts');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AllContactsScreen(
                //       setTab: setTab,
                //     ),
                //   ),
                // );
              },
            ),
            GButton(
              icon: Icons.wallet,
              text: 'Wallet',
              iconSize: 34,
              onPressed: () {
                print('wallet');
              },
            ),
          ],
          selectedIndex: _currentTab,
          onTabChange: _onTabChange,
        ),
      ),
    );
  }

  void _onTabChange(int index) {
    if (_currentTab == 1 || _currentTab == 2) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    Provider.of<TabNavigationProvider>(context, listen: false)
        .updateTabs(_currentTab);
    setState(() {
      _currentTab = index;
    });
  }

  Future<bool> _onBackPress() {
    if (_currentTab == 0) {
      return Future.value(true);
    } else {
      int lastTab =
          Provider.of<TabNavigationProvider>(context, listen: false).lastTab;
      Provider.of<TabNavigationProvider>(context, listen: false)
          .removeLastTab();
      setTab(lastTab);
    }
    return Future.value(false);
  }
}

class StaticChartsScreen extends StatelessWidget {
  const StaticChartsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context)
          .size
          .width, // Set the container width to the screen width
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 200,
              child: charts.BarChart(
                _createBarChartSeriesData(),
                animate: true,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: charts.LineChart(
                _createLineChartSeriesData(),
                animate: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createBarChartSeriesData() {
    final data = [
      OrdinalSales('Jan', 5),
      OrdinalSales('Feb', 25),
      OrdinalSales('Mar', 100),
      OrdinalSales('Apr', 75),
      OrdinalSales('May', 20),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
    ];
  }

  List<charts.Series<OrdinalSales, int>> _createLineChartSeriesData() {
    final data = [
      OrdinalSales(0, 5),
      OrdinalSales(1, 25),
      OrdinalSales(2, 100),
      OrdinalSales(3, 75),
      OrdinalSales(4, 20),
    ];

    return [
      charts.Series<OrdinalSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
    ];
  }
}

class OrdinalSales {
  final dynamic month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}

class HomeDashboardScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const HomeDashboardScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    var firstName = userData['firstName'].toString();
    return Container(
      // height: double.infinity,
      // width: double.infinity,
      width: MediaQuery.of(context)
          .size
          .width, // Set the container width to the screen width
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0xff1546A0),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 40, 14, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              '/images/hadwin_system/cloudsure-logo.png',
              height: 48,
              width: 48,
            ),
            const SizedBox(height: 20),
            Text(
              'Hello, ' + firstName + '!',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}