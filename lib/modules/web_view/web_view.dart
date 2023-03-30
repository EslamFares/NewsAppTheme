import 'package:flutter/material.dart';
import 'package:news_api/shared/componant/navigate/navigate.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String urlarticale;
  const WebViewScreen({required this.urlarticale, super.key});

  @override
  State<WebViewScreen> createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.urlarticale),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => pop(context),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
