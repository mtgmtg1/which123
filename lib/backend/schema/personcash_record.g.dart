// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personcash_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PersoncashRecord> _$personcashRecordSerializer =
    new _$PersoncashRecordSerializer();

class _$PersoncashRecordSerializer
    implements StructuredSerializer<PersoncashRecord> {
  @override
  final Iterable<Type> types = const [PersoncashRecord, _$PersoncashRecord];
  @override
  final String wireName = 'PersoncashRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PersoncashRecord object,
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
    value = object.goodnum;
    if (value != null) {
      result
        ..add('goodnum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.procashref;
    if (value != null) {
      result
        ..add('procashref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.proname;
    if (value != null) {
      result
        ..add('proname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PersoncashRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PersoncashRecordBuilder();

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
        case 'goodnum':
          result.goodnum = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'procashref':
          result.procashref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'proname':
          result.proname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PersoncashRecord extends PersoncashRecord {
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
  final double? goodnum;
  @override
  final String? review;
  @override
  final DocumentReference<Object?>? procashref;
  @override
  final String? proname;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PersoncashRecord(
          [void Function(PersoncashRecordBuilder)? updates]) =>
      (new PersoncashRecordBuilder()..update(updates))._build();

  _$PersoncashRecord._(
      {this.name,
      this.amount,
      this.status,
      this.tax,
      this.createdAt,
      this.vendorName,
      this.proref,
      this.goodnum,
      this.review,
      this.procashref,
      this.proname,
      this.ffRef})
      : super._();

  @override
  PersoncashRecord rebuild(void Function(PersoncashRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersoncashRecordBuilder toBuilder() =>
      new PersoncashRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersoncashRecord &&
        name == other.name &&
        amount == other.amount &&
        status == other.status &&
        tax == other.tax &&
        createdAt == other.createdAt &&
        vendorName == other.vendorName &&
        proref == other.proref &&
        goodnum == other.goodnum &&
        review == other.review &&
        procashref == other.procashref &&
        proname == other.proname &&
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
                                        $jc(
                                            $jc($jc(0, name.hashCode),
                                                amount.hashCode),
                                            status.hashCode),
                                        tax.hashCode),
                                    createdAt.hashCode),
                                vendorName.hashCode),
                            proref.hashCode),
                        goodnum.hashCode),
                    review.hashCode),
                procashref.hashCode),
            proname.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersoncashRecord')
          ..add('name', name)
          ..add('amount', amount)
          ..add('status', status)
          ..add('tax', tax)
          ..add('createdAt', createdAt)
          ..add('vendorName', vendorName)
          ..add('proref', proref)
          ..add('goodnum', goodnum)
          ..add('review', review)
          ..add('procashref', procashref)
          ..add('proname', proname)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PersoncashRecordBuilder
    implements Builder<PersoncashRecord, PersoncashRecordBuilder> {
  _$PersoncashRecord? _$v;

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

  double? _goodnum;
  double? get goodnum => _$this._goodnum;
  set goodnum(double? goodnum) => _$this._goodnum = goodnum;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  DocumentReference<Object?>? _procashref;
  DocumentReference<Object?>? get procashref => _$this._procashref;
  set procashref(DocumentReference<Object?>? procashref) =>
      _$this._procashref = procashref;

  String? _proname;
  String? get proname => _$this._proname;
  set proname(String? proname) => _$this._proname = proname;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PersoncashRecordBuilder() {
    PersoncashRecord._initializeBuilder(this);
  }

  PersoncashRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _amount = $v.amount;
      _status = $v.status;
      _tax = $v.tax;
      _createdAt = $v.createdAt;
      _vendorName = $v.vendorName;
      _proref = $v.proref;
      _goodnum = $v.goodnum;
      _review = $v.review;
      _procashref = $v.procashref;
      _proname = $v.proname;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersoncashRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersoncashRecord;
  }

  @override
  void update(void Function(PersoncashRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersoncashRecord build() => _build();

  _$PersoncashRecord _build() {
    final _$result = _$v ??
        new _$PersoncashRecord._(
            name: name,
            amount: amount,
            status: status,
            tax: tax,
            createdAt: createdAt,
            vendorName: vendorName,
            proref: proref,
            goodnum: goodnum,
            review: review,
            procashref: procashref,
            proname: proname,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
