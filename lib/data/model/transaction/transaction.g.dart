// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as String? ?? "",
      productId: json['productId'] as String? ?? "",
      warehouseId: json['warehouseId'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      quantity: json['quantity'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      operation: json['operation'] as String? ?? "",
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'warehouseId': instance.warehouseId,
      'userId': instance.userId,
      'quantity': instance.quantity,
      'price': instance.price,
      'operation': instance.operation,
      'image': instance.image,
    };
