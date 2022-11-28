// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procash_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProcashRecord> _$procashRecordSerializer =
    new _$ProcashRecordSerializer();

class _$ProcashRecordSerializer implements StructuredSerializer<ProcashRecord> {
  @override
  final Iterable<Type> types = const [ProcashRecord, _$ProcashRecord];
  @override
  final String wireName = 'ProcashRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProcashRecord object,
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
    value = object.personref;
    if (value != null) {
      result
        ..add('personref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goodnum;
    if (value != null) {
      result
        ..add('goodnum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.personcashref;
    if (value != null) {
      result
        ..add('personcashref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.personname;
    if (value != null) {
      result
        ..add('personname')
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
  ProcashRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProcashRecordBuilder();

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
        case 'personref':
          result.personref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goodnum':
          result.goodnum = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'personcashref':
          result.personcashref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'personname':
          result.personname = serializers.deserialize(value,
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

class _$ProcashRecord extends ProcashRecord {
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
  final DocumentReference<Object?>? personref;
  @override
  final String? review;
  @override
  final double? goodnum;
  @override
  final DocumentReference<Object?>? personcashref;
  @override
  final String? personname;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProcashRecord([void Function(ProcashRecordBuilder)? updates]) =>
      (new ProcashRecordBuilder()..update(updates))._build();

  _$ProcashRecord._(
      {this.name,
      this.amount,
      this.status,
      this.tax,
      this.createdAt,
      this.vendorName,
      this.personref,
      this.review,
      this.goodnum,
      this.personcashref,
      this.personname,
      this.ffRef})
      : super._();

  @override
  ProcashRecord rebuild(void Function(ProcashRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcashRecordBuilder toBuilder() => new ProcashRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcashRecord &&
        name == other.name &&
        amount == other.amount &&
        status == other.status &&
        tax == other.tax &&
        createdAt == other.createdAt &&
        vendorName == other.vendorName &&
        personref == other.personref &&
        review == other.review &&
        goodnum == other.goodnum &&
        personcashref == other.personcashref &&
        personname == other.personname &&
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
                            personref.hashCode),
                        review.hashCode),
                    goodnum.hashCode),
                personcashref.hashCode),
            personname.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcashRecord')
          ..add('name', name)
          ..add('amount', amount)
          ..add('status', status)
          ..add('tax', tax)
          ..add('createdAt', createdAt)
          ..add('vendorName', vendorName)
          ..add('personref', personref)
          ..add('review', review)
          ..add('goodnum', goodnum)
          ..add('personcashref', personcashref)
          ..add('personname', personname)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProcashRecordBuilder
    implements Builder<ProcashRecord, ProcashRecordBuilder> {
  _$ProcashRecord? _$v;

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

  DocumentReference<Object?>? _personref;
  DocumentReference<Object?>? get personref => _$this._personref;
  set personref(DocumentReference<Object?>? personref) =>
      _$this._personref = personref;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  double? _goodnum;
  double? get goodnum => _$this._goodnum;
  set goodnum(double? goodnum) => _$this._goodnum = goodnum;

  DocumentReference<Object?>? _personcashref;
  DocumentReference<Object?>? get personcashref => _$this._personcashref;
  set personcashref(DocumentReference<Object?>? personcashref) =>
      _$this._personcashref = personcashref;

  String? _personname;
  String? get personname => _$this._personname;
  set personname(String? personname) => _$this._personname = personname;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProcashRecordBuilder() {
    ProcashRecord._initializeBuilder(this);
  }

  ProcashRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _amount = $v.amount;
      _status = $v.status;
      _tax = $v.tax;
      _createdAt = $v.createdAt;
      _vendorName = $v.vendorName;
      _personref = $v.personref;
      _review = $v.review;
      _goodnum = $v.goodnum;
      _personcashref = $v.personcashref;
      _personname = $v.personname;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcashRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProcashRecord;
  }

  @override
  void update(void Function(ProcashRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcashRecord build() => _build();

  _$ProcashRecord _build() {
    final _$result = _$v ??
        new _$ProcashRecord._(
            name: name,
            amount: amount,
            status: status,
            tax: tax,
            createdAt: createdAt,
            vendorName: vendorName,
            personref: personref,
            review: review,
            goodnum: goodnum,
            personcashref: personcashref,
            personname: personname,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
