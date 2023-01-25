import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sneakers_shop/domain/bloc/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/export.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuySneakerBloc>.value(
      value: GetIt.I.get(),
      child: BlocBuilder<BuySneakerBloc, BuySneakerState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: AppIconButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      buttonType: ButtonIcon.arrow,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Bag',
                        style: AppTextStyle.black30Bold700,
                      ),
                      Text(
                        'Total 3 items',
                        style: AppTextStyle.black16SemiBold600,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.grey,
                ),
                if (state.sneakersList == null || state.sneakersList!.isEmpty)
                  EmptyList()
                else
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 50,
                        width: 50,
                        color: AppColors.pinkButtons,
                      );
                    },
                  ),
              ],
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 10,
                bottom: 20,
              ),
              child: AppButton(
                buttonText: 'NEXT',
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
