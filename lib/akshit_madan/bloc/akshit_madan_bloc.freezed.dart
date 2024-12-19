// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'akshit_madan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AkshitMadanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(BuildContext context) deposit,
    required TResult Function(BuildContext context) withdraw,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(BuildContext context)? deposit,
    TResult? Function(BuildContext context)? withdraw,
    TResult? Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(BuildContext context)? deposit,
    TResult Function(BuildContext context)? withdraw,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEventOnAkshitMadanEvent value) init,
    required TResult Function(_DepositeEventOnAkshitMadanEvent value) deposit,
    required TResult Function(_WithdrawEventOnAkshitMadanEvent value) withdraw,
    required TResult Function(_RefreshEventOnAkshitMadanEvent value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult? Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult? Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult? Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AkshitMadanEventCopyWith<$Res> {
  factory $AkshitMadanEventCopyWith(
          AkshitMadanEvent value, $Res Function(AkshitMadanEvent) then) =
      _$AkshitMadanEventCopyWithImpl<$Res, AkshitMadanEvent>;
}

/// @nodoc
class _$AkshitMadanEventCopyWithImpl<$Res, $Val extends AkshitMadanEvent>
    implements $AkshitMadanEventCopyWith<$Res> {
  _$AkshitMadanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialEventOnAkshitMadanEventImplCopyWith<$Res> {
  factory _$$InitialEventOnAkshitMadanEventImplCopyWith(
          _$InitialEventOnAkshitMadanEventImpl value,
          $Res Function(_$InitialEventOnAkshitMadanEventImpl) then) =
      __$$InitialEventOnAkshitMadanEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$InitialEventOnAkshitMadanEventImplCopyWithImpl<$Res>
    extends _$AkshitMadanEventCopyWithImpl<$Res,
        _$InitialEventOnAkshitMadanEventImpl>
    implements _$$InitialEventOnAkshitMadanEventImplCopyWith<$Res> {
  __$$InitialEventOnAkshitMadanEventImplCopyWithImpl(
      _$InitialEventOnAkshitMadanEventImpl _value,
      $Res Function(_$InitialEventOnAkshitMadanEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$InitialEventOnAkshitMadanEventImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$InitialEventOnAkshitMadanEventImpl
    implements _InitialEventOnAkshitMadanEvent {
  const _$InitialEventOnAkshitMadanEventImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AkshitMadanEvent.init(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialEventOnAkshitMadanEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialEventOnAkshitMadanEventImplCopyWith<
          _$InitialEventOnAkshitMadanEventImpl>
      get copyWith => __$$InitialEventOnAkshitMadanEventImplCopyWithImpl<
          _$InitialEventOnAkshitMadanEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(BuildContext context) deposit,
    required TResult Function(BuildContext context) withdraw,
    required TResult Function() refresh,
  }) {
    return init(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(BuildContext context)? deposit,
    TResult? Function(BuildContext context)? withdraw,
    TResult? Function()? refresh,
  }) {
    return init?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(BuildContext context)? deposit,
    TResult Function(BuildContext context)? withdraw,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEventOnAkshitMadanEvent value) init,
    required TResult Function(_DepositeEventOnAkshitMadanEvent value) deposit,
    required TResult Function(_WithdrawEventOnAkshitMadanEvent value) withdraw,
    required TResult Function(_RefreshEventOnAkshitMadanEvent value) refresh,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult? Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult? Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult? Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _InitialEventOnAkshitMadanEvent implements AkshitMadanEvent {
  const factory _InitialEventOnAkshitMadanEvent(final BuildContext context) =
      _$InitialEventOnAkshitMadanEventImpl;

  BuildContext get context;

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialEventOnAkshitMadanEventImplCopyWith<
          _$InitialEventOnAkshitMadanEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DepositeEventOnAkshitMadanEventImplCopyWith<$Res> {
  factory _$$DepositeEventOnAkshitMadanEventImplCopyWith(
          _$DepositeEventOnAkshitMadanEventImpl value,
          $Res Function(_$DepositeEventOnAkshitMadanEventImpl) then) =
      __$$DepositeEventOnAkshitMadanEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$DepositeEventOnAkshitMadanEventImplCopyWithImpl<$Res>
    extends _$AkshitMadanEventCopyWithImpl<$Res,
        _$DepositeEventOnAkshitMadanEventImpl>
    implements _$$DepositeEventOnAkshitMadanEventImplCopyWith<$Res> {
  __$$DepositeEventOnAkshitMadanEventImplCopyWithImpl(
      _$DepositeEventOnAkshitMadanEventImpl _value,
      $Res Function(_$DepositeEventOnAkshitMadanEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$DepositeEventOnAkshitMadanEventImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$DepositeEventOnAkshitMadanEventImpl
    implements _DepositeEventOnAkshitMadanEvent {
  const _$DepositeEventOnAkshitMadanEventImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AkshitMadanEvent.deposit(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositeEventOnAkshitMadanEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositeEventOnAkshitMadanEventImplCopyWith<
          _$DepositeEventOnAkshitMadanEventImpl>
      get copyWith => __$$DepositeEventOnAkshitMadanEventImplCopyWithImpl<
          _$DepositeEventOnAkshitMadanEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(BuildContext context) deposit,
    required TResult Function(BuildContext context) withdraw,
    required TResult Function() refresh,
  }) {
    return deposit(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(BuildContext context)? deposit,
    TResult? Function(BuildContext context)? withdraw,
    TResult? Function()? refresh,
  }) {
    return deposit?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(BuildContext context)? deposit,
    TResult Function(BuildContext context)? withdraw,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (deposit != null) {
      return deposit(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEventOnAkshitMadanEvent value) init,
    required TResult Function(_DepositeEventOnAkshitMadanEvent value) deposit,
    required TResult Function(_WithdrawEventOnAkshitMadanEvent value) withdraw,
    required TResult Function(_RefreshEventOnAkshitMadanEvent value) refresh,
  }) {
    return deposit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult? Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult? Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult? Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
  }) {
    return deposit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (deposit != null) {
      return deposit(this);
    }
    return orElse();
  }
}

abstract class _DepositeEventOnAkshitMadanEvent implements AkshitMadanEvent {
  const factory _DepositeEventOnAkshitMadanEvent(final BuildContext context) =
      _$DepositeEventOnAkshitMadanEventImpl;

  BuildContext get context;

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepositeEventOnAkshitMadanEventImplCopyWith<
          _$DepositeEventOnAkshitMadanEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WithdrawEventOnAkshitMadanEventImplCopyWith<$Res> {
  factory _$$WithdrawEventOnAkshitMadanEventImplCopyWith(
          _$WithdrawEventOnAkshitMadanEventImpl value,
          $Res Function(_$WithdrawEventOnAkshitMadanEventImpl) then) =
      __$$WithdrawEventOnAkshitMadanEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$WithdrawEventOnAkshitMadanEventImplCopyWithImpl<$Res>
    extends _$AkshitMadanEventCopyWithImpl<$Res,
        _$WithdrawEventOnAkshitMadanEventImpl>
    implements _$$WithdrawEventOnAkshitMadanEventImplCopyWith<$Res> {
  __$$WithdrawEventOnAkshitMadanEventImplCopyWithImpl(
      _$WithdrawEventOnAkshitMadanEventImpl _value,
      $Res Function(_$WithdrawEventOnAkshitMadanEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$WithdrawEventOnAkshitMadanEventImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$WithdrawEventOnAkshitMadanEventImpl
    implements _WithdrawEventOnAkshitMadanEvent {
  const _$WithdrawEventOnAkshitMadanEventImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AkshitMadanEvent.withdraw(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawEventOnAkshitMadanEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawEventOnAkshitMadanEventImplCopyWith<
          _$WithdrawEventOnAkshitMadanEventImpl>
      get copyWith => __$$WithdrawEventOnAkshitMadanEventImplCopyWithImpl<
          _$WithdrawEventOnAkshitMadanEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(BuildContext context) deposit,
    required TResult Function(BuildContext context) withdraw,
    required TResult Function() refresh,
  }) {
    return withdraw(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(BuildContext context)? deposit,
    TResult? Function(BuildContext context)? withdraw,
    TResult? Function()? refresh,
  }) {
    return withdraw?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(BuildContext context)? deposit,
    TResult Function(BuildContext context)? withdraw,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (withdraw != null) {
      return withdraw(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEventOnAkshitMadanEvent value) init,
    required TResult Function(_DepositeEventOnAkshitMadanEvent value) deposit,
    required TResult Function(_WithdrawEventOnAkshitMadanEvent value) withdraw,
    required TResult Function(_RefreshEventOnAkshitMadanEvent value) refresh,
  }) {
    return withdraw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult? Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult? Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult? Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
  }) {
    return withdraw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (withdraw != null) {
      return withdraw(this);
    }
    return orElse();
  }
}

abstract class _WithdrawEventOnAkshitMadanEvent implements AkshitMadanEvent {
  const factory _WithdrawEventOnAkshitMadanEvent(final BuildContext context) =
      _$WithdrawEventOnAkshitMadanEventImpl;

  BuildContext get context;

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WithdrawEventOnAkshitMadanEventImplCopyWith<
          _$WithdrawEventOnAkshitMadanEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshEventOnAkshitMadanEventImplCopyWith<$Res> {
  factory _$$RefreshEventOnAkshitMadanEventImplCopyWith(
          _$RefreshEventOnAkshitMadanEventImpl value,
          $Res Function(_$RefreshEventOnAkshitMadanEventImpl) then) =
      __$$RefreshEventOnAkshitMadanEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshEventOnAkshitMadanEventImplCopyWithImpl<$Res>
    extends _$AkshitMadanEventCopyWithImpl<$Res,
        _$RefreshEventOnAkshitMadanEventImpl>
    implements _$$RefreshEventOnAkshitMadanEventImplCopyWith<$Res> {
  __$$RefreshEventOnAkshitMadanEventImplCopyWithImpl(
      _$RefreshEventOnAkshitMadanEventImpl _value,
      $Res Function(_$RefreshEventOnAkshitMadanEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshEventOnAkshitMadanEventImpl
    implements _RefreshEventOnAkshitMadanEvent {
  const _$RefreshEventOnAkshitMadanEventImpl();

  @override
  String toString() {
    return 'AkshitMadanEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshEventOnAkshitMadanEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(BuildContext context) deposit,
    required TResult Function(BuildContext context) withdraw,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(BuildContext context)? deposit,
    TResult? Function(BuildContext context)? withdraw,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(BuildContext context)? deposit,
    TResult Function(BuildContext context)? withdraw,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEventOnAkshitMadanEvent value) init,
    required TResult Function(_DepositeEventOnAkshitMadanEvent value) deposit,
    required TResult Function(_WithdrawEventOnAkshitMadanEvent value) withdraw,
    required TResult Function(_RefreshEventOnAkshitMadanEvent value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult? Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult? Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult? Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEventOnAkshitMadanEvent value)? init,
    TResult Function(_DepositeEventOnAkshitMadanEvent value)? deposit,
    TResult Function(_WithdrawEventOnAkshitMadanEvent value)? withdraw,
    TResult Function(_RefreshEventOnAkshitMadanEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _RefreshEventOnAkshitMadanEvent implements AkshitMadanEvent {
  const factory _RefreshEventOnAkshitMadanEvent() =
      _$RefreshEventOnAkshitMadanEventImpl;
}

/// @nodoc
mixin _$AkshitMadanState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() errorState,
    required TResult Function() completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? errorState,
    TResult? Function()? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? errorState,
    TResult Function()? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStateOnAkshitMadanState value) initial,
    required TResult Function(InProgressStateOnAkshitMadanState value)
        inProgress,
    required TResult Function(ErrorStateOnAkshitMadanState value) errorState,
    required TResult Function(CompletedStateOnAkshitMadanState value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStateOnAkshitMadanState value)? initial,
    TResult? Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult? Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult? Function(CompletedStateOnAkshitMadanState value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStateOnAkshitMadanState value)? initial,
    TResult Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult Function(CompletedStateOnAkshitMadanState value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AkshitMadanStateCopyWith<$Res> {
  factory $AkshitMadanStateCopyWith(
          AkshitMadanState value, $Res Function(AkshitMadanState) then) =
      _$AkshitMadanStateCopyWithImpl<$Res, AkshitMadanState>;
}

/// @nodoc
class _$AkshitMadanStateCopyWithImpl<$Res, $Val extends AkshitMadanState>
    implements $AkshitMadanStateCopyWith<$Res> {
  _$AkshitMadanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AkshitMadanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialStateOnAkshitMadanStateImplCopyWith<$Res> {
  factory _$$InitialStateOnAkshitMadanStateImplCopyWith(
          _$InitialStateOnAkshitMadanStateImpl value,
          $Res Function(_$InitialStateOnAkshitMadanStateImpl) then) =
      __$$InitialStateOnAkshitMadanStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateOnAkshitMadanStateImplCopyWithImpl<$Res>
    extends _$AkshitMadanStateCopyWithImpl<$Res,
        _$InitialStateOnAkshitMadanStateImpl>
    implements _$$InitialStateOnAkshitMadanStateImplCopyWith<$Res> {
  __$$InitialStateOnAkshitMadanStateImplCopyWithImpl(
      _$InitialStateOnAkshitMadanStateImpl _value,
      $Res Function(_$InitialStateOnAkshitMadanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialStateOnAkshitMadanStateImpl
    implements InitialStateOnAkshitMadanState {
  const _$InitialStateOnAkshitMadanStateImpl();

  @override
  String toString() {
    return 'AkshitMadanState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialStateOnAkshitMadanStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() errorState,
    required TResult Function() completed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? errorState,
    TResult? Function()? completed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? errorState,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStateOnAkshitMadanState value) initial,
    required TResult Function(InProgressStateOnAkshitMadanState value)
        inProgress,
    required TResult Function(ErrorStateOnAkshitMadanState value) errorState,
    required TResult Function(CompletedStateOnAkshitMadanState value) completed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStateOnAkshitMadanState value)? initial,
    TResult? Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult? Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult? Function(CompletedStateOnAkshitMadanState value)? completed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStateOnAkshitMadanState value)? initial,
    TResult Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult Function(CompletedStateOnAkshitMadanState value)? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialStateOnAkshitMadanState implements AkshitMadanState {
  const factory InitialStateOnAkshitMadanState() =
      _$InitialStateOnAkshitMadanStateImpl;
}

/// @nodoc
abstract class _$$InProgressStateOnAkshitMadanStateImplCopyWith<$Res> {
  factory _$$InProgressStateOnAkshitMadanStateImplCopyWith(
          _$InProgressStateOnAkshitMadanStateImpl value,
          $Res Function(_$InProgressStateOnAkshitMadanStateImpl) then) =
      __$$InProgressStateOnAkshitMadanStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InProgressStateOnAkshitMadanStateImplCopyWithImpl<$Res>
    extends _$AkshitMadanStateCopyWithImpl<$Res,
        _$InProgressStateOnAkshitMadanStateImpl>
    implements _$$InProgressStateOnAkshitMadanStateImplCopyWith<$Res> {
  __$$InProgressStateOnAkshitMadanStateImplCopyWithImpl(
      _$InProgressStateOnAkshitMadanStateImpl _value,
      $Res Function(_$InProgressStateOnAkshitMadanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InProgressStateOnAkshitMadanStateImpl
    implements InProgressStateOnAkshitMadanState {
  const _$InProgressStateOnAkshitMadanStateImpl();

  @override
  String toString() {
    return 'AkshitMadanState.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressStateOnAkshitMadanStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() errorState,
    required TResult Function() completed,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? errorState,
    TResult? Function()? completed,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? errorState,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStateOnAkshitMadanState value) initial,
    required TResult Function(InProgressStateOnAkshitMadanState value)
        inProgress,
    required TResult Function(ErrorStateOnAkshitMadanState value) errorState,
    required TResult Function(CompletedStateOnAkshitMadanState value) completed,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStateOnAkshitMadanState value)? initial,
    TResult? Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult? Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult? Function(CompletedStateOnAkshitMadanState value)? completed,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStateOnAkshitMadanState value)? initial,
    TResult Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult Function(CompletedStateOnAkshitMadanState value)? completed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class InProgressStateOnAkshitMadanState implements AkshitMadanState {
  const factory InProgressStateOnAkshitMadanState() =
      _$InProgressStateOnAkshitMadanStateImpl;
}

/// @nodoc
abstract class _$$ErrorStateOnAkshitMadanStateImplCopyWith<$Res> {
  factory _$$ErrorStateOnAkshitMadanStateImplCopyWith(
          _$ErrorStateOnAkshitMadanStateImpl value,
          $Res Function(_$ErrorStateOnAkshitMadanStateImpl) then) =
      __$$ErrorStateOnAkshitMadanStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorStateOnAkshitMadanStateImplCopyWithImpl<$Res>
    extends _$AkshitMadanStateCopyWithImpl<$Res,
        _$ErrorStateOnAkshitMadanStateImpl>
    implements _$$ErrorStateOnAkshitMadanStateImplCopyWith<$Res> {
  __$$ErrorStateOnAkshitMadanStateImplCopyWithImpl(
      _$ErrorStateOnAkshitMadanStateImpl _value,
      $Res Function(_$ErrorStateOnAkshitMadanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorStateOnAkshitMadanStateImpl
    implements ErrorStateOnAkshitMadanState {
  const _$ErrorStateOnAkshitMadanStateImpl();

  @override
  String toString() {
    return 'AkshitMadanState.errorState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateOnAkshitMadanStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() errorState,
    required TResult Function() completed,
  }) {
    return errorState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? errorState,
    TResult? Function()? completed,
  }) {
    return errorState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? errorState,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStateOnAkshitMadanState value) initial,
    required TResult Function(InProgressStateOnAkshitMadanState value)
        inProgress,
    required TResult Function(ErrorStateOnAkshitMadanState value) errorState,
    required TResult Function(CompletedStateOnAkshitMadanState value) completed,
  }) {
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStateOnAkshitMadanState value)? initial,
    TResult? Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult? Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult? Function(CompletedStateOnAkshitMadanState value)? completed,
  }) {
    return errorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStateOnAkshitMadanState value)? initial,
    TResult Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult Function(CompletedStateOnAkshitMadanState value)? completed,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class ErrorStateOnAkshitMadanState implements AkshitMadanState {
  const factory ErrorStateOnAkshitMadanState() =
      _$ErrorStateOnAkshitMadanStateImpl;
}

/// @nodoc
abstract class _$$CompletedStateOnAkshitMadanStateImplCopyWith<$Res> {
  factory _$$CompletedStateOnAkshitMadanStateImplCopyWith(
          _$CompletedStateOnAkshitMadanStateImpl value,
          $Res Function(_$CompletedStateOnAkshitMadanStateImpl) then) =
      __$$CompletedStateOnAkshitMadanStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedStateOnAkshitMadanStateImplCopyWithImpl<$Res>
    extends _$AkshitMadanStateCopyWithImpl<$Res,
        _$CompletedStateOnAkshitMadanStateImpl>
    implements _$$CompletedStateOnAkshitMadanStateImplCopyWith<$Res> {
  __$$CompletedStateOnAkshitMadanStateImplCopyWithImpl(
      _$CompletedStateOnAkshitMadanStateImpl _value,
      $Res Function(_$CompletedStateOnAkshitMadanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AkshitMadanState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompletedStateOnAkshitMadanStateImpl
    implements CompletedStateOnAkshitMadanState {
  const _$CompletedStateOnAkshitMadanStateImpl();

  @override
  String toString() {
    return 'AkshitMadanState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedStateOnAkshitMadanStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() errorState,
    required TResult Function() completed,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? errorState,
    TResult? Function()? completed,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? errorState,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStateOnAkshitMadanState value) initial,
    required TResult Function(InProgressStateOnAkshitMadanState value)
        inProgress,
    required TResult Function(ErrorStateOnAkshitMadanState value) errorState,
    required TResult Function(CompletedStateOnAkshitMadanState value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStateOnAkshitMadanState value)? initial,
    TResult? Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult? Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult? Function(CompletedStateOnAkshitMadanState value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStateOnAkshitMadanState value)? initial,
    TResult Function(InProgressStateOnAkshitMadanState value)? inProgress,
    TResult Function(ErrorStateOnAkshitMadanState value)? errorState,
    TResult Function(CompletedStateOnAkshitMadanState value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class CompletedStateOnAkshitMadanState implements AkshitMadanState {
  const factory CompletedStateOnAkshitMadanState() =
      _$CompletedStateOnAkshitMadanStateImpl;
}