import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {
  AppPackageInfo._();

  static PackageInfo? _instance;
  static PackageInfo get instance => _instance!;

  static Future<PackageInfo> init() async =>
      _instance ??= await PackageInfo.fromPlatform();

  static String get packageName => instance.packageName;
}
