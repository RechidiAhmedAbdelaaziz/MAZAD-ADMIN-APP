import 'package:json_annotation/json_annotation.dart';

part 'auction_model.g.dart';

@JsonSerializable(createToJson: false)
class AuctionModel {
  AuctionModel({
    this.id,
    this.productNumber,
    this.title,
    this.endingDate,
    this.region,
    this.subscriptionPrice,
  });

  @JsonKey(name: '_id')
  final String? id;
  final int? productNumber;
  final String? title;
  final DateTime? endingDate;
  final String? region;
  final double? subscriptionPrice;

  factory AuctionModel.fromJson(Map<String, dynamic> json) =>
      _$AuctionModelFromJson(json);
}
