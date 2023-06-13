// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_main_feature_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductMainFeatureState {
  Status get status => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductMainFeatureStateCopyWith<ProductMainFeatureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMainFeatureStateCopyWith<$Res> {
  factory $ProductMainFeatureStateCopyWith(ProductMainFeatureState value,
          $Res Function(ProductMainFeatureState) then) =
      _$ProductMainFeatureStateCopyWithImpl<$Res, ProductMainFeatureState>;
  @useResult
  $Res call({Status status, Product product, int price, int quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductMainFeatureStateCopyWithImpl<$Res,
        $Val extends ProductMainFeatureState>
    implements $ProductMainFeatureStateCopyWith<$Res> {
  _$ProductMainFeatureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? product = null,
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductMainFeatureStateCopyWith<$Res>
    implements $ProductMainFeatureStateCopyWith<$Res> {
  factory _$$_ProductMainFeatureStateCopyWith(_$_ProductMainFeatureState value,
          $Res Function(_$_ProductMainFeatureState) then) =
      __$$_ProductMainFeatureStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Product product, int price, int quantity});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_ProductMainFeatureStateCopyWithImpl<$Res>
    extends _$ProductMainFeatureStateCopyWithImpl<$Res,
        _$_ProductMainFeatureState>
    implements _$$_ProductMainFeatureStateCopyWith<$Res> {
  __$$_ProductMainFeatureStateCopyWithImpl(_$_ProductMainFeatureState _value,
      $Res Function(_$_ProductMainFeatureState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? product = null,
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_$_ProductMainFeatureState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductMainFeatureState implements _ProductMainFeatureState {
  const _$_ProductMainFeatureState(
      {this.status = Status.initial,
      this.product = const Product(),
      this.price = 0,
      this.quantity = 0});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Product product;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'ProductMainFeatureState(status: $status, product: $product, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductMainFeatureState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, product, price, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductMainFeatureStateCopyWith<_$_ProductMainFeatureState>
      get copyWith =>
          __$$_ProductMainFeatureStateCopyWithImpl<_$_ProductMainFeatureState>(
              this, _$identity);
}

abstract class _ProductMainFeatureState implements ProductMainFeatureState {
  const factory _ProductMainFeatureState(
      {final Status status,
      final Product product,
      final int price,
      final int quantity}) = _$_ProductMainFeatureState;

  @override
  Status get status;
  @override
  Product get product;
  @override
  int get price;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_ProductMainFeatureStateCopyWith<_$_ProductMainFeatureState>
      get copyWith => throw _privateConstructorUsedError;
}
