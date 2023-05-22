import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @Default("") String id,
    @Default("") String productId,
    @Default("") String warehouseId,
    @Default("") String userId,
    @Default(0) int quantity,
    @Default(0) int price,
    @Default("") String operation,
    @Default("") String image,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
