import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_shop/shared/resources/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';

class SizeChoice extends StatefulWidget {
  final VoidCallback? tryIt;
  const SizeChoice({
    this.tryIt,
    Key? key,
  }) : super(key: key);

  @override
  State<SizeChoice> createState() => _SizeChoiceState();
}

class _SizeChoiceState extends State<SizeChoice> {
  int? _selected;

  List<String> options = ['7.5', '8', '9.5'];

  Widget _optionButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selected == index) {
            _selected = null;
          } else {
            _selected = index;
          }
        });
      },
      child: Container(
        width: 90,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: _selected == index ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        child: Center(
          child: Text(
            options[index],
            style: _selected == index
                ? AppTextStyle.white14Medium500
                : AppTextStyle.black14SemiBold600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        GestureDetector(
          onTap: widget.tryIt,
          child: Container(
            width: 90,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.grey,
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Try it',
                  style: AppTextStyle.black14SemiBold600,
                ),
                SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  AppIcons.footPrintIcon,
                  fit: BoxFit.scaleDown,
                  height: 30,
                  width: 30,
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return _optionButton(index);
          },
        ),
      ],
    );
  }
}
