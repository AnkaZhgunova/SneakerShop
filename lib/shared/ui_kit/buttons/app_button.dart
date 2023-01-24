import 'package:flutter/cupertino.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;

  const AppButton({
    required this.buttonText,
    this.onPressed,
    this.height = 40,
    this.width = double.infinity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        disabledColor: AppColors.lightGrey,
        color: AppColors.pinkButtons,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: onPressed == null
                  ? AppColors.lightGrey
                  : AppColors.pinkButtons,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          height: height,
          alignment: Alignment.center,
          width: width,
          child: Text(
            buttonText,
            style: AppTextStyle.white14Medium500,
          ),
        ),
      ),
    );
  }
}
