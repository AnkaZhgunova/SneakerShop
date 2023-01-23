import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  const SquareButton({required this.onTap, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.lightGrey,
        ),
        child: SvgPicture.asset(
          icon,
          color: AppColors.black,
          height: 10,
          width: 10,
        ),
      ),
    );
  }
}
