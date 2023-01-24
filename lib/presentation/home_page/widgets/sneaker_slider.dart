import 'package:flutter/material.dart';
import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/presentation/export.dart';

class SneakerSlider extends StatefulWidget {
  const SneakerSlider({Key? key}) : super(key: key);

  @override
  State<SneakerSlider> createState() => _SneakerSliderState();
}

class _SneakerSliderState extends State<SneakerSlider>
    with TickerProviderStateMixin {
  MockData mockData = MockData();
  late AnimationController animatedController;
  late Animation<double> sneakerRotation;
  late PageController pageController;
  double pageOffset = 0;
  int selectedIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.7);
    pageController.addListener(
      () {
        setState(() => pageOffset = pageController.page!);
      },
    );
    animatedController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 700,
      ),
    );
    sneakerRotation = Tween(begin: -0.8, end: 0.0).animate(animatedController);
    startRotateSneaker();
    super.initState();
  }

  Future<void> startRotateSneaker() async {
    try {
      await animatedController.forward(from: 0.2).orCancel;
    } on TickerCanceled {
      animatedController.stop();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: mockData.sneakerData.length,
        onPageChanged: (index) {
          Future.delayed(const Duration(milliseconds: 60), () {
            setState(() {
              selectedIndex = index;
            });
          });
          startRotateSneaker();
        },
        itemBuilder: (BuildContext context, int index) {
          final diff = index.toDouble() - pageOffset;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 3, 1 / 0.90)
              ..setEntry(3, 0, 0.002 * -diff),
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: selectedIndex > index ? 0 : 1,
              curve: Curves.decelerate,
              duration: Duration(milliseconds: 50),
              child: SneakerCard(
                sneakerInfo: mockData.sneakerData[index],
                controller: animatedController,
                rotation: sneakerRotation,
              ),
            ),
          );
        },
      ),
    );
  }
}
