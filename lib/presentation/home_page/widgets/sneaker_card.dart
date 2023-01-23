import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/buttons/icon_button.dart';

class SneakerCard extends StatefulWidget {
  final SneakerInfo sneakerInfo;
  final double offset;
  final AnimationController controller;
  final Animation<double> rotation;
  const SneakerCard({
    required this.sneakerInfo,
    required this.offset,
    required this.controller,
    required this.rotation,
    Key? key,
  }) : super(key: key);

  @override
  State<SneakerCard> createState() => _SneakerCardState();
}

class _SneakerCardState extends State<SneakerCard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double gaussFunction = math.exp(
      -(math.pow(widget.offset.abs() - 0.5, 2) / 0.08),
    );

    return Stack(
      children: [
        Transform.translate(
          offset: Offset(-42 * gaussFunction * widget.offset.sign, 0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: widget.sneakerInfo.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.sneakerInfo.brand,
                      style: AppTextStyle.white14Medium500,
                    ),
                    Spacer(),
                    AppIconButton(
                      onTap: () {},
                      buttonType: ButtonIcon.favorite,
                      color: AppColors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.sneakerInfo.name,
                  style: AppTextStyle.white16SemiBold600,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${widget.sneakerInfo.price.toString()}',
                  style: AppTextStyle.white14Medium500,
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: AppIconButton(
                    onTap: () {},
                    buttonType: ButtonIcon.arrow,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 65,
          top: 30,
          child: AnimatedBuilder(
            animation: widget.controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: widget.rotation.value,
                child: child,
              );
            },
            child: Image.asset(
              widget.sneakerInfo.image,
              scale: 2.8,
              alignment: Alignment(-widget.offset.abs(), 0),
            ),
          ),
        ),
      ],
    );
  }
}
