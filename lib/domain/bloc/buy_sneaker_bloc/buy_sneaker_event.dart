part of 'buy_sneaker_bloc.dart';

@freezed
class BuySneakerEvent with _$BuySneakerEvent {
  const factory BuySneakerEvent.loading({List<SneakerInfo>? sneakersList}) =
      BuySneakerEventLoading;

  const factory BuySneakerEvent.loaded({List<SneakerInfo>? sneakersList}) =
      BuySneakerEventLoaded;
}
