

import 'package:logger/logger.dart';



final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 80,
  ),
);


///region [ScreenUtils]
const bool DESIGN_SCREEN_ALLOW_FONT_SCALING = true;
const double DESIGN_SCREEN_HEIGHT = 812.0;
const double DESIGN_SCREEN_WIDTH = 375.0;
const double MIN_TABLET_WIDTH = 600.0;


///region Assets types
const String PNG = 'png';
const String SVG = 'svg';
const String RIV = 'riv';


///region Duration
const Duration kSeconds_5 = Duration(seconds: 5);
const Duration kSeconds_4 = Duration(seconds: 4);
const Duration kSeconds_3 = Duration(seconds: 3);
const Duration kSeconds_2 = Duration(seconds: 2);
const Duration kSeconds_1 = Duration(seconds: 1);
const Duration kMilliseconds_500 = Duration(milliseconds: 500);
const Duration lucifer = Duration(milliseconds: 666);