import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextLink extends StatelessWidget {
  const TextLink({
    super.key,
    required this.title,
    this.url,
  });

  final String title;
  final String? url;

  Future<void> launch(Uri url) async {
    try {
      if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (url != null) {
            Uri localUrl = Uri.parse(url!);

            launch(localUrl);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
