import 'package:get/get.dart';
import 'package:rate_my_app/rate_my_app.dart';

import 'app_package_info.dart';

class RateAppUtils {
  const RateAppUtils._();

  static String get _appName => AppPackageInfo.instance.appName;

  static final _instance = RateMyApp(
    preferencesPrefix: _appName,
    googlePlayIdentifier: AppPackageInfo.packageName,
  );

  static Future<void> init() async => _instance.init();

  static void showRateDialog() => Get.dialog(
        RateMyAppDialog(
          _instance,
          title: 'Rate Your Experience with $_appName!',
          message: 'Please take a moment to rate $_appName on the app store. '
              'Your honest review will not only assist us in enhancing our app '
              'but also aid other users in making an informed decision.',
          contentBuilder: (_, defaultContent) => defaultContent,
          dialogStyle: const DialogStyle(),
          actionsBuilder: (_) => [
            RateMyAppRateButton(
              _instance,
              text: 'RATE',
              validator: () => true,
            ),
            RateMyAppNoButton(
              _instance,
              text: 'CANCEL',
              validator: () => true,
            ),
          ],
          rateButton: '',
          noButton: '',
          laterButton: '',
        ),
      );
}
