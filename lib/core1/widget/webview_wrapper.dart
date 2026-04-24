import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_liteee/core/constants/app_color.dart';

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
          onProgress: (progress) => _isLoading.value,
          onPageFinished: (String url) {
            _isLoading.value = false;
            //             _controller.runJavaScript('''
            // var navBar =  document.querySelector('ytm-pivot-bar-renderer');
            // if(navbar) navBar.style.display = 'none';

            // ''');
            _controller.runJavaScript('''
                        var navBar = document.querySelector('ytm-mobile-topbar-renderer');
                        if (navBar) navBar.style.display = 'none';
                      ''');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.youtube.com/'));
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
              backgroundColor: AppColors.backgroundDark,
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