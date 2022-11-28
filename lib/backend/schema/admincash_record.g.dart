// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admincash_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdmincashRecord> _$admincashRecordSerializer =
    new _$AdmincashRecordSerializer();

class _$AdmincashRecordSerializer
    implements StructuredSerializer<AdmincashRecord> {
  @override
  final Iterable<Type> types = const [AdmincashRecord, _$AdmincashRecord];
  @override
  final String wireName = 'AdmincashRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdmincashRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tax;
    if (value != null) {
      result
        ..add('tax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.vendorName;
    if (value != null) {
      result
        ..add('vendor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalearn;
    if (value != null) {
      result
        ..add('totalearn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.totalspend;
    if (value != null) {
      result
        ..add('totalspend')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.totalpersonnum;
    if (value != null) {
      result
        ..add('totalpersonnum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.monthpersonnum;
    if (value != null) {
      result
        ..add('monthpersonnum')
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
  AdmincashRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdmincashRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tax':
          result.tax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'vendor_name':
          result.vendorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'totalearn':
          result.totalearn = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'totalspend':
          result.totalspend = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'totalpersonnum':
          result.totalpersonnum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'monthpersonnum':
          result.monthpersonnum = serializers.deserialize(value,
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

class _$AdmincashRecord extends AdmincashRecord {
  @override
  final String? name;
  @override
  final double? amount;
  @override
  final String? status;
  @override
  final double? tax;
  @override
  final DateTime? createdAt;
  @override
  final String? vendorName;
  @override
  final double? totalearn;
  @override
  final double? totalspend;
  @override
  final int? totalpersonnum;
  @override
  final int? monthpersonnum;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AdmincashRecord([void Function(AdmincashRecordBuilder)? updates]) =>
      (new AdmincashRecordBuilder()..update(updates))._build();

  _$AdmincashRecord._(
      {this.name,
      this.amount,
      this.status,
      this.tax,
      this.createdAt,
      this.vendorName,
      this.totalearn,
      this.totalspend,
      this.totalpersonnum,
      this.monthpersonnum,
      this.ffRef})
      : super._();

  @override
  AdmincashRecord rebuild(void Function(AdmincashRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdmincashRecordBuilder toBuilder() =>
      new AdmincashRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdmincashRecord &&
        name == other.name &&
        amount == other.amount &&
        status == other.status &&
        tax == other.tax &&
        createdAt == other.createdAt &&
        vendorName == other.vendorName &&
        totalearn == other.totalearn &&
        totalspend == other.totalspend &&
        totalpersonnum == other.totalpersonnum &&
        monthpersonnum == other.monthpersonnum &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, name.hashCode),
                                            amount.hashCode),
                                        status.hashCode),
                                    tax.hashCode),
                                createdAt.hashCode),
                            vendorName.hashCode),
                        totalearn.hashCode),
                    totalspend.hashCode),
                totalpersonnum.hashCode),
            monthpersonnum.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdmincashRecord')
          ..add('name', name)
          ..add('amount', amount)
          ..add('status', status)
          ..add('tax', tax)
          ..add('createdAt', createdAt)
          ..add('vendorName', vendorName)
          ..add('totalearn', totalearn)
          ..add('totalspend', totalspend)
          ..add('totalpersonnum', totalpersonnum)
          ..add('monthpersonnum', monthpersonnum)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AdmincashRecordBuilder
    implements Builder<AdmincashRecord, AdmincashRecordBuilder> {
  _$AdmincashRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  double? _tax;
  double? get tax => _$this._tax;
  set tax(double? tax) => _$this._tax = tax;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _vendorName;
  String? get vendorName => _$this._vendorName;
  set vendorName(String? vendorName) => _$this._vendorName = vendorName;

  double? _totalearn;
  double? get totalearn => _$this._totalearn;
  set totalearn(double? totalearn) => _$this._totalearn = totalearn;

  double? _totalspend;
  double? get totalspend => _$this._totalspend;
  set totalspend(double? totalspend) => _$this._totalspend = totalspend;

  int? _totalpersonnum;
  int? get totalpersonnum => _$this._totalpersonnum;
  set totalpersonnum(int? totalpersonnum) =>
      _$this._totalpersonnum = totalpersonnum;

  int? _monthpersonnum;
  int? get monthpersonnum => _$this._monthpersonnum;
  set monthpersonnum(int? monthpersonnum) =>
      _$this._monthpersonnum = monthpersonnum;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AdmincashRecordBuilder() {
    AdmincashRecord._initializeBuilder(this);
  }

  AdmincashRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _amount = $v.amount;
      _status = $v.status;
      _tax = $v.tax;
      _createdAt = $v.createdAt;
      _vendorName = $v.vendorName;
      _totalearn = $v.totalearn;
      _totalspend = $v.totalspend;
      _totalpersonnum = $v.totalpersonnum;
      _monthpersonnum = $v.monthpersonnum;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdmincashRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdmincashRecord;
  }

  @override
  void update(void Function(AdmincashRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdmincashRecord build() => _build();

  _$AdmincashRecord _build() {
    final _$result = _$v ??
        new _$AdmincashRecord._(
            name: name,
            amount: amount,
            status: status,
            tax: tax,
            createdAt: createdAt,
            vendorName: vendorName,
            totalearn: totalearn,
            totalspend: totalspend,
            totalpersonnum: totalpersonnum,
            monthpersonnum: monthpersonnum,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
