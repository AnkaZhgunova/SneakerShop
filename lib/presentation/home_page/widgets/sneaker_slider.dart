import 'package:flutter/material.dart';
import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/presentation/export.dart';

class SneakerSlider extends StatefulWidget {
  const SneakerSlider({Key? key}) : super(key: key);

  @override
  State<SneakerSlider> createState() => _SneakerSliderState();
}

class _SneakerSliderState extends State<SneakerSlider>
    with SingleTickerProviderStateMixin {
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
        milliseconds: 1000,
      ),
    );
    sneakerRotation = Tween(begin: -0.6, end: 0.0).animate(animatedController);
    startPaperAnimation();
    super.initState();
  }

  Future<void> startPaperAnimation() async {
    try {
      await animatedController.forward(from: 0.4).orCancel;
    } on TickerCanceled {
      animatedController.stop();
    }
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
          startPaperAnimation();
        },
        itemBuilder: (BuildContext context, int index) {
          final diff = index.toDouble() - pageOffset;

          return GestureDetector(
            onTap: () {},
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 3, 1 / 0.90)
                ..setEntry(3, 0, 0.002 * -diff),
              alignment: Alignment.center,
              child: Visibility(
                visible: selectedIndex <= index,
                child: SneakerCard(
                  sneakerInfo: mockData.sneakerData[index],
                  offset: pageOffset - 1,
                  controller: animatedController,
                  rotation: sneakerRotation,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
