import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import '../../Res/color.dart';
import '../../Res/components/Custom_widgets/card.dart';

class ScanNewDevices extends StatefulWidget {
  const ScanNewDevices({Key? key}) : super(key: key);

  @override
  State<ScanNewDevices> createState() => _ScanNewDevicesState();
}

class _ScanNewDevicesState extends State<ScanNewDevices> {
  late final FlutterReactiveBle _ble;
  late StreamSubscription<DiscoveredDevice> _scanSubscription;
  final List<DiscoveredDevice> _devices = [];
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    _ble = FlutterReactiveBle();
    _startScan();
  }

  @override
  void dispose() {
    _scanSubscription.cancel();
    super.dispose();
  }

  void _startScan() {
    setState(() {
      _isScanning = true;
      _devices.clear();
    });

    _scanSubscription = _ble.scanForDevices(
      withServices: [],
    ).listen((device) {
      setState(() {
        _devices.add(device);
      });
    });
  }

  void _stopScan() {
    setState(() {
      _isScanning = false;
    });
    _scanSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _devices.length,
            itemBuilder: (context, index) {
              final device = _devices[index];
              return CustomCard(
                name: device.name ?? 'Unknown Device',
                subtitle: 'pair',
                dotcolor: AppColors.offline,
                color1: AppColors.mm,
                color2: AppColors.remove,
                icon2: Icon(
                  Icons.add,
                  color: AppColors.disconnect,
                ),
                sn: '${index + 1}.',
              );
            },
          ),
          if (_isScanning)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: Container(
        width: 200,
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: _isScanning ? _stopScan : _startScan,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.connect,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            _isScanning ? 'Stop Scan' : 'Start Scan',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
