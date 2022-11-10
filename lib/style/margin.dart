import 'package:flutter/cupertino.dart';
import 'package:league_app/style/responsive.dart';

SizedBox height5 = SizedBox(
  height: responsive(
    12,
    10,
    8,
    5,
  ),
);
SizedBox height8 = SizedBox(
  height: responsive(16, 12, 10, 8),
);
SizedBox height10 = SizedBox(
  height: responsive(20, 16, 12, 10),
);
SizedBox height15 = SizedBox(
  height: responsive(30, 24, 18, 15),
);
SizedBox height20 = SizedBox(
  height: responsive(40, 32, 24, 20),
);
SizedBox height25 = SizedBox(
  height: responsive(50, 42, 32, 25),
);
SizedBox height30 = SizedBox(
  height: responsive(60, 50, 38, 30),
);

double padding1 = responsive(12, 10, 7, 5) ?? 0;
double padding2 = responsive(16, 12, 10, 8) ?? 0;
double padding3 = responsive(20, 16, 12, 10) ?? 0;
double padding4 = responsive(30, 24, 18, 15) ?? 0;
double padding5 = responsive(40, 32, 24, 20) ?? 0;
