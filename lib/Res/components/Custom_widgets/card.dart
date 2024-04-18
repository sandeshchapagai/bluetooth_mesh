import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nordic_mesh/Res/color.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String sn;
  final VoidCallback? onPressedButton1;
  final VoidCallback? onPressedButton2;
  final Color dotcolor;
  final Color color1;
  final Color color2;
  final Icon? icon1; // Making icon1 nullable
  final Icon icon2;

  final String subtitle;

  const CustomCard({
    Key? key,
    required this.name,
    required this.subtitle,
    this.onPressedButton1,
    this.onPressedButton2,
    required this.dotcolor,
    required this.color2,
    required this.icon2,
    required this.sn,
    this.icon1, // Making icon1 optional
    this.color1 = Colors.black, // Providing default value for color1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sn + '\t\t' + name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(subtitle),
                      SizedBox(width: 5),
                      Text(
                        '•',
                        style: TextStyle(color: dotcolor, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              if (icon1 != null) // Conditionally include icon1 if it's not null
                IconButton(
                  onPressed: onPressedButton1,
                  icon: icon1!,
                  color: color1, // Apply color1 if provided
                ),
              IconButton(
                onPressed: onPressedButton2,
                icon: icon2,
                color: color2, // Always apply color2
              )
            ],
          ),
        ),
      ),
    );
  }
}
