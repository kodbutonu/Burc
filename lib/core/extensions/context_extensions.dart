import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWith(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext {
  double get microValue => dynamicHeight(0.005);
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicWith(0.03);
  double get lesshighValue => dynamicHeight(0.033);
  double get highValue => dynamicHeight(0.06);
  double get high2Value => dynamicHeight(0.07);
  double get veryhigh2Value=>dynamicHeight(0.2);
  double get morehighvalue=> dynamicHeight(0.25);
  double get veryhighValue => dynamicHeight(0.35);
  double get extremeValue => dynamicHeight(0.4);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingOnlyTopMicro => EdgeInsets.only(top: microValue);
  EdgeInsets get paddingAllow => EdgeInsets.all(lowValue);
}

extension EmpytWidget on BuildContext {
  Widget get emptyWidget => SizedBox(
    height: lowValue,
  );
}

extension ThemeExtension on BuildContext {
  Brightness get brightness => MediaQuery.of(this).platformBrightness;
}

extension SpaceExtension on BuildContext {
  Widget get lowHeightSpace => SizedBox(
    height: dynamicHeight(0.01),
  );
  Widget get mediumHeightSpace => SizedBox(
    height: dynamicHeight(0.03),
  );
  Widget get highHeightSpace => SizedBox(
    height: dynamicHeight(0.05),
  );

  Widget get lowWidthSpace => SizedBox(
    width: dynamicWith(0.01),
  );
  Widget get mediumWidthSpace => SizedBox(
    width: dynamicWith(0.03),
  );
  Widget get highWidthSpace => SizedBox(
    width: dynamicWith(0.05),
  );
  Widget get exWidthSpace => SizedBox(
    width: dynamicWith(0.6),
  );
  Widget specificSpace(double height, double width) => SizedBox(
    height: dynamicHeight(height),
    width: dynamicWith(width),
  );
}