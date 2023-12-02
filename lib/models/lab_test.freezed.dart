// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LabTest _$LabTestFromJson(Map<String, dynamic> json) {
  return _LabTest.fromJson(json);
}

/// @nodoc
mixin _$LabTest {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  int get price => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get discountedPrice => throw _privateConstructorUsedError;
  @HiveField(5)
  List<String> get tests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LabTestCopyWith<LabTest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabTestCopyWith<$Res> {
  factory $LabTestCopyWith(LabTest value, $Res Function(LabTest) then) =
      _$LabTestCopyWithImpl<$Res, LabTest>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String description,
      @HiveField(3) int price,
      @HiveField(4) int? discountedPrice,
      @HiveField(5) List<String> tests});
}

/// @nodoc
class _$LabTestCopyWithImpl<$Res, $Val extends LabTest>
    implements $LabTestCopyWith<$Res> {
  _$LabTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? tests = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      tests: null == tests
          ? _value.tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LabTestImplCopyWith<$Res> implements $LabTestCopyWith<$Res> {
  factory _$$LabTestImplCopyWith(
          _$LabTestImpl value, $Res Function(_$LabTestImpl) then) =
      __$$LabTestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String description,
      @HiveField(3) int price,
      @HiveField(4) int? discountedPrice,
      @HiveField(5) List<String> tests});
}

/// @nodoc
class __$$LabTestImplCopyWithImpl<$Res>
    extends _$LabTestCopyWithImpl<$Res, _$LabTestImpl>
    implements _$$LabTestImplCopyWith<$Res> {
  __$$LabTestImplCopyWithImpl(
      _$LabTestImpl _value, $Res Function(_$LabTestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? tests = null,
  }) {
    return _then(_$LabTestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      tests: null == tests
          ? _value._tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LabTestImpl implements _LabTest {
  const _$LabTestImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.description,
      @HiveField(3) required this.price,
      @HiveField(4) this.discountedPrice,
      @HiveField(5) required final List<String> tests})
      : _tests = tests;

  factory _$LabTestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabTestImplFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String description;
  @override
  @HiveField(3)
  final int price;
  @override
  @HiveField(4)
  final int? discountedPrice;
  final List<String> _tests;
  @override
  @HiveField(5)
  List<String> get tests {
    if (_tests is EqualUnmodifiableListView) return _tests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tests);
  }

  @override
  String toString() {
    return 'LabTest(name: $name, description: $description, price: $price, discountedPrice: $discountedPrice, tests: $tests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabTestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            const DeepCollectionEquality().equals(other._tests, _tests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, price,
      discountedPrice, const DeepCollectionEquality().hash(_tests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LabTestImplCopyWith<_$LabTestImpl> get copyWith =>
      __$$LabTestImplCopyWithImpl<_$LabTestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabTestImplToJson(
      this,
    );
  }
}

abstract class _LabTest implements LabTest {
  const factory _LabTest(
      {@HiveField(0) required final String name,
      @HiveField(1) required final String description,
      @HiveField(3) required final int price,
      @HiveField(4) final int? discountedPrice,
      @HiveField(5) required final List<String> tests}) = _$LabTestImpl;

  factory _LabTest.fromJson(Map<String, dynamic> json) = _$LabTestImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get description;
  @override
  @HiveField(3)
  int get price;
  @override
  @HiveField(4)
  int? get discountedPrice;
  @override
  @HiveField(5)
  List<String> get tests;
  @override
  @JsonKey(ignore: true)
  _$$LabTestImplCopyWith<_$LabTestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
