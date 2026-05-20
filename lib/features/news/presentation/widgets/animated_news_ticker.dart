import 'package:flutter/material.dart';

class AnimatedNewsTicker extends StatefulWidget {
  final List<String> headlines;

  const AnimatedNewsTicker({super.key, required this.headlines});

  @override
  State<AnimatedNewsTicker> createState() => _AnimatedNewsTickerState();
}

class _AnimatedNewsTickerState extends State<AnimatedNewsTicker>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    )..addListener(() {
        if (_scrollController.hasClients) {
          final maxScrollExtent = _scrollController.position.maxScrollExtent;
          if (maxScrollExtent > 0) {
            final currentScroll = _animationController.value * maxScrollExtent;
            _scrollController.jumpTo(currentScroll);
          }
          
          if (_animationController.isCompleted) {
            _animationController.repeat();
          }
        }
      });
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _animationController.forward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.secondary.withOpacity(0.1),
        border: Border.symmetric(
          horizontal: BorderSide(color: colorScheme.secondary.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            color: colorScheme.secondary,
            alignment: Alignment.center,
            child: const Text(
              'TRENDING',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.headlines.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      widget.headlines[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface.withOpacity(0.8),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
