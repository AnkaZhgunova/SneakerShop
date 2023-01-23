import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_shop/shared/resources/export.dart';
import 'package:sneakers_shop/shared/styles/colors.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final ButtonIcon buttonType;
  final Color color;
  const AppIconButton({
    required this.onTap,
    required this.buttonType,
    this.color = AppColors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25,
        width: 25,
        color: Colors.transparent,
        child: SvgPicture.asset(
          buttonType.getIconButton,
          color: color,
        ),
      ),
    );
  }
}

enum ButtonIcon {
  arrow,
  favorite,
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
      default:
        {
          return AppIcons.favoriteIcon;
        }
    }
  }
}
