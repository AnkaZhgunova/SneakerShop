import 'package:flutter/material.dart';
import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/export.dart';

class NewModelCard extends StatelessWidget {
  final SneakerInfo sneakerInfo;
  const NewModelCard({
    required this.sneakerInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        height: 20,
                        width: 60,
                        color: AppColors.pinkButtons,
                        child: Center(
                          child: Text(
                            'NEW',
                            style: AppTextStyle.white14Medium500,
                          ),
                        ),
                      ),
                    ),
                    AppIconButton(
                      onTap: () {},
                      buttonType: ButtonIcon.favorite,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      '${sneakerInfo.brand} ${sneakerInfo.name}',
                      style: AppTextStyle.black14SemiBold600,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${sneakerInfo.price}',
                      style: AppTextStyle.black14SemiBold600,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            top: 25,
            child: Transform.rotate(
              angle: 0.4,
              child: Image.asset(
                sneakerInfo.image,
                height: 140,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
