// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hire_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HireRecord> _$hireRecordSerializer = new _$HireRecordSerializer();

class _$HireRecordSerializer implements StructuredSerializer<HireRecord> {
  @override
  final Iterable<Type> types = const [HireRecord, _$HireRecord];
  @override
  final String wireName = 'HireRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, HireRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.industry;
    if (value != null) {
      result
        ..add('industry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.businessName;
    if (value != null) {
      result
        ..add('business_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  HireRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HireRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'industry':
          result.industry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'business_name':
          result.businessName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$HireRecord extends HireRecord {
  @override
  final String? industry;
  @override
  final String? businessName;
  @override
  final DateTime? startDate;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? duration;
  @override
  final DateTime? createdAt;
  @override
  final String? email;
  @override
  final String? photoUrl;
  @override
  final DateTime? createdTime;
  @override
  final DateTime? endDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$HireRecord([void Function(HireRecordBuilder)? updates]) =>
      (new HireRecordBuilder()..update(updates))._build();

  _$HireRecord._(
      {this.industry,
      this.businessName,
      this.startDate,
      this.title,
      this.description,
      this.duration,
      this.createdAt,
      this.email,
      this.photoUrl,
      this.createdTime,
      this.endDate,
      this.ffRef})
      : super._();

  @override
  HireRecord rebuild(void Function(HireRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HireRecordBuilder toBuilder() => new HireRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HireRecord &&
        industry == other.industry &&
        businessName == other.businessName &&
        startDate == other.startDate &&
        title == other.title &&
        description == other.description &&
        duration == other.duration &&
        createdAt == other.createdAt &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        createdTime == other.createdTime &&
        endDate == other.endDate &&
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
                                            $jc($jc(0, industry.hashCode),
                                                businessName.hashCode),
                                            startDate.hashCode),
                                        title.hashCode),
                                    description.hashCode),
                                duration.hashCode),
                            createdAt.hashCode),
                        email.hashCode),
                    photoUrl.hashCode),
                createdTime.hashCode),
            endDate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HireRecord')
          ..add('industry', industry)
          ..add('businessName', businessName)
          ..add('startDate', startDate)
          ..add('title', title)
          ..add('description', description)
          ..add('duration', duration)
          ..add('createdAt', createdAt)
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('createdTime', createdTime)
          ..add('endDate', endDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class HireRecordBuilder implements Builder<HireRecord, HireRecordBuilder> {
  _$HireRecord? _$v;

  String? _industry;
  String? get industry => _$this._industry;
  set industry(String? industry) => _$this._industry = industry;

  String? _businessName;
  String? get businessName => _$this._businessName;
  set businessName(String? businessName) => _$this._businessName = businessName;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _duration;
  String? get duration => _$this._duration;
  set duration(String? duration) => _$this._duration = duration;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  HireRecordBuilder() {
    HireRecord._initializeBuilder(this);
  }

  HireRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _industry = $v.industry;
      _businessName = $v.businessName;
      _startDate = $v.startDate;
      _title = $v.title;
      _description = $v.description;
      _duration = $v.duration;
      _createdAt = $v.createdAt;
      _email = $v.email;
      _photoUrl = $v.photoUrl;
      _createdTime = $v.createdTime;
      _endDate = $v.endDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HireRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HireRecord;
  }

  @override
  void update(void Function(HireRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HireRecord build() => _build();

  _$HireRecord _build() {
    final _$result = _$v ??
        new _$HireRecord._(
            industry: industry,
            businessName: businessName,
            startDate: startDate,
            title: title,
            description: description,
            duration: duration,
            createdAt: createdAt,
            email: email,
            photoUrl: photoUrl,
            createdTime: createdTime,
            endDate: endDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
