part of 'bag_bloc.dart';

@freezed
class BagEvent with _$BagEvent {
  const factory BagEvent.loading({List<SneakerInfo>? sneakersList}) =
      BagEventLoading;

  const factory BagEvent.loaded({List<SneakerInfo>? sneakersList}) =
      BagEventLoaded;
}
