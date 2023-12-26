import 'package:flutter/material.dart';
import 'package:gcal/view/widgets/export_widget.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
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
          Container(
            child: WalkBottom(controller: _controller, index: _currentPage),
          ),
        ],
      ),
    );
  }
}
