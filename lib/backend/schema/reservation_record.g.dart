// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReservationRecord> _$reservationRecordSerializer =
    new _$ReservationRecordSerializer();

class _$ReservationRecordSerializer
    implements StructuredSerializer<ReservationRecord> {
  @override
  final Iterable<Type> types = const [ReservationRecord, _$ReservationRecord];
  @override
  final String wireName = 'ReservationRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReservationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.personref;
    if (value != null) {
      result
        ..add('personref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.proref;
    if (value != null) {
      result
        ..add('proref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.priceref;
    if (value != null) {
      result
        ..add('priceref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createtime;
    if (value != null) {
      result
        ..add('createtime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reviewfromperson;
    if (value != null) {
      result
        ..add('reviewfromperson')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reviewfrompro;
    if (value != null) {
      result
        ..add('reviewfrompro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goodnumfromperson;
    if (value != null) {
      result
        ..add('goodnumfromperson')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.goodnumfrompro;
    if (value != null) {
      result
        ..add('goodnumfrompro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reservationtime;
    if (value != null) {
      result
        ..add('reservationtime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reservemonthday;
    if (value != null) {
      result
        ..add('reservemonthday')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reservehour;
    if (value != null) {
      result
        ..add('reservehour')
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
  ReservationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReservationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'personref':
          result.personref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'proref':
          result.proref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'priceref':
          result.priceref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'createtime':
          result.createtime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'reviewfromperson':
          result.reviewfromperson = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reviewfrompro':
          result.reviewfrompro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goodnumfromperson':
          result.goodnumfromperson = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'goodnumfrompro':
          result.goodnumfrompro = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'reservationtime':
          result.reservationtime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'reservemonthday':
          result.reservemonthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reservehour':
          result.reservehour = serializers.deserialize(value,
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

class _$ReservationRecord extends ReservationRecord {
  @override
  final DocumentReference<Object?>? personref;
  @override
  final DocumentReference<Object?>? proref;
  @override
  final DocumentReference<Object?>? priceref;
  @override
  final DateTime? createtime;
  @override
  final int? duration;
  @override
  final String? reviewfromperson;
  @override
  final String? reviewfrompro;
  @override
  final double? goodnumfromperson;
  @override
  final double? goodnumfrompro;
  @override
  final DateTime? reservationtime;
  @override
  final String? reservemonthday;
  @override
  final String? reservehour;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReservationRecord(
          [void Function(ReservationRecordBuilder)? updates]) =>
      (new ReservationRecordBuilder()..update(updates))._build();

  _$ReservationRecord._(
      {this.personref,
      this.proref,
      this.priceref,
      this.createtime,
      this.duration,
      this.reviewfromperson,
      this.reviewfrompro,
      this.goodnumfromperson,
      this.goodnumfrompro,
      this.reservationtime,
      this.reservemonthday,
      this.reservehour,
      this.ffRef})
      : super._();

  @override
  ReservationRecord rebuild(void Function(ReservationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReservationRecordBuilder toBuilder() =>
      new ReservationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReservationRecord &&
        personref == other.personref &&
        proref == other.proref &&
        priceref == other.priceref &&
        createtime == other.createtime &&
        duration == other.duration &&
        reviewfromperson == other.reviewfromperson &&
        reviewfrompro == other.reviewfrompro &&
        goodnumfromperson == other.goodnumfromperson &&
        goodnumfrompro == other.goodnumfrompro &&
        reservationtime == other.reservationtime &&
        reservemonthday == other.reservemonthday &&
        reservehour == other.reservehour &&
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
                                                $jc($jc(0, personref.hashCode),
                                                    proref.hashCode),
                                                priceref.hashCode),
                                            createtime.hashCode),
                                        duration.hashCode),
                                    reviewfromperson.hashCode),
                                reviewfrompro.hashCode),
                            goodnumfromperson.hashCode),
                        goodnumfrompro.hashCode),
                    reservationtime.hashCode),
                reservemonthday.hashCode),
            reservehour.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReservationRecord')
          ..add('personref', personref)
          ..add('proref', proref)
          ..add('priceref', priceref)
          ..add('createtime', createtime)
          ..add('duration', duration)
          ..add('reviewfromperson', reviewfromperson)
          ..add('reviewfrompro', reviewfrompro)
          ..add('goodnumfromperson', goodnumfromperson)
          ..add('goodnumfrompro', goodnumfrompro)
          ..add('reservationtime', reservationtime)
          ..add('reservemonthday', reservemonthday)
          ..add('reservehour', reservehour)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReservationRecordBuilder
    implements Builder<ReservationRecord, ReservationRecordBuilder> {
  _$ReservationRecord? _$v;

  DocumentReference<Object?>? _personref;
  DocumentReference<Object?>? get personref => _$this._personref;
  set personref(DocumentReference<Object?>? personref) =>
      _$this._personref = personref;

  DocumentReference<Object?>? _proref;
  DocumentReference<Object?>? get proref => _$this._proref;
  set proref(DocumentReference<Object?>? proref) => _$this._proref = proref;

  DocumentReference<Object?>? _priceref;
  DocumentReference<Object?>? get priceref => _$this._priceref;
  set priceref(DocumentReference<Object?>? priceref) =>
      _$this._priceref = priceref;

  DateTime? _createtime;
  DateTime? get createtime => _$this._createtime;
  set createtime(DateTime? createtime) => _$this._createtime = createtime;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  String? _reviewfromperson;
  String? get reviewfromperson => _$this._reviewfromperson;
  set reviewfromperson(String? reviewfromperson) =>
      _$this._reviewfromperson = reviewfromperson;

  String? _reviewfrompro;
  String? get reviewfrompro => _$this._reviewfrompro;
  set reviewfrompro(String? reviewfrompro) =>
      _$this._reviewfrompro = reviewfrompro;

  double? _goodnumfromperson;
  double? get goodnumfromperson => _$this._goodnumfromperson;
  set goodnumfromperson(double? goodnumfromperson) =>
      _$this._goodnumfromperson = goodnumfromperson;

  double? _goodnumfrompro;
  double? get goodnumfrompro => _$this._goodnumfrompro;
  set goodnumfrompro(double? goodnumfrompro) =>
      _$this._goodnumfrompro = goodnumfrompro;

  DateTime? _reservationtime;
  DateTime? get reservationtime => _$this._reservationtime;
  set reservationtime(DateTime? reservationtime) =>
      _$this._reservationtime = reservationtime;

  String? _reservemonthday;
  String? get reservemonthday => _$this._reservemonthday;
  set reservemonthday(String? reservemonthday) =>
      _$this._reservemonthday = reservemonthday;

  String? _reservehour;
  String? get reservehour => _$this._reservehour;
  set reservehour(String? reservehour) => _$this._reservehour = reservehour;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReservationRecordBuilder() {
    ReservationRecord._initializeBuilder(this);
  }

  ReservationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _personref = $v.personref;
      _proref = $v.proref;
      _priceref = $v.priceref;
      _createtime = $v.createtime;
      _duration = $v.duration;
      _reviewfromperson = $v.reviewfromperson;
      _reviewfrompro = $v.reviewfrompro;
      _goodnumfromperson = $v.goodnumfromperson;
      _goodnumfrompro = $v.goodnumfrompro;
      _reservationtime = $v.reservationtime;
      _reservemonthday = $v.reservemonthday;
      _reservehour = $v.reservehour;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReservationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReservationRecord;
  }

  @override
  void update(void Function(ReservationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReservationRecord build() => _build();

  _$ReservationRecord _build() {
    final _$result = _$v ??
        new _$ReservationRecord._(
            personref: personref,
            proref: proref,
            priceref: priceref,
            createtime: createtime,
            duration: duration,
            reviewfromperson: reviewfromperson,
            reviewfrompro: reviewfrompro,
            goodnumfromperson: goodnumfromperson,
            goodnumfrompro: goodnumfrompro,
            reservationtime: reservationtime,
            reservemonthday: reservemonthday,
            reservehour: reservehour,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
