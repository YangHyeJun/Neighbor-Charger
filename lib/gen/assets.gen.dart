/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/icon
  $AssetsImagesIconGen get icon => const $AssetsImagesIconGen();

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_mini_car.png
  AssetGenImage get splashMiniCar =>
      const AssetGenImage('assets/images/splash_mini_car.png');

  /// List of all assets
  List<AssetGenImage> get values => [splash, splashMiniCar];
}

class $AssetsImagesIconGen {
  const $AssetsImagesIconGen();

  /// Directory path: assets/images/icon/bank
  $AssetsImagesIconBankGen get bank => const $AssetsImagesIconBankGen();

  /// File path: assets/images/icon/clear_input.png
  AssetGenImage get clearInput =>
      const AssetGenImage('assets/images/icon/clear_input.png');

  /// File path: assets/images/icon/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/icon/facebook.png');

  /// File path: assets/images/icon/kakao.png
  AssetGenImage get kakao =>
      const AssetGenImage('assets/images/icon/kakao.png');

  /// File path: assets/images/icon/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/images/icon/location.png');

  /// File path: assets/images/icon/naver.png
  AssetGenImage get naver =>
      const AssetGenImage('assets/images/icon/naver.png');

  /// File path: assets/images/icon/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/images/icon/notification.png');

  /// File path: assets/images/icon/x_button.png
  AssetGenImage get xButton =>
      const AssetGenImage('assets/images/icon/x_button.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    clearInput,
    facebook,
    kakao,
    location,
    naver,
    notification,
    xButton,
  ];
}

class $AssetsImagesIconBankGen {
  const $AssetsImagesIconBankGen();

  /// File path: assets/images/icon/bank/hana_bank.png
  AssetGenImage get hanaBank =>
      const AssetGenImage('assets/images/icon/bank/hana_bank.png');

  /// File path: assets/images/icon/bank/ibk_bank.png
  AssetGenImage get ibkBank =>
      const AssetGenImage('assets/images/icon/bank/ibk_bank.png');

  /// File path: assets/images/icon/bank/kakao_bank.png
  AssetGenImage get kakaoBank =>
      const AssetGenImage('assets/images/icon/bank/kakao_bank.png');

  /// File path: assets/images/icon/bank/kookmin_bank.png
  AssetGenImage get kookminBank =>
      const AssetGenImage('assets/images/icon/bank/kookmin_bank.png');

  /// File path: assets/images/icon/bank/nonghyup_bank.png
  AssetGenImage get nonghyupBank =>
      const AssetGenImage('assets/images/icon/bank/nonghyup_bank.png');

  /// File path: assets/images/icon/bank/shinhan_bank.png
  AssetGenImage get shinhanBank =>
      const AssetGenImage('assets/images/icon/bank/shinhan_bank.png');

  /// File path: assets/images/icon/bank/toss_bank.png
  AssetGenImage get tossBank =>
      const AssetGenImage('assets/images/icon/bank/toss_bank.png');

  /// File path: assets/images/icon/bank/woori_bank.png
  AssetGenImage get wooriBank =>
      const AssetGenImage('assets/images/icon/bank/woori_bank.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    hanaBank,
    ibkBank,
    kakaoBank,
    kookminBank,
    nonghyupBank,
    shinhanBank,
    tossBank,
    wooriBank,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
