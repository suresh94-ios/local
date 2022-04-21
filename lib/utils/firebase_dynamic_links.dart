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
}
