import 'package:flutter/material.dart';

class PulsatingImageWidget extends StatefulWidget {
  const PulsatingImageWidget({super.key});
  @override
  State<PulsatingImageWidget> createState() => _PulsatingImageWidgetState();
}

class _PulsatingImageWidgetState extends State<PulsatingImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: const Image(
        image: AssetImage('images/list.png'),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
