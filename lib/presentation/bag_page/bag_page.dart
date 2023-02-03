import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sneakers_shop/domain/bloc/export.dart';
import 'package:sneakers_shop/presentation/export.dart';
import 'package:sneakers_shop/shared/styles/export.dart';
import 'package:sneakers_shop/shared/ui_kit/export.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  GlobalKey<AnimatedListState> animatedKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BagBloc>.value(
      value: GetIt.I.get(),
      child: BlocBuilder<BagBloc, BagState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<BagBloc>(context);

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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => BottomBar(initialIndex: 0),
                          ),
                        );
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
                        'Total ${state.sneakersList!.length} items',
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 220,
                    child: AnimatedList(
                      key: animatedKey,
                      scrollDirection: Axis.vertical,
                      initialItemCount: state.sneakersList!.length,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index, animation) {
                        // Future.delayed(Duration.zero,(){
                        //   animatedKey.currentState?.insertItem(0);
                        // });


                        return Stack(
                          children: [
                            ScaleTransition(
                              scale: animation,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                height: 100,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 13,
                              top: -10,
                              child: ScaleTransition(
                                scale: animation,
                                child: Image.asset(
                                  state.sneakersList![index].image,
                                  scale: 5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 150,
                              top: 20,
                              child: AnimatedTransition(
                                axis: Axis.horizontal,
                                offset: animation.value,
                                child: Text(
                                  '${state.sneakersList![index].brand} ${state.sneakersList![index].name}',
                                  style: AppTextStyle.black14SemiBold600,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 150,
                              top: 50,
                              child: AnimatedTransition(
                                axis: Axis.horizontal,
                                offset: animation.value,
                                child: Text(
                                  '\$ ${state.sneakersList![index].price.toString()}',
                                  style: AppTextStyle.black20Bold500,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 150,
                              top: 80,
                              child: AnimatedTransition(
                                axis: Axis.horizontal,
                                offset: animation.value,
                                child: IncrementCounter(
                                  plusTap: () {
                                    bloc.increaseNumber(
                                      state.sneakersList![index],
                                    );
                                  },
                                  minusTap: () {
                                    bloc.removeSneakerNumber(
                                      sneakerInfo: state.sneakersList![index],);
                                  },
                                  number:
                                      state.sneakersList![index].sneakerNumber,
                                ),
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
                        '\$${bloc.totalPrice().toString()}',
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
