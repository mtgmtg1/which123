import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottommessage_widget.dart';
import '../components/drawer_widget.dart';
import '../components/feel_num_widget.dart';
import '../components/navbar_widget.dart';
import '../components/profil_menu_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyPageWidget extends StatefulWidget {
  const MyPageWidget({Key? key}) : super(key: key);

  @override
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget> {
  DateTimeRange? calendarSelectedDay;
  TextEditingController? textFieldBirthController;
  TextEditingController? textFieldNicnameController;
  TextEditingController? textFieldPhoneController;
  TextEditingController? textFieldIntroduceController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
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
    textFieldBirthController?.dispose();
    textFieldNicnameController?.dispose();
    textFieldPhoneController?.dispose();
    textFieldIntroduceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final pieChartColorsList = [
      Color(0xFFD354E3),
      Color(0xFF9418A8),
      Color(0xFF00335A),
      Color(0xFF5CFB11)
    ];
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
        final myPagePersonRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          drawer: Drawer(
            elevation: 16,
            child: DrawerWidget(),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 999,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: MediaQuery.of(context).size.height * 0.18,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 22, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              constraints: BoxConstraints(
                                maxWidth: 444,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (dateTimeFormat(
                                          'Md',
                                          currentUserDocument!.reservation1,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ) ==
                                        dateTimeFormat(
                                          'Md',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ))
                                      AuthUserStreamWidget(
                                        builder: (context) =>
                                            SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 11),
                                                child: Text(
                                                  '오늘 상담 예약이 있습니다.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 11),
                                                child: Text(
                                                  '상담예약 ${dateTimeFormat(
                                                    'M/d h:mm a',
                                                    myPagePersonRecord
                                                        .reservation1,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        fontSize: 22,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: '상담 참여',
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 11, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      constraints: BoxConstraints(
                                        maxWidth: 999,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 2),
                                              child: Text(
                                                '오늘의 기분 입력',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          fontSize: 22,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Text(
                                                  '이미 입력한 기분은 내 정보 설정에서 수정이 가능 합니다. :)',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            FeelNumWidget(),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 11, 0, 0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 30),
                                                        child: Text(
                                                          '감정점수 히스토리',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title2,
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 11, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 11, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .feeldaycate =
                                                              '일';
                                                        });
                                                      },
                                                      text: '일별',
                                                      options: FFButtonOptions(
                                                        width: 99,
                                                        height: 40,
                                                        color:
                                                            Color(0xFFD411E4),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle2Family),
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 11, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .feeldaycate =
                                                              '주';
                                                        });
                                                      },
                                                      text: '주별',
                                                      options: FFButtonOptions(
                                                        width: 99,
                                                        height: 40,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family,
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle2Family),
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .feeldaycate = '월';
                                                      });
                                                    },
                                                    text: '월별',
                                                    options: FFButtonOptions(
                                                      width: 99,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 11, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState().piechart =
                                                            true;
                                                      });
                                                    },
                                                    text: '원형차트',
                                                    options: FFButtonOptions(
                                                      width: 99,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            StreamBuilder<List<FeelsetRecord>>(
                                              stream: queryFeelsetRecord(
                                                queryBuilder: (feelsetRecord) =>
                                                    feelsetRecord
                                                        .where('userref',
                                                            isEqualTo:
                                                                currentUserReference)
                                                        .orderBy('createat'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<FeelsetRecord>
                                                    containerFeelsetRecordList =
                                                    snapshot.data!;
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (FFAppState()
                                                              .piechart ==
                                                          true)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        11,
                                                                        11,
                                                                        11,
                                                                        11),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.44,
                                                              child:
                                                                  FlutterFlowPieChart(
                                                                data:
                                                                    FFPieChartData(
                                                                  values: containerFeelsetRecordList
                                                                      .map((d) =>
                                                                          d.feel)
                                                                      .toList(),
                                                                  colors:
                                                                      pieChartColorsList,
                                                                  radius: [100],
                                                                ),
                                                                donutHoleRadius:
                                                                    0,
                                                                donutHoleColor:
                                                                    Colors
                                                                        .white,
                                                                sectionLabelType:
                                                                    PieChartSectionLabelType
                                                                        .value,
                                                                sectionLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .title3,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (FFAppState()
                                                              .feeldaycate ==
                                                          '월')
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        11,
                                                                        11,
                                                                        11,
                                                                        11),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.44,
                                                              child: Stack(
                                                                children: [
                                                                  FlutterFlowLineChart(
                                                                    data: [
                                                                      FFLineChartData(
                                                                        xData: containerFeelsetRecordList
                                                                            .map((d) =>
                                                                                d.createat)
                                                                            .toList(),
                                                                        yData: containerFeelsetRecordList
                                                                            .map((d) =>
                                                                                d.feel)
                                                                            .toList(),
                                                                        settings:
                                                                            LineChartBarData(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          barWidth:
                                                                              1,
                                                                          isCurved:
                                                                              true,
                                                                          preventCurveOverShooting:
                                                                              true,
                                                                          dotData:
                                                                              FlDotData(show: false),
                                                                          belowBarData:
                                                                              BarAreaData(
                                                                            show:
                                                                                true,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                    chartStylingInfo:
                                                                        ChartStylingInfo(
                                                                      enableTooltip:
                                                                          true,
                                                                      tooltipBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      borderWidth:
                                                                          2,
                                                                    ),
                                                                    axisBounds:
                                                                        AxisBounds(
                                                                      maxX: 300,
                                                                      maxY: 10,
                                                                    ),
                                                                    xAxisLabelInfo:
                                                                        AxisLabelInfo(
                                                                      title:
                                                                          '월별',
                                                                      titleTextStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle2,
                                                                    ),
                                                                    yAxisLabelInfo:
                                                                        AxisLabelInfo(
                                                                      title:
                                                                          '감정점수',
                                                                      titleTextStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      showLabels:
                                                                          true,
                                                                      labelInterval:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1,
                                                                            0.75),
                                                                    child:
                                                                        FlutterFlowChartLegendWidget(
                                                                      entries: [
                                                                        LegendEntry(
                                                                            FlutterFlowTheme.of(context).primaryColor,
                                                                            '월별'),
                                                                      ],
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          50,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1,
                                                                      textPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x77FFFFFF),
                                                                      borderWidth:
                                                                          1,
                                                                      borderColor:
                                                                          Colors
                                                                              .black,
                                                                      indicatorSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (FFAppState()
                                                              .feeldaycate ==
                                                          '일')
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        11,
                                                                        11,
                                                                        11,
                                                                        11),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.44,
                                                              child: Stack(
                                                                children: [
                                                                  FlutterFlowLineChart(
                                                                    data: [
                                                                      FFLineChartData(
                                                                        xData: containerFeelsetRecordList
                                                                            .map((d) =>
                                                                                d.createat)
                                                                            .toList(),
                                                                        yData: containerFeelsetRecordList
                                                                            .map((d) =>
                                                                                d.feel)
                                                                            .toList(),
                                                                        settings:
                                                                            LineChartBarData(
                                                                          color:
                                                                              Color(0xFFD354E3),
                                                                          barWidth:
                                                                              1,
                                                                          isCurved:
                                                                              true,
                                                                          preventCurveOverShooting:
                                                                              true,
                                                                          dotData:
                                                                              FlDotData(show: false),
                                                                        ),
                                                                      )
                                                                    ],
                                                                    chartStylingInfo:
                                                                        ChartStylingInfo(
                                                                      enableTooltip:
                                                                          true,
                                                                      tooltipBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      showGrid:
                                                                          true,
                                                                      borderColor:
                                                                          Colors
                                                                              .black,
                                                                      borderWidth:
                                                                          1,
                                                                    ),
                                                                    axisBounds:
                                                                        AxisBounds(
                                                                      maxX: 30,
                                                                      maxY: 10,
                                                                    ),
                                                                    xAxisLabelInfo:
                                                                        AxisLabelInfo(
                                                                      title:
                                                                          '일자별',
                                                                      titleTextStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      showLabels:
                                                                          true,
                                                                      labelInterval:
                                                                          5,
                                                                    ),
                                                                    yAxisLabelInfo:
                                                                        AxisLabelInfo(
                                                                      title:
                                                                          '감정점수',
                                                                      titleTextStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      showLabels:
                                                                          true,
                                                                      labelInterval:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1,
                                                                            0.55),
                                                                    child:
                                                                        FlutterFlowChartLegendWidget(
                                                                      entries: [
                                                                        LegendEntry(
                                                                            Color(0xFFD354E3),
                                                                            '일별'),
                                                                      ],
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          50,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1,
                                                                      textPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x7357636C),
                                                                      borderWidth:
                                                                          1,
                                                                      borderColor:
                                                                          Colors
                                                                              .black,
                                                                      indicatorSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (FFAppState()
                                                              .feeldaycate ==
                                                          '주')
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        11,
                                                                        11,
                                                                        11,
                                                                        11),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.44,
                                                              child: Stack(
                                                                children: [
                                                                  FlutterFlowLineChart(
                                                                    data: [
                                                                      FFLineChartData(
                                                                        xData: containerFeelsetRecordList
                                                                            .map((d) =>
                                                                                d.createat)
                                                                            .toList(),
                                                                        yData: containerFeelsetRecordList
                                                                            .map((d) =>
                                                                                d.feel)
                                                                            .toList(),
                                                                        settings:
                                                                            LineChartBarData(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          barWidth:
                                                                              1,
                                                                          dotData:
                                                                              FlDotData(show: false),
                                                                          belowBarData:
                                                                              BarAreaData(
                                                                            show:
                                                                                true,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                    chartStylingInfo:
                                                                        ChartStylingInfo(
                                                                      enableTooltip:
                                                                          true,
                                                                      tooltipBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      showGrid:
                                                                          true,
                                                                      borderColor:
                                                                          Colors
                                                                              .black,
                                                                      borderWidth:
                                                                          1,
                                                                    ),
                                                                    axisBounds:
                                                                        AxisBounds(
                                                                      maxX: 70,
                                                                      maxY: 10,
                                                                    ),
                                                                    xAxisLabelInfo:
                                                                        AxisLabelInfo(
                                                                      title:
                                                                          '주별',
                                                                      titleTextStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle2,
                                                                      showLabels:
                                                                          true,
                                                                      labelInterval:
                                                                          7,
                                                                    ),
                                                                    yAxisLabelInfo:
                                                                        AxisLabelInfo(
                                                                      title:
                                                                          '감정점수',
                                                                      titleTextStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      showLabels:
                                                                          true,
                                                                      labelInterval:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1,
                                                                            0.6),
                                                                    child:
                                                                        FlutterFlowChartLegendWidget(
                                                                      entries: [
                                                                        LegendEntry(
                                                                            FlutterFlowTheme.of(context).tertiaryColor,
                                                                            '주별'),
                                                                      ],
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          50,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1,
                                                                      textPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x81FFFFFF),
                                                                      borderWidth:
                                                                          1,
                                                                      borderColor:
                                                                          Colors
                                                                              .black,
                                                                      indicatorSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FutureBuilder<List<PersonRecord>>(
                                      future: queryPersonRecordOnce(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<PersonRecord>
                                            columnPersonRecordList =
                                            snapshot.data!;
                                        final columnPersonRecord =
                                            columnPersonRecordList.isNotEmpty
                                                ? columnPersonRecordList.first
                                                : null;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: StreamBuilder<
                                                    List<FeelsetRecord>>(
                                                  stream: queryFeelsetRecord(
                                                    queryBuilder: (feelsetRecord) =>
                                                        feelsetRecord
                                                            .where('userref',
                                                                isEqualTo:
                                                                    currentUserReference)
                                                            .orderBy(
                                                                'createat'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<FeelsetRecord>
                                                        calendarFeelsetRecordList =
                                                        snapshot.data!;
                                                    return FlutterFlowCalendar(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      weekFormat: false,
                                                      weekStartsMonday: true,
                                                      initialDate:
                                                          getCurrentTimestamp,
                                                      onChange: (DateTimeRange?
                                                          newSelectedDate) async {
                                                        calendarSelectedDay =
                                                            newSelectedDate;
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .feelSelectcalendar =
                                                              calendarSelectedDay
                                                                  ?.start;
                                                          FFAppState()
                                                                  .calendarSelectDayString =
                                                              dateTimeFormat(
                                                            'yMd',
                                                            calendarSelectedDay!
                                                                .start,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          );
                                                        });
                                                        setState(() {});
                                                      },
                                                      titleStyle: TextStyle(),
                                                      dayOfWeekStyle:
                                                          TextStyle(),
                                                      dateStyle: TextStyle(),
                                                      selectedDateStyle:
                                                          TextStyle(),
                                                      inactiveDateStyle:
                                                          TextStyle(),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.66,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '달력에서 해당 날짜를 탭하면 그 날짜의 감정점수를 볼 수 있습니다.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                    if (FFAppState()
                                                            .selectedfeel !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 11,
                                                                    0, 0),
                                                        child: Text(
                                                          '${dateTimeFormat(
                                                            'Md',
                                                            calendarSelectedDay
                                                                ?.start,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}의 감정점수는 ${FFAppState().selectednum.toString()}점 입니다.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 30),
                                                child: Text(
                                                  '내 정보 수정',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.95,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.09,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '이름',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 1,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF4CABC4),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Text(
                                                                      currentUserDisplayName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle2Family,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.09,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '이메일',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 1,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF4CABC4),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  currentUserEmail,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).subtitle2Family,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.09,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '닉네임',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 1,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF4CABC4),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      textFieldNicnameController ??=
                                                                          TextEditingController(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      columnPersonRecord!
                                                                          .nickname,
                                                                      '닉네임없음',
                                                                    ),
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                  maxLines:
                                                                      null,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.09,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '전화번호',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 1,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF4CABC4),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      textFieldPhoneController ??=
                                                                          TextEditingController(
                                                                    text: columnPersonRecord!
                                                                        .phoneNumber,
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.09,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '생년월일',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 1,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF4CABC4),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      textFieldBirthController ??=
                                                                          TextEditingController(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      columnPersonRecord!
                                                                          .birth
                                                                          .toString(),
                                                                      '입력없음',
                                                                    ),
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        '생년월일8자리',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.09,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '소개',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 1,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF4CABC4),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      textFieldIntroduceController ??=
                                                                          TextEditingController(
                                                                    text: columnPersonRecord!
                                                                        .introduce,
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 11, 0, 11),
                                                child: Container(
                                                  width: 150,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          final personUpdateData =
                                                              createPersonRecordData(
                                                            nickname:
                                                                textFieldNicnameController
                                                                        ?.text ??
                                                                    '',
                                                            phoneNumber:
                                                                textFieldPhoneController
                                                                        ?.text ??
                                                                    '',
                                                            introduce:
                                                                textFieldIntroduceController
                                                                        ?.text ??
                                                                    '',
                                                          );
                                                          await currentUserReference!
                                                              .update(
                                                                  personUpdateData);
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    BottommessageWidget(
                                                                  title:
                                                                      '수정 완료',
                                                                  txt:
                                                                      '수정이 완료되었습니다.',
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        text: '정보 수정하기',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color:
                                                              Color(0xFF61BDE4),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        17,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).subtitle2Family),
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 22, 0, 0),
                                    child: Text(
                                      '상담 히스토리',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            fontSize: 22,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      constraints: BoxConstraints(
                                        maxWidth: 999,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                      child:
                                          StreamBuilder<List<PersoncashRecord>>(
                                        stream: queryPersoncashRecord(
                                          parent: currentUserReference,
                                          queryBuilder: (personcashRecord) =>
                                              personcashRecord
                                                  .orderBy('created_at'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PersoncashRecord>
                                              columnPersoncashRecordList =
                                              snapshot.data!;
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnPersoncashRecordList
                                                      .length, (columnIndex) {
                                                final columnPersoncashRecord =
                                                    columnPersoncashRecordList[
                                                        columnIndex];
                                                return InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'profileview',
                                                      queryParams: {
                                                        'proref':
                                                            serializeParam(
                                                          columnPersoncashRecord
                                                              .proref,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.92,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        3,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            11),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    columnPersoncashRecord
                                                                        .proname!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                  Text(
                                                                    columnPersoncashRecord
                                                                        .review!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                  Text(
                                                                    '평점${columnPersoncashRecord.goodnum?.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 12, 0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      formatNumber(
                                                                        columnPersoncashRecord
                                                                            .amount!,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle2Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '원',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle2Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      'M/d H:mm',
                                                                      columnPersoncashRecord
                                                                          .createdAt!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              12,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(22, 22, 22, 22),
                            child: Text(
                              '내가 쓴 글',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontSize: 22,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 111),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 1111,
                              ),
                              decoration: BoxDecoration(),
                              child: StreamBuilder<List<Post1Record>>(
                                stream: queryPost1Record(
                                  queryBuilder: (post1Record) =>
                                      post1Record.where('ref',
                                          isEqualTo: currentUserReference),
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
                                  List<Post1Record> columnPost1RecordList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnPost1RecordList.length,
                                          (columnIndex) {
                                        final columnPost1Record =
                                            columnPost1RecordList[columnIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 16, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.88,
                                              constraints: BoxConstraints(
                                                maxWidth: 1111,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 12, 12, 12),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    0, 5),
                                                        child: Text(
                                                          columnPost1Record
                                                              .title!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    16, 10, 0),
                                                        child: Text(
                                                          columnPost1Record
                                                              .text!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    16, 10, 0),
                                                        child: Text(
                                                          '답변 - ${columnPost1Record.answerR?.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 24,
                                                        thickness: 1,
                                                        color:
                                                            Color(0xFFDBE2E7),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            width: 110,
                                                            height: 55,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnPost1Record
                                                                          .image,
                                                                      'https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927',
                                                                    ),
                                                                    width: 20,
                                                                    height: 20,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    columnPost1Record
                                                                        .postID!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 1,
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF7EDDE5),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 110,
                                                            height: 55,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .remove_red_eye,
                                                                  color: Color(
                                                                      0xFF70CAF0),
                                                                  size: 20,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    columnPost1Record
                                                                        .view!
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF70CAF0),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    child: ProfilMenuWidget(),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: !(isWeb
                                ? MediaQuery.of(context).viewInsets.bottom > 0
                                : _isKeyboardVisible) &&
                            responsiveVisibility(
                              context: context,
                              desktop: false,
                            ),
                        child: NavbarWidget(
                          c1: FlutterFlowTheme.of(context).secondaryText,
                          c2: FlutterFlowTheme.of(context).secondaryText,
                          c3: FlutterFlowTheme.of(context).primaryBackground,
                          c4: FlutterFlowTheme.of(context).secondaryText,
                          c5: FlutterFlowTheme.of(context).primaryColor,
                          c12: FlutterFlowTheme.of(context).secondaryText,
                          c45: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
