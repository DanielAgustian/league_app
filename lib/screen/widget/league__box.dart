import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:league_app/constant/color.dart';
import 'package:league_app/style/flex_box.dart';

import '../../style/typograph.dart';

class LeagueBox extends StatelessWidget {
  final String image;
  final String title;
  final String league;
  final Function onClick;
  final String nickname;
  final String location;
  const LeagueBox(
      {super.key,
      required this.image,
      required this.title,
      required this.league,
      required this.onClick,
      required this.nickname,
      required this.location});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlexBox(
        init: 12,
        sm: 12,
        md: 12,
        lg: 6,
        spacingHorizontal: size.width > 1000 ? 20 : 10,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: colorPalette5.withOpacity(0.1),
          child: InkWell(
            onTap: () {
              onClick();
            },
            child: Row(
              children: [
                Container(
                  width: size.width > 1000
                      ? 230
                      : size.width > 700
                          ? 200
                          : 130,
                  padding: const EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    imageUrl: image,
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
                  width: size.width > 1000 ? 15 : 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: h4.copyWith(color: colorPalette3),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '$league ( $location )',
                          style: label.copyWith(color: colorPalette5),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nickname: ',
                              style: label.copyWith(
                                color: colorPalette5,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                nickname,
                                style: label.copyWith(
                                    color: colorPalette3,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
