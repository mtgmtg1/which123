import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/drawer_widget.dart';
import '../components/menu_widget.dart';
import '../components/navbar_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReserveCalendarWidget extends StatefulWidget {
  const ReserveCalendarWidget({
    Key? key,
    this.proref,
    this.reservationref,
  }) : super(key: key);

  final DocumentReference? proref;
  final List<DocumentReference>? reservationref;

  @override
  _ReserveCalendarWidgetState createState() => _ReserveCalendarWidgetState();
}

class _ReserveCalendarWidgetState extends State<ReserveCalendarWidget> {
  DateTimeRange? calendarSelectedDay;
  ReservationRecord? reserveout;
  String? radioButtonValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().reserveProref = widget.proref;
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PersonRecord>(
      stream: PersonRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final reserveCalendarPersonRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          drawer: Drawer(
            elevation: 16,
            child: DrawerWidget(),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: StreamBuilder<ProRecord>(
              stream: ProRecord.getDocument(widget.proref!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                final stackProRecord = snapshot.data!;
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: MediaQuery.of(context).size.height * 0.18,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 777,
                              ),
                              decoration: BoxDecoration(),
                              child: FlutterFlowCalendar(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                weekFormat: false,
                                weekStartsMonday: true,
                                initialDate: getCurrentTimestamp,
                                onChange:
                                    (DateTimeRange? newSelectedDate) async {
                                  calendarSelectedDay = newSelectedDate;
                                  FFAppState().update(() {
                                    FFAppState().reserveCalendar =
                                        calendarSelectedDay?.start;
                                  });
                                  setState(() {});
                                },
                                titleStyle: TextStyle(
                                  fontFamily: 'gmarket',
                                  fontSize: 22,
                                ),
                                dayOfWeekStyle: TextStyle(
                                  fontFamily: 'gmarket',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 15,
                                ),
                                dateStyle: TextStyle(
                                  fontFamily: 'gmarket',
                                  fontSize: 15,
                                ),
                                selectedDateStyle: TextStyle(),
                                inactiveDateStyle: TextStyle(),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: StreamBuilder<List<ReservationRecord>>(
                              stream: queryReservationRecord(
                                queryBuilder: (reservationRecord) =>
                                    reservationRecord
                                        .where('personref',
                                            isEqualTo:
                                                reserveCalendarPersonRecord
                                                    .reference)
                                        .where('reservationtime',
                                            isEqualTo:
                                                calendarSelectedDay?.start),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<ReservationRecord>
                                    containerReservationRecordList =
                                    snapshot.data!;
                                return Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 999,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x21FFD200),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '기존 예약시간(예약 불가능)',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1Family),
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 11, 5, 0),
                                        child: Builder(
                                          builder: (context) {
                                            final reservationlist =
                                                containerReservationRecordList
                                                    .toList();
                                            return Wrap(
                                              spacing: 0,
                                              runSpacing: 0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(
                                                  reservationlist.length,
                                                  (reservationlistIndex) {
                                                final reservationlistItem =
                                                    reservationlist[
                                                        reservationlistIndex];
                                                return Text(
                                                  dateTimeFormat(
                                                    'M/d h:mm a',
                                                    reservationlistItem
                                                        .reservationtime!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.88,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 11, 0, 0),
                                              child: Text(
                                                '예약시간 선택',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                              ),
                                            ),
                                            FlutterFlowRadioButton(
                                              options: [
                                                '06시 예약',
                                                '07시 예약',
                                                '08시 예약',
                                                '09시 예약',
                                                '10시 예약',
                                                '11시 예약',
                                                '12시 예약',
                                                '13시 예약',
                                                '14시 예약',
                                                '15시 예약',
                                                '16시 예약',
                                                '17시 예약',
                                                '18시 예약',
                                                '19시 예약',
                                                '20시 예약',
                                                '21시 예약',
                                                '22시 예약',
                                                '23시 예약'
                                              ].toList(),
                                              onChanged: (val) => setState(
                                                  () => radioButtonValue = val),
                                              optionHeight: 33,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                              selectedTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                              buttonPosition:
                                                  RadioButtonPosition.left,
                                              direction: Axis.horizontal,
                                              radioButtonColor: Colors.blue,
                                              inactiveRadioButtonColor:
                                                  Color(0x8A000000),
                                              toggleable: false,
                                              horizontalAlignment:
                                                  WrapAlignment.start,
                                              verticalAlignment:
                                                  WrapCrossAlignment.start,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 11, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .reservemonthday =
                                                        dateTimeFormat(
                                                      'Md',
                                                      calendarSelectedDay!
                                                          .start,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                    FFAppState().reservehour =
                                                        radioButtonValue!;
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState().price =
                                                        stackProRecord.price!;
                                                  });

                                                  final reservationCreateData =
                                                      createReservationRecordData(
                                                    personref:
                                                        currentUserReference,
                                                    proref: widget.proref,
                                                    createtime:
                                                        getCurrentTimestamp,
                                                    reservemonthday:
                                                        FFAppState()
                                                            .reservemonthday,
                                                    reservehour: FFAppState()
                                                        .reservehour,
                                                  );
                                                  var reservationRecordReference =
                                                      ReservationRecord
                                                          .collection
                                                          .doc();
                                                  await reservationRecordReference
                                                      .set(
                                                          reservationCreateData);
                                                  reserveout = ReservationRecord
                                                      .getDocumentFromData(
                                                          reservationCreateData,
                                                          reservationRecordReference);

                                                  context.pushNamed(
                                                    'checkout',
                                                    queryParams: {
                                                      'proref': serializeParam(
                                                        widget.proref,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'reservehour':
                                                          serializeParam(
                                                        FFAppState()
                                                            .reservehour,
                                                        ParamType.String,
                                                      ),
                                                      'reservemonthday':
                                                          serializeParam(
                                                        FFAppState()
                                                            .reservemonthday,
                                                        ParamType.String,
                                                      ),
                                                      'reservationref':
                                                          serializeParam(
                                                        reserveout!.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  setState(() {});
                                                },
                                                text: '예약결제하기',
                                                options: FFButtonOptions(
                                                  width: 222,
                                                  height: 66,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 5, 5, 111),
                            child: Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 888,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    'https://images.unsplash.com/photo-1535273592342-5c7cea623ebb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHRyZWVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: Color(0x9939D2C0),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(16),
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(0),
                                            ),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            '상담사 소개',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  color: Colors.white,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 4,
                                          sigmaY: 5,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            color: Color(0x800E151B),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    stackProRecord.proName!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                                  ),
                                                  Text(
                                                    '상담료 50분당  ${formatNumber(
                                                      stackProRecord.price,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                    )} 원',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Text(
                                                      stackProRecord.intro!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle1Family),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: MenuWidget(
                          drawer: () async {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: !(isWeb
                                    ? MediaQuery.of(context).viewInsets.bottom >
                                        0
                                    : _isKeyboardVisible) &&
                                responsiveVisibility(
                                  context: context,
                                  desktop: false,
                                ),
                            child: NavbarWidget(
                              c1: FlutterFlowTheme.of(context).primaryColor,
                              c2: FlutterFlowTheme.of(context).secondaryText,
                              c3: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              c4: FlutterFlowTheme.of(context).secondaryText,
                              c5: FlutterFlowTheme.of(context).secondaryText,
                              c12: FlutterFlowTheme.of(context).secondaryText,
                              c45: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
