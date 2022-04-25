import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class FirebaseDynamicLinkUtils {

  /// Observes Dynamic links when app is open
  static Future initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          final Uri? deepLink = dynamicLink!.link;

          if (deepLink != null) {
            if (deepLink.toString().isNotEmpty) {
              // DebugUtils.printAsdf("OnDynamicLink $deepLink");
              // DebugUtils.printAsdf("Dynamic LINK ${deepLink.queryParameters}");

              Map<String, dynamic> linkMap = deepLink.queryParameters;
              // var response = await PasswordProvider.validateCode(
              //     email: linkMap["email"], code: linkMap["code"]);
             // DebugUtils.printAsdf("validate code response.... $response");
              //if (response["status"] == 200) {
                // Get.toNamed(AppRoutes.resetPassword,
                //     arguments: deepLink.queryParameters);
             // }
            }
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  /// get the dynamic link when app is not running
  doTheDynamicLinksThing() async {
    try {
      final PendingDynamicLinkData? data =
      await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        List<String> strings = deepLink.toString().split('/') ?? [];

       // DebugUtils.printAsdf("App Cold Start Initial Link $deepLink");
        if (strings.isNotEmpty) {
         // Get.offAllNamed(AppRoutes.resetPassword, arguments: strings);
        }
        return true;
      }
    } catch (e) {
     // DebugUtils.printAsdf('Exception $e - Dynamic Links');
    }
    return false;
  }
}
