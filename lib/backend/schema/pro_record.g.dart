// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pro_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProRecord> _$proRecordSerializer = new _$ProRecordSerializer();

class _$ProRecordSerializer implements StructuredSerializer<ProRecord> {
  @override
  final Iterable<Type> types = const [ProRecord, _$ProRecord];
  @override
  final String wireName = 'ProRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.proName;
    if (value != null) {
      result
        ..add('pro_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.proInfo;
    if (value != null) {
      result
        ..add('Pro_info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('Date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.intro;
    if (value != null) {
      result
        ..add('Intro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.star;
    if (value != null) {
      result
        ..add('Star')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('IMG')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.priceref;
    if (value != null) {
      result
        ..add('priceref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userref;
    if (value != null) {
      result
        ..add('userref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.goodnum;
    if (value != null) {
      result
        ..add('goodnum')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createat;
    if (value != null) {
      result
        ..add('createat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.catergory;
    if (value != null) {
      result
        ..add('catergory')
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
    value = object.personref;
    if (value != null) {
      result
        ..add('personref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.personlistref;
    if (value != null) {
      result
        ..add('personlistref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.stop;
    if (value != null) {
      result
        ..add('stop')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.workhistory;
    if (value != null) {
      result
        ..add('workhistory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.workhistorystring;
    if (value != null) {
      result
        ..add('workhistorystring')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nowcompany;
    if (value != null) {
      result
        ..add('nowcompany')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.primarycertification;
    if (value != null) {
      result
        ..add('primarycertification')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.secondcertification;
    if (value != null) {
      result
        ..add('secondcertification')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thirdcertification;
    if (value != null) {
      result
        ..add('thirdcertification')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.morecertification;
    if (value != null) {
      result
        ..add('morecertification')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.enrollwaiting;
    if (value != null) {
      result
        ..add('enrollwaiting')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.nowactive;
    if (value != null) {
      result
        ..add('nowactive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.place;
    if (value != null) {
      result
        ..add('place')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.mainwork;
    if (value != null) {
      result
        ..add('mainwork')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ProRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pro_name':
          result.proName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Pro_info':
          result.proInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Intro':
          result.intro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Star':
          result.star = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'IMG':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'priceref':
          result.priceref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userref':
          result.userref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'goodnum':
          result.goodnum.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'review':
          result.review.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'createat':
          result.createat = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'catergory':
          result.catergory = serializers.deserialize(value,
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
        case 'personref':
          result.personref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'personlistref':
          result.personlistref.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'stop':
          result.stop = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'workhistory':
          result.workhistory = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'workhistorystring':
          result.workhistorystring.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company':
          result.company.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nowcompany':
          result.nowcompany = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'primarycertification':
          result.primarycertification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'secondcertification':
          result.secondcertification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thirdcertification':
          result.thirdcertification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'morecertification':
          result.morecertification.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'enrollwaiting':
          result.enrollwaiting = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'nowactive':
          result.nowactive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'place':
          result.place = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'mainwork':
          result.mainwork.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ProRecord extends ProRecord {
  @override
  final String? proName;
  @override
  final String? proInfo;
  @override
  final String? date;
  @override
  final String? intro;
  @override
  final String? star;
  @override
  final String? img;
  @override
  final DocumentReference<Object?>? priceref;
  @override
  final DocumentReference<Object?>? userref;
  @override
  final BuiltList<double>? goodnum;
  @override
  final BuiltList<String>? review;
  @override
  final int? price;
  @override
  final DateTime? createat;
  @override
  final String? catergory;
  @override
  final double? totalearn;
  @override
  final double? totalspend;
  @override
  final DocumentReference<Object?>? personref;
  @override
  final BuiltList<DocumentReference<Object?>>? personlistref;
  @override
  final bool? stop;
  @override
  final double? workhistory;
  @override
  final BuiltList<String>? workhistorystring;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final BuiltList<String>? company;
  @override
  final String? nowcompany;
  @override
  final String? primarycertification;
  @override
  final String? secondcertification;
  @override
  final String? thirdcertification;
  @override
  final BuiltList<String>? morecertification;
  @override
  final bool? enrollwaiting;
  @override
  final bool? nowactive;
  @override
  final String? gender;
  @override
  final LatLng? place;
  @override
  final BuiltList<String>? mainwork;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProRecord([void Function(ProRecordBuilder)? updates]) =>
      (new ProRecordBuilder()..update(updates))._build();

  _$ProRecord._(
      {this.proName,
      this.proInfo,
      this.date,
      this.intro,
      this.star,
      this.img,
      this.priceref,
      this.userref,
      this.goodnum,
      this.review,
      this.price,
      this.createat,
      this.catergory,
      this.totalearn,
      this.totalspend,
      this.personref,
      this.personlistref,
      this.stop,
      this.workhistory,
      this.workhistorystring,
      this.phone,
      this.email,
      this.company,
      this.nowcompany,
      this.primarycertification,
      this.secondcertification,
      this.thirdcertification,
      this.morecertification,
      this.enrollwaiting,
      this.nowactive,
      this.gender,
      this.place,
      this.mainwork,
      this.ffRef})
      : super._();

  @override
  ProRecord rebuild(void Function(ProRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProRecordBuilder toBuilder() => new ProRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProRecord &&
        proName == other.proName &&
        proInfo == other.proInfo &&
        date == other.date &&
        intro == other.intro &&
        star == other.star &&
        img == other.img &&
        priceref == other.priceref &&
        userref == other.userref &&
        goodnum == other.goodnum &&
        review == other.review &&
        price == other.price &&
        createat == other.createat &&
        catergory == other.catergory &&
        totalearn == other.totalearn &&
        totalspend == other.totalspend &&
        personref == other.personref &&
        personlistref == other.personlistref &&
        stop == other.stop &&
        workhistory == other.workhistory &&
        workhistorystring == other.workhistorystring &&
        phone == other.phone &&
        email == other.email &&
        company == other.company &&
        nowcompany == other.nowcompany &&
        primarycertification == other.primarycertification &&
        secondcertification == other.secondcertification &&
        thirdcertification == other.thirdcertification &&
        morecertification == other.morecertification &&
        enrollwaiting == other.enrollwaiting &&
        nowactive == other.nowactive &&
        gender == other.gender &&
        place == other.place &&
        mainwork == other.mainwork &&
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, proName.hashCode), proInfo.hashCode), date.hashCode), intro.hashCode), star.hashCode), img.hashCode), priceref.hashCode), userref.hashCode), goodnum.hashCode), review.hashCode), price.hashCode), createat.hashCode), catergory.hashCode), totalearn.hashCode), totalspend.hashCode),
                                                                                personref.hashCode),
                                                                            personlistref.hashCode),
                                                                        stop.hashCode),
                                                                    workhistory.hashCode),
                                                                workhistorystring.hashCode),
                                                            phone.hashCode),
                                                        email.hashCode),
                                                    company.hashCode),
                                                nowcompany.hashCode),
                                            primarycertification.hashCode),
                                        secondcertification.hashCode),
                                    thirdcertification.hashCode),
                                morecertification.hashCode),
                            enrollwaiting.hashCode),
                        nowactive.hashCode),
                    gender.hashCode),
                place.hashCode),
            mainwork.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProRecord')
          ..add('proName', proName)
          ..add('proInfo', proInfo)
          ..add('date', date)
          ..add('intro', intro)
          ..add('star', star)
          ..add('img', img)
          ..add('priceref', priceref)
          ..add('userref', userref)
          ..add('goodnum', goodnum)
          ..add('review', review)
          ..add('price', price)
          ..add('createat', createat)
          ..add('catergory', catergory)
          ..add('totalearn', totalearn)
          ..add('totalspend', totalspend)
          ..add('personref', personref)
          ..add('personlistref', personlistref)
          ..add('stop', stop)
          ..add('workhistory', workhistory)
          ..add('workhistorystring', workhistorystring)
          ..add('phone', phone)
          ..add('email', email)
          ..add('company', company)
          ..add('nowcompany', nowcompany)
          ..add('primarycertification', primarycertification)
          ..add('secondcertification', secondcertification)
          ..add('thirdcertification', thirdcertification)
          ..add('morecertification', morecertification)
          ..add('enrollwaiting', enrollwaiting)
          ..add('nowactive', nowactive)
          ..add('gender', gender)
          ..add('place', place)
          ..add('mainwork', mainwork)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProRecordBuilder implements Builder<ProRecord, ProRecordBuilder> {
  _$ProRecord? _$v;

  String? _proName;
  String? get proName => _$this._proName;
  set proName(String? proName) => _$this._proName = proName;

  String? _proInfo;
  String? get proInfo => _$this._proInfo;
  set proInfo(String? proInfo) => _$this._proInfo = proInfo;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _intro;
  String? get intro => _$this._intro;
  set intro(String? intro) => _$this._intro = intro;

  String? _star;
  String? get star => _$this._star;
  set star(String? star) => _$this._star = star;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  DocumentReference<Object?>? _priceref;
  DocumentReference<Object?>? get priceref => _$this._priceref;
  set priceref(DocumentReference<Object?>? priceref) =>
      _$this._priceref = priceref;

  DocumentReference<Object?>? _userref;
  DocumentReference<Object?>? get userref => _$this._userref;
  set userref(DocumentReference<Object?>? userref) => _$this._userref = userref;

  ListBuilder<double>? _goodnum;
  ListBuilder<double> get goodnum =>
      _$this._goodnum ??= new ListBuilder<double>();
  set goodnum(ListBuilder<double>? goodnum) => _$this._goodnum = goodnum;

  ListBuilder<String>? _review;
  ListBuilder<String> get review =>
      _$this._review ??= new ListBuilder<String>();
  set review(ListBuilder<String>? review) => _$this._review = review;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DateTime? _createat;
  DateTime? get createat => _$this._createat;
  set createat(DateTime? createat) => _$this._createat = createat;

  String? _catergory;
  String? get catergory => _$this._catergory;
  set catergory(String? catergory) => _$this._catergory = catergory;

  double? _totalearn;
  double? get totalearn => _$this._totalearn;
  set totalearn(double? totalearn) => _$this._totalearn = totalearn;

  double? _totalspend;
  double? get totalspend => _$this._totalspend;
  set totalspend(double? totalspend) => _$this._totalspend = totalspend;

  DocumentReference<Object?>? _personref;
  DocumentReference<Object?>? get personref => _$this._personref;
  set personref(DocumentReference<Object?>? personref) =>
      _$this._personref = personref;

  ListBuilder<DocumentReference<Object?>>? _personlistref;
  ListBuilder<DocumentReference<Object?>> get personlistref =>
      _$this._personlistref ??= new ListBuilder<DocumentReference<Object?>>();
  set personlistref(ListBuilder<DocumentReference<Object?>>? personlistref) =>
      _$this._personlistref = personlistref;

  bool? _stop;
  bool? get stop => _$this._stop;
  set stop(bool? stop) => _$this._stop = stop;

  double? _workhistory;
  double? get workhistory => _$this._workhistory;
  set workhistory(double? workhistory) => _$this._workhistory = workhistory;

  ListBuilder<String>? _workhistorystring;
  ListBuilder<String> get workhistorystring =>
      _$this._workhistorystring ??= new ListBuilder<String>();
  set workhistorystring(ListBuilder<String>? workhistorystring) =>
      _$this._workhistorystring = workhistorystring;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  ListBuilder<String>? _company;
  ListBuilder<String> get company =>
      _$this._company ??= new ListBuilder<String>();
  set company(ListBuilder<String>? company) => _$this._company = company;

  String? _nowcompany;
  String? get nowcompany => _$this._nowcompany;
  set nowcompany(String? nowcompany) => _$this._nowcompany = nowcompany;

  String? _primarycertification;
  String? get primarycertification => _$this._primarycertification;
  set primarycertification(String? primarycertification) =>
      _$this._primarycertification = primarycertification;

  String? _secondcertification;
  String? get secondcertification => _$this._secondcertification;
  set secondcertification(String? secondcertification) =>
      _$this._secondcertification = secondcertification;

  String? _thirdcertification;
  String? get thirdcertification => _$this._thirdcertification;
  set thirdcertification(String? thirdcertification) =>
      _$this._thirdcertification = thirdcertification;

  ListBuilder<String>? _morecertification;
  ListBuilder<String> get morecertification =>
      _$this._morecertification ??= new ListBuilder<String>();
  set morecertification(ListBuilder<String>? morecertification) =>
      _$this._morecertification = morecertification;

  bool? _enrollwaiting;
  bool? get enrollwaiting => _$this._enrollwaiting;
  set enrollwaiting(bool? enrollwaiting) =>
      _$this._enrollwaiting = enrollwaiting;

  bool? _nowactive;
  bool? get nowactive => _$this._nowactive;
  set nowactive(bool? nowactive) => _$this._nowactive = nowactive;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  LatLng? _place;
  LatLng? get place => _$this._place;
  set place(LatLng? place) => _$this._place = place;

  ListBuilder<String>? _mainwork;
  ListBuilder<String> get mainwork =>
      _$this._mainwork ??= new ListBuilder<String>();
  set mainwork(ListBuilder<String>? mainwork) => _$this._mainwork = mainwork;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProRecordBuilder() {
    ProRecord._initializeBuilder(this);
  }

  ProRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _proName = $v.proName;
      _proInfo = $v.proInfo;
      _date = $v.date;
      _intro = $v.intro;
      _star = $v.star;
      _img = $v.img;
      _priceref = $v.priceref;
      _userref = $v.userref;
      _goodnum = $v.goodnum?.toBuilder();
      _review = $v.review?.toBuilder();
      _price = $v.price;
      _createat = $v.createat;
      _catergory = $v.catergory;
      _totalearn = $v.totalearn;
      _totalspend = $v.totalspend;
      _personref = $v.personref;
      _personlistref = $v.personlistref?.toBuilder();
      _stop = $v.stop;
      _workhistory = $v.workhistory;
      _workhistorystring = $v.workhistorystring?.toBuilder();
      _phone = $v.phone;
      _email = $v.email;
      _company = $v.company?.toBuilder();
      _nowcompany = $v.nowcompany;
      _primarycertification = $v.primarycertification;
      _secondcertification = $v.secondcertification;
      _thirdcertification = $v.thirdcertification;
      _morecertification = $v.morecertification?.toBuilder();
      _enrollwaiting = $v.enrollwaiting;
      _nowactive = $v.nowactive;
      _gender = $v.gender;
      _place = $v.place;
      _mainwork = $v.mainwork?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProRecord;
  }

  @override
  void update(void Function(ProRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProRecord build() => _build();

  _$ProRecord _build() {
    _$ProRecord _$result;
    try {
      _$result = _$v ??
          new _$ProRecord._(
              proName: proName,
              proInfo: proInfo,
              date: date,
              intro: intro,
              star: star,
              img: img,
              priceref: priceref,
              userref: userref,
              goodnum: _goodnum?.build(),
              review: _review?.build(),
              price: price,
              createat: createat,
              catergory: catergory,
              totalearn: totalearn,
              totalspend: totalspend,
              personref: personref,
              personlistref: _personlistref?.build(),
              stop: stop,
              workhistory: workhistory,
              workhistorystring: _workhistorystring?.build(),
              phone: phone,
              email: email,
              company: _company?.build(),
              nowcompany: nowcompany,
              primarycertification: primarycertification,
              secondcertification: secondcertification,
              thirdcertification: thirdcertification,
              morecertification: _morecertification?.build(),
              enrollwaiting: enrollwaiting,
              nowactive: nowactive,
              gender: gender,
              place: place,
              mainwork: _mainwork?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'goodnum';
        _goodnum?.build();
        _$failedField = 'review';
        _review?.build();

        _$failedField = 'personlistref';
        _personlistref?.build();

        _$failedField = 'workhistorystring';
        _workhistorystring?.build();

        _$failedField = 'company';
        _company?.build();

        _$failedField = 'morecertification';
        _morecertification?.build();

        _$failedField = 'mainwork';
        _mainwork?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
