/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/ddeok_bok_gi.jpg
  AssetGenImage get ddeokBokGi =>
      const AssetGenImage('assets/img/ddeok_bok_gi.jpg');

  /// File path: assets/img/pizza_ddeok_bok_gi.jpg
  AssetGenImage get pizzaDdeokBokGi =>
      const AssetGenImage('assets/img/pizza_ddeok_bok_gi.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [ddeokBokGi, pizzaDdeokBokGi];
}

class $AssetsRiveGen {
  const $AssetsRiveGen();

  /// File path: assets/rive/basketball.riv
  String get basketball => 'assets/rive/basketball.riv';

  /// List of all assets
  List<String> get values => [basketball];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bell_icon.svg
  String get bellIcon => 'assets/svg/bell_icon.svg';

  /// File path: assets/svg/check_circle_icon.svg
  String get checkCircleIcon => 'assets/svg/check_circle_icon.svg';

  /// File path: assets/svg/facebook_social_icon.svg
  String get facebookSocialIcon => 'assets/svg/facebook_social_icon.svg';

  /// File path: assets/svg/instagram_icon.svg
  String get instagramIcon => 'assets/svg/instagram_icon.svg';

  /// File path: assets/svg/phone_icon.svg
  String get phoneIcon => 'assets/svg/phone_icon.svg';

  /// File path: assets/svg/send_icon.svg
  String get sendIcon => 'assets/svg/send_icon.svg';

  /// File path: assets/svg/tool_tools_icon.svg
  String get toolToolsIcon => 'assets/svg/tool_tools_icon.svg';

  /// List of all assets
  List<String> get values => [
        bellIcon,
        checkCircleIcon,
        facebookSocialIcon,
        instagramIcon,
        phoneIcon,
        sendIcon,
        toolToolsIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsRiveGen rive = $AssetsRiveGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
