import 'package:flutter/material.dart';
import 'package:nordic_mesh/Res/color.dart';
import 'package:nordic_mesh/Res/components/Custom_widgets/card.dart';

class ConnectedDevice extends StatefulWidget {
  const ConnectedDevice({Key? key}) : super(key: key);

  @override
  State<ConnectedDevice> createState() => _ConnectedDeviceState();
}

class _ConnectedDeviceState extends State<ConnectedDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: const [
          CustomCard(
          name: 'sm-g7',
          subtitle: 'paired',
          dotcolor: AppColors.connect,
          color1: AppColors.mm,
          color2: AppColors.remove,
          icon1: Icon(
            Icons.link_off,
            color: AppColors.mm,
          ),
          icon2: Icon(
            Icons.delete,
            color: AppColors.disconnect,
          ),
            sn: '1.',
        ),
          CustomCard(
            name: 'ys-609',
            subtitle: 'paired',
            dotcolor: AppColors.connect,
            color1: AppColors.mm,
            color2: AppColors.remove,
            icon1: Icon(
              Icons.link_off,
              color: AppColors.mm,
            ),
            icon2: Icon(
              Icons.delete,
              color: AppColors.disconnect,
            ),
            sn: '2.',
          ),
          CustomCard(
            name: 'pc-3',
            subtitle: 'unpaired',
            dotcolor: AppColors.disconnect,
            color1: AppColors.mm,
            color2: AppColors.remove,
            icon1: Icon(
              Icons.link,
              color: AppColors.connect,
            ),
            icon2: Icon(
              Icons.delete,
              color: AppColors.disconnect,
            ),
            sn: '3.',
          )
        ],
      ),
      floatingActionButton: Container(
        width: 200,
        height: 50,
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            // Add your action here
          },
          child: Text(
            'Disconnect all',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.disconnect,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  25),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
