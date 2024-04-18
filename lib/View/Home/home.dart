import 'package:flutter/material.dart';
import 'package:nordic_mesh/Res/color.dart';
import 'package:nordic_mesh/View/Home/connected_devices.dart';
import 'package:nordic_mesh/View/Home/scan_new_devices.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          'Mesh Name',
          style: TextStyle(color: AppColors.secondaryBackgroundColor),
        ),
        backgroundColor: AppColors.appbar,
        bottom: TabBar(
          indicatorColor: AppColors.remove,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                'Connected',
                style: TextStyle(color: AppColors.backgroundColor),
              ),
            ),
            Tab(
              child: Text(
                'Scan new devices',
                style: TextStyle(color: AppColors.backgroundColor),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [ConnectedDevice(), ScanNewDevices()],
      ),
    );
  }
}
