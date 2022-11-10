import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:league_app/constant/color.dart';
import 'package:league_app/controller/list_data_controller.dart';
import 'package:league_app/screen/detail_team_screen.dart';
import 'package:league_app/screen/widget/league__box.dart';
import 'package:league_app/style/margin.dart';

import '../model/team_model.dart';
import '../style/typograph.dart';

class ListTeamScreen extends StatefulWidget {
  const ListTeamScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ListTeamScreen> createState() => _ListTeamScreenState();
}

class _ListTeamScreenState extends State<ListTeamScreen> {
  ListTeamController listTeamController = Get.put(ListTeamController());
  List<Teams> teams = [];
  int page = 1;
  List<Teams> pagination = [];
  ScrollController controller = ScrollController();
  bool loading = false;
  bool allowLoad = true;

  @override
  void initState() {
    getData();
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 10) {
        addPage();
      }
    });
  }

  getData() async {
    var res = await listTeamController.getData();
    if (res is List<Teams>) {
      setState(() {
        teams = res;
      });
      List<Teams> temp = [];
      for (var i = 0; i < 5; i++) {
        temp.add(teams[i]);
      }
      setState(() {
        pagination = temp;
      });
      print(pagination.length);
    }
  }

  addPage() {
    if (!loading && allowLoad) {
      setState(() {
        page++;
      });
      List<Teams> temp = [];

      setState(() {
        loading = true;
      });
      int lastIndex = page * 5;
      int firstIndex = (page - 1) * 5;
      if (lastIndex > teams.length) {
        lastIndex = teams.length;
        setState(() {
          allowLoad = false;
        });
      }
      for (var i = firstIndex; i < lastIndex; i++) {
        temp.add(teams[i]);
      }
      Future.delayed(const Duration(milliseconds: 1500), () {
        setState(() {
          pagination.addAll(temp);
          loading = false;
        });
      });
    }
  }

  void refresh() {
    listTeamController.getData();
    setState(() {
      pagination = [];
      teams = [];
      page = 1;
      allowLoad = true;
      loading = false;
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            color: colorPalette5.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
            child: size.width > 1000
                ? Row(
                    children: [headDiv(size), Expanded(child: scrollDiv(size))],
                  )
                : Column(
                    // direction: size.width > 1000 ? Axis.horizontal : Axis.vertical,
                    children: [headDiv(size), Expanded(child: scrollDiv(size))],
                  ),
          ),
        ));
  }

  Widget headDiv(Size size) {
    return Container(
      width: size.width > 1000 ? 0.4 * size.width : size.width,
      height: size.width > 1000 ? size.height : null,
      color: colorPalette3,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.width > 1000 ? 45 : 25,
            horizontal: size.width > 1000 ? 25 : 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: size.width > 1000
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: size.width > 1000
                    ? 125
                    : size.width > 700
                        ? 100
                        : 70,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage(
                  'asset/images/epl_logo.jpg',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'English Premier League',
                style: h2.copyWith(color: Colors.white),
              )
            ]),
      ),
    );
  }

  Widget scrollDiv(Size size) {
    return RefreshIndicator(
      onRefresh: () async {
        refresh();
      },
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: size.width > 1000 ? 20 : 10,
            runSpacing: size.width > 1000 ? 20 : 10,
            children: [
              ...pagination.map((e) => LeagueBox(
                  location: e.strStadiumLocation ?? '',
                  nickname: e.strKeywords ?? "",
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailTeamScreen(detail: e)));
                  },
                  league: e.strStadium ?? '',
                  image: e.strTeamBadge ?? '',
                  title: e.strTeam ?? '')),
              Obx(() => listTeamController.loading.value || loading
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: colorPalette3,
                          backgroundColor: colorPalette5,
                        ),
                      ),
                    )
                  : !allowLoad
                      ? const SizedBox()
                      : Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.symmetric(horizontal: padding2),
                          width: size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: padding2, horizontal: padding3),
                                  primary: colorPalette6,
                                  onPrimary: Colors.white),
                              onPressed: () {
                                addPage();
                              },
                              child: Text(
                                'Load More',
                                style: h4.copyWith(color: Colors.white),
                              )),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
