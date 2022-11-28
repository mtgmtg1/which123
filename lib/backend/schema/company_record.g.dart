// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompanyRecord> _$companyRecordSerializer =
    new _$CompanyRecordSerializer();

class _$CompanyRecordSerializer implements StructuredSerializer<CompanyRecord> {
  @override
  final Iterable<Type> types = const [CompanyRecord, _$CompanyRecord];
  @override
  final String wireName = 'CompanyRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CompanyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.introduce;
    if (value != null) {
      result
        ..add('introduce')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homepage;
    if (value != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.personRef;
    if (value != null) {
      result
        ..add('personRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.kids;
    if (value != null) {
      result
        ..add('kids')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kidsdetail;
    if (value != null) {
      result
        ..add('kidsdetail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.place;
    if (value != null) {
      result
        ..add('place')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placedetail;
    if (value != null) {
      result
        ..add('placedetail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.officecatergory;
    if (value != null) {
      result
        ..add('officecatergory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.officename;
    if (value != null) {
      result
        ..add('officename')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.size;
    if (value != null) {
      result
        ..add('size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fax;
    if (value != null) {
      result
        ..add('fax')
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
  CompanyRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'introduce':
          result.introduce = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'personRef':
          result.personRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'kids':
          result.kids = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kidsdetail':
          result.kidsdetail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'place':
          result.place = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'placedetail':
          result.placedetail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'officecatergory':
          result.officecatergory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'officename':
          result.officename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fax':
          result.fax = serializers.deserialize(value,
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

class _$CompanyRecord extends CompanyRecord {
  @override
  final String? introduce;
  @override
  final String? homepage;
  @override
  final String? logo;
  @override
  final DocumentReference<Object?>? personRef;
  @override
  final String? kids;
  @override
  final String? kidsdetail;
  @override
  final String? place;
  @override
  final String? placedetail;
  @override
  final String? officecatergory;
  @override
  final String? officename;
  @override
  final String? size;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? fax;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CompanyRecord([void Function(CompanyRecordBuilder)? updates]) =>
      (new CompanyRecordBuilder()..update(updates))._build();

  _$CompanyRecord._(
      {this.introduce,
      this.homepage,
      this.logo,
      this.personRef,
      this.kids,
      this.kidsdetail,
      this.place,
      this.placedetail,
      this.officecatergory,
      this.officename,
      this.size,
      this.address,
      this.phone,
      this.fax,
      this.ffRef})
      : super._();

  @override
  CompanyRecord rebuild(void Function(CompanyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyRecordBuilder toBuilder() => new CompanyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyRecord &&
        introduce == other.introduce &&
        homepage == other.homepage &&
        logo == other.logo &&
        personRef == other.personRef &&
        kids == other.kids &&
        kidsdetail == other.kidsdetail &&
        place == other.place &&
        placedetail == other.placedetail &&
        officecatergory == other.officecatergory &&
        officename == other.officename &&
        size == other.size &&
        address == other.address &&
        phone == other.phone &&
        fax == other.fax &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                introduce
                                                                    .hashCode),
                                                            homepage.hashCode),
                                                        logo.hashCode),
                                                    personRef.hashCode),
                                                kids.hashCode),
                                            kidsdetail.hashCode),
                                        place.hashCode),
                                    placedetail.hashCode),
                                officecatergory.hashCode),
                            officename.hashCode),
                        size.hashCode),
                    address.hashCode),
                phone.hashCode),
            fax.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompanyRecord')
          ..add('introduce', introduce)
          ..add('homepage', homepage)
          ..add('logo', logo)
          ..add('personRef', personRef)
          ..add('kids', kids)
          ..add('kidsdetail', kidsdetail)
          ..add('place', place)
          ..add('placedetail', placedetail)
          ..add('officecatergory', officecatergory)
          ..add('officename', officename)
          ..add('size', size)
          ..add('address', address)
          ..add('phone', phone)
          ..add('fax', fax)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CompanyRecordBuilder
    implements Builder<CompanyRecord, CompanyRecordBuilder> {
  _$CompanyRecord? _$v;

  String? _introduce;
  String? get introduce => _$this._introduce;
  set introduce(String? introduce) => _$this._introduce = introduce;

  String? _homepage;
  String? get homepage => _$this._homepage;
  set homepage(String? homepage) => _$this._homepage = homepage;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  DocumentReference<Object?>? _personRef;
  DocumentReference<Object?>? get personRef => _$this._personRef;
  set personRef(DocumentReference<Object?>? personRef) =>
      _$this._personRef = personRef;

  String? _kids;
  String? get kids => _$this._kids;
  set kids(String? kids) => _$this._kids = kids;

  String? _kidsdetail;
  String? get kidsdetail => _$this._kidsdetail;
  set kidsdetail(String? kidsdetail) => _$this._kidsdetail = kidsdetail;

  String? _place;
  String? get place => _$this._place;
  set place(String? place) => _$this._place = place;

  String? _placedetail;
  String? get placedetail => _$this._placedetail;
  set placedetail(String? placedetail) => _$this._placedetail = placedetail;

  String? _officecatergory;
  String? get officecatergory => _$this._officecatergory;
  set officecatergory(String? officecatergory) =>
      _$this._officecatergory = officecatergory;

  String? _officename;
  String? get officename => _$this._officename;
  set officename(String? officename) => _$this._officename = officename;

  String? _size;
  String? get size => _$this._size;
  set size(String? size) => _$this._size = size;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _fax;
  String? get fax => _$this._fax;
  set fax(String? fax) => _$this._fax = fax;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CompanyRecordBuilder() {
    CompanyRecord._initializeBuilder(this);
  }

  CompanyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _introduce = $v.introduce;
      _homepage = $v.homepage;
      _logo = $v.logo;
      _personRef = $v.personRef;
      _kids = $v.kids;
      _kidsdetail = $v.kidsdetail;
      _place = $v.place;
      _placedetail = $v.placedetail;
      _officecatergory = $v.officecatergory;
      _officename = $v.officename;
      _size = $v.size;
      _address = $v.address;
      _phone = $v.phone;
      _fax = $v.fax;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompanyRecord;
  }

  @override
  void update(void Function(CompanyRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompanyRecord build() => _build();

  _$CompanyRecord _build() {
    final _$result = _$v ??
        new _$CompanyRecord._(
            introduce: introduce,
            homepage: homepage,
            logo: logo,
            personRef: personRef,
            kids: kids,
            kidsdetail: kidsdetail,
            place: place,
            placedetail: placedetail,
            officecatergory: officecatergory,
            officename: officename,
            size: size,
            address: address,
            phone: phone,
            fax: fax,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
