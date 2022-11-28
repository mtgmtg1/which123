// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BalanceRecord> _$balanceRecordSerializer =
    new _$BalanceRecordSerializer();

class _$BalanceRecordSerializer implements StructuredSerializer<BalanceRecord> {
  @override
  final Iterable<Type> types = const [BalanceRecord, _$BalanceRecord];
  @override
  final String wireName = 'BalanceRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BalanceRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.totalearn;
    if (value != null) {
      result
        ..add('totalearn')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalspend;
    if (value != null) {
      result
        ..add('totalspend')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  BalanceRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BalanceRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'totalearn':
          result.totalearn = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'totalspend':
          result.totalspend = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$BalanceRecord extends BalanceRecord {
  @override
  final int? totalearn;
  @override
  final int? totalspend;
  @override
  final int? balance;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BalanceRecord([void Function(BalanceRecordBuilder)? updates]) =>
      (new BalanceRecordBuilder()..update(updates))._build();

  _$BalanceRecord._({this.totalearn, this.totalspend, this.balance, this.ffRef})
      : super._();

  @override
  BalanceRecord rebuild(void Function(BalanceRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BalanceRecordBuilder toBuilder() => new BalanceRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BalanceRecord &&
        totalearn == other.totalearn &&
        totalspend == other.totalspend &&
        balance == other.balance &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, totalearn.hashCode), totalspend.hashCode),
            balance.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BalanceRecord')
          ..add('totalearn', totalearn)
          ..add('totalspend', totalspend)
          ..add('balance', balance)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BalanceRecordBuilder
    implements Builder<BalanceRecord, BalanceRecordBuilder> {
  _$BalanceRecord? _$v;

  int? _totalearn;
  int? get totalearn => _$this._totalearn;
  set totalearn(int? totalearn) => _$this._totalearn = totalearn;

  int? _totalspend;
  int? get totalspend => _$this._totalspend;
  set totalspend(int? totalspend) => _$this._totalspend = totalspend;

  int? _balance;
  int? get balance => _$this._balance;
  set balance(int? balance) => _$this._balance = balance;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BalanceRecordBuilder() {
    BalanceRecord._initializeBuilder(this);
  }

  BalanceRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalearn = $v.totalearn;
      _totalspend = $v.totalspend;
      _balance = $v.balance;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BalanceRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BalanceRecord;
  }

  @override
  void update(void Function(BalanceRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BalanceRecord build() => _build();

  _$BalanceRecord _build() {
    final _$result = _$v ??
        new _$BalanceRecord._(
            totalearn: totalearn,
            totalspend: totalspend,
            balance: balance,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
