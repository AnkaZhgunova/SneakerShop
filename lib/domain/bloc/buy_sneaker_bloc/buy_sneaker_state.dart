part of 'buy_sneaker_bloc.dart';

@freezed
class BuySneakerState with _$BuySneakerState {
  const factory BuySneakerState.loading({List<SneakerInfo>? sneakersList}) =
      BuySneakerStateLoading;

  const factory BuySneakerState.loaded({List<SneakerInfo>? sneakersList}) =
      BuySneakerStateLoaded;
}
