import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sneakers_shop/domain/bloc/export.dart';
import 'package:sneakers_shop/model/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/export.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  MockData mockData = MockData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuySneakerBloc>.value(
      value: GetIt.I.get(),
      child: BlocBuilder<BuySneakerBloc, BuySneakerState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
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
                // if (state.sneakersList == null || state.sneakersList!.isEmpty)
                //   EmptyList()
                // else
                SizedBox(
                  height: MediaQuery.of(context).size.height - 220,
                  child: ListView.builder(
                    //shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: 100,
                            width: 110,
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: -10,
                            child: Image.asset(
                              mockData.sneakerData[index].image,
                              scale: 5,
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 20,
                            child: Text(
                              '${mockData.sneakerData[index].brand} ${mockData.sneakerData[index].name}',
                              style: AppTextStyle.black14SemiBold600,
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 50,
                            child: Text(
                              mockData.sneakerData[index].price,
                              style: AppTextStyle.black20Bold500,
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 80,
                            child: IncrementCounter(
                              plusTap: () {},
                              minusTap: () {},
                              number: 1,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: AppTextStyle.black14SemiBold600,
                      ),
                      Text(
                        r'$ 540.00',
                        style: AppTextStyle.black20Bold500,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: AppButton(
                      buttonText: 'NEXT',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
