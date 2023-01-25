import 'package:flutter/material.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/export.dart';

class IncrementCounter extends StatelessWidget {
  final VoidCallback plusTap;
  final VoidCallback minusTap;
  final int number;
  const IncrementCounter({
    required this.plusTap,
    required this.minusTap,
    required this.number,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIconButton(
          onTap: minusTap,
          buttonType: ButtonIcon.minus,
          containerColor: AppColors.grey.withOpacity(0.3),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            number.toString(),
            style: AppTextStyle.black14SemiBold600,
          ),
        ),
        AppIconButton(
          onTap: plusTap,
          buttonType: ButtonIcon.plus,
          containerColor: AppColors.grey.withOpacity(0.3),
        ),
      ],
    );
  }
}
