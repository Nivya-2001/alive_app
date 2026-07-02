import 'size_config.dart';

extension ResponsiveExtension on num {
  double get dp => this * SizeConfig.blockSizeHorizontal;

  double get sp => this * SizeConfig.textScaleFactor;

  double get r {
    final scale = SizeConfig.blockSizeHorizontal < SizeConfig.blockSizeVertical
        ? SizeConfig.blockSizeHorizontal
        : SizeConfig.blockSizeVertical;
    return this * scale;
  }
}