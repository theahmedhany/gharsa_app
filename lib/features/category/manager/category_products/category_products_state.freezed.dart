// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CategoryProductsState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data) success,
    required TResult Function(ApiNetworkExceptions networkExceptions) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? loadingMore,
    TResult? Function(T data)? success,
    TResult? Function(ApiNetworkExceptions networkExceptions)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? loadingMore,
    TResult Function(T data)? success,
    TResult Function(ApiNetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadingMore<T> value) loadingMore,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadingMore<T> value)? loadingMore,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadingMore<T> value)? loadingMore,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryProductsStateCopyWith<T, $Res> {
  factory $CategoryProductsStateCopyWith(
    CategoryProductsState<T> value,
    $Res Function(CategoryProductsState<T>) then,
  ) = _$CategoryProductsStateCopyWithImpl<T, $Res, CategoryProductsState<T>>;
}

/// @nodoc
class _$CategoryProductsStateCopyWithImpl<
  T,
  $Res,
  $Val extends CategoryProductsState<T>
>
    implements $CategoryProductsStateCopyWith<T, $Res> {
  _$CategoryProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<T, $Res> {
  factory _$$IdleImplCopyWith(
    _$IdleImpl<T> value,
    $Res Function(_$IdleImpl<T>) then,
  ) = __$$IdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<T, $Res>
    extends _$CategoryProductsStateCopyWithImpl<T, $Res, _$IdleImpl<T>>
    implements _$$IdleImplCopyWith<T, $Res> {
  __$$IdleImplCopyWithImpl(
    _$IdleImpl<T> _value,
    $Res Function(_$IdleImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl<T> implements Idle<T> {
  const _$IdleImpl();

  @override
  String toString() {
    return 'CategoryProductsState<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data) success,
    required TResult Function(ApiNetworkExceptions networkExceptions) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? loadingMore,
    TResult? Function(T data)? success,
    TResult? Function(ApiNetworkExceptions networkExceptions)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? loadingMore,
    TResult Function(T data)? success,
    TResult Function(ApiNetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadingMore<T> value) loadingMore,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadingMore<T> value)? loadingMore,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadingMore<T> value)? loadingMore,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements CategoryProductsState<T> {
  const factory Idle() = _$IdleImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl<T> value,
    $Res Function(_$LoadingImpl<T>) then,
  ) = __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$CategoryProductsStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl<T> _value,
    $Res Function(_$LoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CategoryProductsState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data) success,
    required TResult Function(ApiNetworkExceptions networkExceptions) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? loadingMore,
    TResult? Function(T data)? success,
    TResult? Function(ApiNetworkExceptions networkExceptions)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? loadingMore,
    TResult Function(T data)? success,
    TResult Function(ApiNetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadingMore<T> value) loadingMore,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadingMore<T> value)? loadingMore,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadingMore<T> value)? loadingMore,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements CategoryProductsState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$LoadingMoreImplCopyWith<T, $Res> {
  factory _$$LoadingMoreImplCopyWith(
    _$LoadingMoreImpl<T> value,
    $Res Function(_$LoadingMoreImpl<T>) then,
  ) = __$$LoadingMoreImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$LoadingMoreImplCopyWithImpl<T, $Res>
    extends _$CategoryProductsStateCopyWithImpl<T, $Res, _$LoadingMoreImpl<T>>
    implements _$$LoadingMoreImplCopyWith<T, $Res> {
  __$$LoadingMoreImplCopyWithImpl(
    _$LoadingMoreImpl<T> _value,
    $Res Function(_$LoadingMoreImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$LoadingMoreImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as T,
      ),
    );
  }
}

/// @nodoc

class _$LoadingMoreImpl<T> implements LoadingMore<T> {
  const _$LoadingMoreImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CategoryProductsState<$T>.loadingMore(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingMoreImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingMoreImplCopyWith<T, _$LoadingMoreImpl<T>> get copyWith =>
      __$$LoadingMoreImplCopyWithImpl<T, _$LoadingMoreImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data) success,
    required TResult Function(ApiNetworkExceptions networkExceptions) error,
  }) {
    return loadingMore(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? loadingMore,
    TResult? Function(T data)? success,
    TResult? Function(ApiNetworkExceptions networkExceptions)? error,
  }) {
    return loadingMore?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? loadingMore,
    TResult Function(T data)? success,
    TResult Function(ApiNetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadingMore<T> value) loadingMore,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadingMore<T> value)? loadingMore,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadingMore<T> value)? loadingMore,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class LoadingMore<T> implements CategoryProductsState<T> {
  const factory LoadingMore(final T data) = _$LoadingMoreImpl<T>;

  T get data;

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingMoreImplCopyWith<T, _$LoadingMoreImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl<T> value,
    $Res Function(_$SuccessImpl<T>) then,
  ) = __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$CategoryProductsStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl<T> _value,
    $Res Function(_$SuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$SuccessImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as T,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CategoryProductsState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data) success,
    required TResult Function(ApiNetworkExceptions networkExceptions) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? loadingMore,
    TResult? Function(T data)? success,
    TResult? Function(ApiNetworkExceptions networkExceptions)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? loadingMore,
    TResult Function(T data)? success,
    TResult Function(ApiNetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadingMore<T> value) loadingMore,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadingMore<T> value)? loadingMore,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadingMore<T> value)? loadingMore,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements CategoryProductsState<T> {
  const factory Success(final T data) = _$SuccessImpl<T>;

  T get data;

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl<T> value,
    $Res Function(_$ErrorImpl<T>) then,
  ) = __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiNetworkExceptions networkExceptions});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$CategoryProductsStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl<T> _value,
    $Res Function(_$ErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? networkExceptions = null}) {
    return _then(
      _$ErrorImpl<T>(
        null == networkExceptions
            ? _value.networkExceptions
            : networkExceptions // ignore: cast_nullable_to_non_nullable
                as ApiNetworkExceptions,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.networkExceptions);

  @override
  final ApiNetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'CategoryProductsState<$T>.error(networkExceptions: $networkExceptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkExceptions);

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T data) loadingMore,
    required TResult Function(T data) success,
    required TResult Function(ApiNetworkExceptions networkExceptions) error,
  }) {
    return error(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T data)? loadingMore,
    TResult? Function(T data)? success,
    TResult? Function(ApiNetworkExceptions networkExceptions)? error,
  }) {
    return error?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T data)? loadingMore,
    TResult Function(T data)? success,
    TResult Function(ApiNetworkExceptions networkExceptions)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(networkExceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadingMore<T> value) loadingMore,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadingMore<T> value)? loadingMore,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadingMore<T> value)? loadingMore,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements CategoryProductsState<T> {
  const factory Error(final ApiNetworkExceptions networkExceptions) =
      _$ErrorImpl<T>;

  ApiNetworkExceptions get networkExceptions;

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
