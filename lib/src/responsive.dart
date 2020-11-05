library responsive_widget;

import 'package:flutter/material.dart';

///You can set default breakpoints
ResponsiveController responsiveWidgetController = ResponsiveController();

///Responsive Builder Breakpoints
class ResponsiveController {
  ///Default Constructor
  factory ResponsiveController() => _instance;

  ResponsiveController._internal();

  static final ResponsiveController _instance =
      ResponsiveController._internal();

  ///You can set default break points
  ///in default :
  ///   [w] is screenWidth in Logical Pixels
  ///
  ///   [w] < 500 mobile ;
  ///
  ///   500 <= [w] < 700 wide mobile or tablet;
  ///
  ///   700 <= [w] < 1000 wide tablet or desktop;
  ///
  ///   1000 <= [w]  desktop
  void setDefaultBreakpoints(
      {double mobile = 500.0,
      double wideMobileOrTablet = 700.0,
      double wideTabletOrDesktop = 1000.0}) {
    _mobile = mobile;
    _mobileTablet = wideMobileOrTablet;
    _tabletDesktop = wideTabletOrDesktop;
  }

  ///If screen width less than [mobile]
  ///Responsive widgets build for [mobile]
  ///
  ///Default 500.0
  ///
  double get _mobileBreakPoint => _mobile;

  ///If screen width less than [wideMobileOrTablet]
  ///Responsive widgets build for [wideMobileOrTablet]
  ///
  ///Default 700.0
  ///
  double get _wideMobileOrTablet => _mobileTablet;

  ///If screen width less than [wideTabletOrDesktop]
  ///Responsive widgets build for [wideTabletOrDesktop]
  ///
  ///Default 1000.0
  ///
  double get _wideTabletOrDesktop => _tabletDesktop;

  ///Mobile
  ///if screen w < mobile
  double _mobile = 500.0;

  ///Wide Mobile or Tablet
  ///if ( w < mobileTablet && w < mobile )
  double _mobileTablet = 700.0;

  ///Wide Tablet or Desktop
  ///if ( w < tabletDesktop && w < mobileTablet )
  double _tabletDesktop = 1000.0;

  ///Desktop
  ///if (w > tabletDesktop )

}

///Responsive Builder
///
abstract class ResponsiveWidget extends StatelessWidget {
  ///default
  const ResponsiveWidget({Key key}) : super(key: key);

  ///
  Widget buildMobile(BuildContext context);

  ///
  Widget buildWideMobileOrTablet(BuildContext context);

  ///
  Widget buildWideTabletOrDesktop(BuildContext context);

  ///
  Widget buildDesktop(BuildContext context);

  ///Don't Use
  @deprecated
  @override
  Widget build(BuildContext context) {
    ///Responsive Controller
    final responsiveController = ResponsiveController();
    var screenW = MediaQuery.of(context).size.width;
    if (screenW < responsiveController._mobileBreakPoint) {
      return buildMobile(context);
    } else if (screenW < responsiveController._wideMobileOrTablet) {
      return buildWideMobileOrTablet(context);
    } else if (screenW < responsiveController._wideTabletOrDesktop) {
      return buildWideTabletOrDesktop(context);
    } else {
      return buildDesktop(context);
    }
  }
}

///
abstract class ResponsiveStatefulWidget extends StatefulWidget {
  ///
  const ResponsiveStatefulWidget({Key key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  ResponsiveState<StatefulWidget> createState();
}

///
abstract class ResponsiveState<T extends StatefulWidget> extends State<T> {
  ///
  Widget buildMobile(BuildContext context);

  ///
  Widget buildWideMobileOrTablet(BuildContext context);

  ///
  Widget buildWideTabletOrDesktop(BuildContext context);

  ///
  Widget buildDesktop(BuildContext context);

  ///Don't use
  @override
  @deprecated
  Widget build(BuildContext context) {
    ///Responsive Controller
    final responsiveController = ResponsiveController();
    var screenW = MediaQuery.of(context).size.width;
    if (screenW < responsiveController._mobileBreakPoint) {
      return buildMobile(context);
    } else if (screenW < responsiveController._wideMobileOrTablet) {
      return buildWideMobileOrTablet(context);
    } else if (screenW < responsiveController._wideTabletOrDesktop) {
      return buildWideTabletOrDesktop(context);
    } else {
      return buildDesktop(context);
    }
  }
}
