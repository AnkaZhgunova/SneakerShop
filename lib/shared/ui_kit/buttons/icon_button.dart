import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_shop/shared/resources/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final ButtonIcon buttonType;
  final Color iconColor;
  final Color containerColor;
  const AppIconButton({
    required this.onTap,
    required this.buttonType,
    this.iconColor = AppColors.black,
    this.containerColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25,
        width: 30,
        color: containerColor,
        child: SvgPicture.asset(
          buttonType.getIconButton,
          color: iconColor,
        ),
      ),
    );
  }
}

enum ButtonIcon {
  arrow,
  favorite,
  plus,
  minus,
}

extension GetIconButton on ButtonIcon {
  String get getIconButton {
    switch (this) {
      case ButtonIcon.arrow:
        {
          return AppIcons.arrowIcon;
        }
      case ButtonIcon.favorite:
        {
          return AppIcons.favoriteIcon;
        }
      case ButtonIcon.plus:
        {
          return AppIcons.plusIcon;
        }
      case ButtonIcon.minus:
        {
          return AppIcons.minusIcon;
        }
      default:
        {
          return AppIcons.favoriteIcon;
        }
    }
  }
}
