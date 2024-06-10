import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LokasiMaps extends StatelessWidget {
  const LokasiMaps(); // Perhatikan bahwa tidak ada kata kunci 'const' di sini.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMA TUNA BANGSA'),
      ),
      body: WebView(
        initialUrl: 'https://maps.app.goo.gl/BCBCgVHfEmqHkynh9',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
