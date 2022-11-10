import 'dart:async';
import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_app/constant/color.dart';
import 'package:league_app/model/team_model.dart';
import 'package:league_app/screen/list_team_screen.dart';
import 'package:league_app/style/margin.dart';
import 'package:url_launcher/url_launcher.dart';

import '../style/typograph.dart';

class DetailTeamScreen extends StatefulWidget {
  const DetailTeamScreen({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final Teams detail;
  @override
  State<DetailTeamScreen> createState() => _DetailTeamScreenState();
}

class _DetailTeamScreenState extends State<DetailTeamScreen> {
  Teams? detail;
  @override
  void initState() {
    detail = widget.detail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: colorPalette6,
            backgroundColor: colorPalette5.withOpacity(0.1),
            title: Text(
              'Detail Team ${detail!.strTeam ?? ''}',
              style: h3.copyWith(color: colorPalette3),
            ),
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width > 1000
                              ? 250
                              : size.width > 700
                                  ? 220
                                  : 150,
                          padding: const EdgeInsets.all(10),
                          child: CachedNetworkImage(
                            imageUrl: detail?.strTeamBadge ?? '',
                            placeholder: (context, url) {
                              return CircularProgressIndicator(
                                color: colorPalette3,
                                backgroundColor: colorPalette5,
                              );
                            },
                            imageBuilder: (context, imageProvider) {
                              return AspectRatio(
                                  aspectRatio: 1,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    child: Image(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          width: size.width > 1000 ? 20 : 10,
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: padding2, horizontal: padding2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detail!.strTeam ?? '',
                                style: h3.copyWith(color: colorPalette6),
                              ),
                              height10,
                              Text(
                                detail!.strKeywords ?? '',
                                style: h6.copyWith(color: colorPalette3),
                              ),
                              Text(
                                'Since ${detail!.intFormedYear}',
                                style: h6.copyWith(
                                    color: colorPalette3.withOpacity(0.8)),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: padding3,
                                            horizontal: padding4),
                                        primary: colorPalette6,
                                        onPrimary: Colors.white),
                                    onPressed: () {
                                      launchUrl(
                                          Uri.parse(detail!.strWebsite ?? ''));
                                    },
                                    child: Text(
                                      'Visit Website',
                                      style: h4.copyWith(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    childrenScroll(size)
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget childrenScroll(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding1, horizontal: padding2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10,
                color: colorPalette6,
                width: 0.1 * size.width,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'About Team',
                style: h4.copyWith(color: colorPalette3),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 10,
                  color: colorPalette6,
                  width: double.infinity,
                ),
              )
            ],
          ),
          Text(
            '${detail?.strDescriptionEN}',
            textAlign: TextAlign.justify,
            style: p.copyWith(color: colorPalette6),
          ),
          height20,
          Row(
            children: [
              Container(
                height: 10,
                color: colorPalette6,
                width: 0.1 * size.width,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Stadium',
                style: h4.copyWith(color: colorPalette3),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 10,
                  color: colorPalette6,
                  width: double.infinity,
                ),
              )
            ],
          ),
          height10,
          Text(
            '${detail!.strStadium}',
            style: h6.copyWith(color: colorPalette6),
          ),
          height5,
          Text(
            'Located at ${detail!.strStadiumLocation}, ${detail!.strStadiumDescription}',
            style: p.copyWith(color: colorPalette4),
          ),
          height20,
          Row(
            children: [
              Container(
                height: 10,
                color: colorPalette6,
                width: 0.1 * size.width,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Jersey',
                style: h4.copyWith(color: colorPalette3),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 10,
                  color: colorPalette6,
                  width: double.infinity,
                ),
              )
            ],
          ),
          height10,
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: size.width > 1000
                  ? 250
                  : size.width > 700
                      ? 200
                      : 140,
              padding: const EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: detail?.strTeamJersey ?? '',
                placeholder: (context, url) {
                  return CircularProgressIndicator(
                    color: colorPalette3,
                    backgroundColor: colorPalette5,
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
