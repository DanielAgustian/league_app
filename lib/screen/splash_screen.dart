import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_app/constant/color.dart';
import 'package:league_app/screen/list_team_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ListTeamScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: colorPalette6,
                  height: size.height * 0.5,
                  width: size.width,
                ),
                Container(
                  color: colorPalette3,
                  height: size.height * 0.5,
                  width: size.width,
                ),
              ],
            ),
            Align(
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'asset/images/epl_logo.jpg',
                      width: size.width > 1000
                          ? 320
                          : size.width > 700
                              ? 225
                              : size.width > 500
                                  ? 180
                                  : 160,
                    ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
