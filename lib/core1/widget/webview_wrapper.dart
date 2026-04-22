import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'full_screen_loading_overlay.dart';

class WebviewWrapper extends StatefulWidget {
  const WebviewWrapper({
    super.key,
    required this.url,
    required this.title,
  });

  final String url;
  final String title;

  @override
  State<WebviewWrapper> createState() => _WebviewWrapperState();
}

class _WebviewWrapperState extends State<WebviewWrapper> {
  late final WebViewController _controller;
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoading,
      builder: (context, isLoading, child) {
        return FullScreenLoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: WebViewWidget(controller: _controller),
          ),
        );
      },
    );
  }
}