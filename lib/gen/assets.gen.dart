/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/GitHub_Invertocat_Light.png
  AssetGenImage get gitHubInvertocatLight =>
      const AssetGenImage('assets/icons/GitHub_Invertocat_Light.png');

  /// File path: assets/icons/Group 175 (1).png
  AssetGenImage get group1751 =>
      const AssetGenImage('assets/icons/Group 175 (1).png');

  /// File path: assets/icons/Menu.png
  AssetGenImage get menu => const AssetGenImage('assets/icons/Menu.png');

  /// File path: assets/icons/Search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/Search.png');

  /// File path: assets/icons/Vector.png
  AssetGenImage get vector => const AssetGenImage('assets/icons/Vector.png');

  /// File path: assets/icons/like.png
  AssetGenImage get like => const AssetGenImage('assets/icons/like.png');

  /// File path: assets/icons/likeback.png
  AssetGenImage get likeback =>
      const AssetGenImage('assets/icons/likeback.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    gitHubInvertocatLight,
    group1751,
    menu,
    search,
    vector,
    like,
    likeback,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cpu.png
  AssetGenImage get cpu => const AssetGenImage('assets/images/cpu.png');

  /// File path: assets/images/graphic.png
  AssetGenImage get graphic => const AssetGenImage('assets/images/graphic.png');

  /// File path: assets/images/laptop.png
  AssetGenImage get laptop => const AssetGenImage('assets/images/laptop.png');

  /// File path: assets/images/logo_Blog.png
  AssetGenImage get logoBlog =>
      const AssetGenImage('assets/images/logo_Blog.png');

  /// File path: assets/images/motherBoard.png
  AssetGenImage get motherBoard =>
      const AssetGenImage('assets/images/motherBoard.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    cpu,
    graphic,
    laptop,
    logoBlog,
    motherBoard,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
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
