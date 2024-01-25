import 'package:flutter/material.dart';
import 'package:gcal/view/widgets/export_widget.dart' show WalkBottom, WalkPage;

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  WalkthroughScreenState createState() => WalkthroughScreenState();
}

class WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _controller = PageController();
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: WalkPage(controller: _controller, index: _currentPage),
          ),
          WalkBottom(controller: _controller, index: _currentPage),
        ],
      ),
    );
  }
}
