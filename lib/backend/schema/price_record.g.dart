// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PriceRecord> _$priceRecordSerializer = new _$PriceRecordSerializer();

class _$PriceRecordSerializer implements StructuredSerializer<PriceRecord> {
  @override
  final Iterable<Type> types = const [PriceRecord, _$PriceRecord];
  @override
  final String wireName = 'PriceRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PriceRecord object,
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
    value = object.proref;
    if (value != null) {
      result
        ..add('proref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.personref;
    if (value != null) {
      result
        ..add('personref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.studentref;
    if (value != null) {
      result
        ..add('studentref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  PriceRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PriceRecordBuilder();

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
        case 'proref':
          result.proref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'personref':
          result.personref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'studentref':
          result.studentref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$PriceRecord extends PriceRecord {
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
  final DocumentReference<Object?>? proref;
  @override
  final DocumentReference<Object?>? personref;
  @override
  final int? price;
  @override
  final DocumentReference<Object?>? studentref;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PriceRecord([void Function(PriceRecordBuilder)? updates]) =>
      (new PriceRecordBuilder()..update(updates))._build();

  _$PriceRecord._(
      {this.name,
      this.amount,
      this.status,
      this.tax,
      this.createdAt,
      this.vendorName,
      this.proref,
      this.personref,
      this.price,
      this.studentref,
      this.ffRef})
      : super._();

  @override
  PriceRecord rebuild(void Function(PriceRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PriceRecordBuilder toBuilder() => new PriceRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PriceRecord &&
        name == other.name &&
        amount == other.amount &&
        status == other.status &&
        tax == other.tax &&
        createdAt == other.createdAt &&
        vendorName == other.vendorName &&
        proref == other.proref &&
        personref == other.personref &&
        price == other.price &&
        studentref == other.studentref &&
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
                        proref.hashCode),
                    personref.hashCode),
                price.hashCode),
            studentref.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PriceRecord')
          ..add('name', name)
          ..add('amount', amount)
          ..add('status', status)
          ..add('tax', tax)
          ..add('createdAt', createdAt)
          ..add('vendorName', vendorName)
          ..add('proref', proref)
          ..add('personref', personref)
          ..add('price', price)
          ..add('studentref', studentref)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PriceRecordBuilder implements Builder<PriceRecord, PriceRecordBuilder> {
  _$PriceRecord? _$v;

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

  DocumentReference<Object?>? _proref;
  DocumentReference<Object?>? get proref => _$this._proref;
  set proref(DocumentReference<Object?>? proref) => _$this._proref = proref;

  DocumentReference<Object?>? _personref;
  DocumentReference<Object?>? get personref => _$this._personref;
  set personref(DocumentReference<Object?>? personref) =>
      _$this._personref = personref;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DocumentReference<Object?>? _studentref;
  DocumentReference<Object?>? get studentref => _$this._studentref;
  set studentref(DocumentReference<Object?>? studentref) =>
      _$this._studentref = studentref;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PriceRecordBuilder() {
    PriceRecord._initializeBuilder(this);
  }

  PriceRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _amount = $v.amount;
      _status = $v.status;
      _tax = $v.tax;
      _createdAt = $v.createdAt;
      _vendorName = $v.vendorName;
      _proref = $v.proref;
      _personref = $v.personref;
      _price = $v.price;
      _studentref = $v.studentref;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PriceRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PriceRecord;
  }

  @override
  void update(void Function(PriceRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PriceRecord build() => _build();

  _$PriceRecord _build() {
    final _$result = _$v ??
        new _$PriceRecord._(
            name: name,
            amount: amount,
            status: status,
            tax: tax,
            createdAt: createdAt,
            vendorName: vendorName,
            proref: proref,
            personref: personref,
            price: price,
            studentref: studentref,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
