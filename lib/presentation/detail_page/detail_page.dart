import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sneakers_shop/domain/bloc/export.dart';
import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/presentation/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/export.dart';

class DetailPage extends StatefulWidget {
  final SneakerInfo sneakerInfo;

  const DetailPage({
    required this.sneakerInfo,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  BoxShape oldShape = BoxShape.rectangle;
  BoxShape newShape = BoxShape.circle;
  double oldSize = 200;
  double newSize = 600;

  @override
  void initState() {
    Future.delayed(Duration(microseconds: 500), () {
      setState(() {
        oldShape = newShape;
        oldSize = newSize;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            top: -250,
            left: -10,
            child: AnimatedTransition(
              axis: Axis.vertical,
              child: AnimatedContainer(
                height: oldSize,
                width: oldSize,
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  shape: oldShape,
                  color: widget.sneakerInfo.color,
                ),
                duration: Duration(milliseconds: 300),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: AppIconButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonType: ButtonIcon.arrow,
                  ),
                ),
                Text(
                  widget.sneakerInfo.brand,
                  style: AppTextStyle.white16SemiBold600,
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.sneakerInfo.color?.withOpacity(0.7),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 6), // changes position of shadow
                      ),
                    ],
                  ),
                  child: AppIconButton(
                    onTap: () {},
                    buttonType: ButtonIcon.favorite,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 40,
            child: Hero(
              tag: widget.sneakerInfo.image,
              child: Image.asset(
                widget.sneakerInfo.image,
                scale: 2,
              ),
            ),
          ),
          Positioned(
            top: 380,
            left: 20,
            right: 20,
            child: AnimatedTransition(
              axis: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getSneakerPhoto(0.4),
                      Transform(
                        transform: Matrix4.rotationY(math.pi),
                        alignment: Alignment.center,
                        child: getSneakerPhoto(0.4),
                      ),
                      getSneakerPhoto(0),
                      Stack(
                        children: [
                          Transform(
                            transform: Matrix4.rotationY(math.pi),
                            alignment: Alignment.center,
                            child: getSneakerPhoto(0),
                          ),
                          Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                              color: AppColors.darkGrey.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.play_circle_fill,
                              color: AppColors.white.withOpacity(1),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: AppColors.pinkButtons,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.sneakerInfo.name,
                        style: AppTextStyle.black20Bold500,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.white,
                              AppColors.pinkButtons.withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Text(
                          '\$${widget.sneakerInfo.price}',
                          style: AppTextStyle.black20Bold500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Legendary Air gets lifted. Our 1st lifestyle Air Max brings you style, comfort and 270 degrees of Air to showcase one of our greatest innovations yet. Add a lightweight, airy upper and low-cut collar and you've got the perfect kicks for everyday fun.",
                    style: AppTextStyle.darkGrey14SemiBold600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'More details',
                        style: AppTextStyle.black16SemiBold600.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Size',
                        style: AppTextStyle.black20Bold500,
                      ),
                      SizeFormat(
                        onChanged: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: SizeChoice(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocProvider<BuySneakerBloc>(
                    create: (_) => GetIt.I.get(),
                    child: BlocBuilder<BuySneakerBloc, BuySneakerState>(
                      builder: (context, state) {
                        return AppButton(
                          buttonText: 'ADD TO BAG',
                          onPressed: () {
                            BlocProvider.of<BuySneakerBloc>(context)
                                .addSneakerToBag(widget.sneakerInfo)
                                .whenComplete(
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (context) => BagPage(),
                                    ),
                                  ),
                                );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSneakerPhoto(double angle) {
    return Container(
      height: 40,
      width: 70,
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Transform.rotate(
        angle: angle,
        child: Image.asset(
          widget.sneakerInfo.image,
          scale: 10,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
