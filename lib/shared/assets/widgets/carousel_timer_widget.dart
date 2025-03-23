import 'dart:async';

import 'package:flutter/material.dart';

class CarouselTimerWidget extends StatefulWidget {
  const CarouselTimerWidget({required this.cards, super.key});

  final List<Widget> cards;

  @override
  State<CarouselTimerWidget> createState() => _CarouselTimerWidgetState();
}

class _CarouselTimerWidgetState extends State<CarouselTimerWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  int _currentIndex = 0;
  double _progress = 0;
  Timer? _timer;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _progress = 0.0;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (!_isPaused) {
        setState(() {
          _progress += 0.02;
          if (_progress >= 1.0) {
            _goToNextPage();
          }
        });
      }
    });
  }

  void _togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _goToNextPage() {
    if (_currentIndex < widget.cards.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _pageController.animateToPage(_currentIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double availableHeight =
        screenHeight - MediaQuery.of(context).padding.top;
    final double carouselHeight = availableHeight * 0.42;

    return SizedBox(
        height: carouselHeight.clamp(250, availableHeight * 0.5),
        child: Column(children: <Widget>[
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.cards.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                      _startTimer();
                    });
                  },
                  itemBuilder: (BuildContext context, int index) =>
                      SingleChildScrollView(child: widget.cards[index]))),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: const Color(0xFFDDDDDD),
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(_isPaused ? Icons.play_arrow : Icons.pause,
                              size: 16, color: const Color(0xFF000000)),
                          onPressed: _togglePause,
                          color: const Color(0xFF000000)),
                      Row(
                          children: List<Widget>.generate(
                              widget.cards.length,
                              (int index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: index == _currentIndex
                                      ? _buildProgressIndicator()
                                      : _buildInactiveDot())))
                    ]))
          ])
        ]));
  }

  Widget _buildInactiveDot() => Container(
      width: 6,
      height: 6,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.black));

  Widget _buildProgressIndicator() => Container(
      width: 16,
      height: 8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.white,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
              minHeight: 4)));
}
