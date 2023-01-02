import '../backend/backend.dart';
import '../components/drawer_widget.dart';
import '../components/menu_widget.dart';
import '../components/navbar_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class StudentPageWidget extends StatefulWidget {
  const StudentPageWidget({
    Key? key,
    this.basicFilter,
  }) : super(key: key);

  final String? basicFilter;

  @override
  _StudentPageWidgetState createState() => _StudentPageWidgetState();
}

class _StudentPageWidgetState extends State<StudentPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  Completer<List<AfterSayRecord>>? _firestoreRequestCompleter;
  List<ProRecord> simpleSearchResults = [];
  String? dropDownValue;
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
        FFAppState().searchdone = false;
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

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
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

    return StreamBuilder<List<ProRecord>>(
      stream: queryProRecord(
        queryBuilder: (proRecord) =>
            proRecord.where('catergory', isEqualTo: '대학생상담사'),
      ),
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
        List<ProRecord> studentPageProRecordList = snapshot.data!;
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
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.18,
                        constraints: BoxConstraints(
                          maxHeight: 300,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primaryColor,
                              FlutterFlowTheme.of(context).secondaryColor
                            ],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 66,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primaryColor,
                              FlutterFlowTheme.of(context).secondaryColor
                            ],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 11, 0),
                                      child: Text(
                                        '대학생 상담사 찾기',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3Family),
                                            ),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowDropDown<String>(
                                    options: [
                                      '최근등록순',
                                      '만족도순',
                                      '상담회기순',
                                      '높은가격순',
                                      '낮은가격순',
                                      '거리순'
                                    ],
                                    onChanged: (val) async {
                                      setState(() => dropDownValue = val);
                                      FFAppState().update(() {
                                        FFAppState().searchdone = true;
                                      });
                                      await queryProRecordOnce()
                                          .then(
                                            (records) => simpleSearchResults =
                                                TextSearch(
                                              records
                                                  .map(
                                                    (record) =>
                                                        TextSearchItem(record, [
                                                      record.catergory!,
                                                      record.nowcompany!,
                                                      record.proName!,
                                                      record.proInfo!,
                                                      record
                                                          .primarycertification!,
                                                      record
                                                          .secondcertification!,
                                                      record
                                                          .thirdcertification!,
                                                      record.gender!,
                                                      record.intro!
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(dropDownValue!)
                                                    .map((r) => r.object)
                                                    .take(77)
                                                    .toList(),
                                          )
                                          .onError((_, __) =>
                                              simpleSearchResults = [])
                                          .whenComplete(() => setState(() {}));
                                    },
                                    width: 177,
                                    height: 50,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintText: '정렬 방법 선택',
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    elevation: 2,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0,
                                    borderRadius: 11,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (FFAppState().searchdone == false)
                        Builder(
                          builder: (context) {
                            final prolist = studentPageProRecordList.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: prolist.length,
                              itemBuilder: (context, prolistIndex) {
                                final prolistItem = prolist[prolistIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    constraints: BoxConstraints(
                                      maxWidth: 999,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          5),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: 333,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                11,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 0.36,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: 333,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                                                                      child: InkWell(
                                                                                        onTap: () async {
                                                                                          context.pushNamed(
                                                                                            'profileview',
                                                                                            queryParams: {
                                                                                              'proref': serializeParam(
                                                                                                prolistItem.reference,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(100),
                                                                                          child: Image.network(
                                                                                            valueOrDefault<String>(
                                                                                              prolistItem.img,
                                                                                              'https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927',
                                                                                            ),
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          context.pushNamed(
                                                                                            'reserveCalendar',
                                                                                            queryParams: {
                                                                                              'proref': serializeParam(
                                                                                                prolistItem.reference,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        text: '예약하기',
                                                                                        options: FFButtonOptions(
                                                                                          width: 130,
                                                                                          height: 40,
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                                color: Colors.white,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                              ),
                                                                                          elevation: 4,
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8),
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        desktop: false,
                                                      ))
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                  child:
                                                                      ListView(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                11,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 11),
                                                                                    child: Text(
                                                                                      '상담사 소개',
                                                                                      style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      context.pushNamed(
                                                                                        'profileview',
                                                                                        queryParams: {
                                                                                          'proref': serializeParam(
                                                                                            prolistItem.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 2),
                                                                                            child: Text(
                                                                                              prolistItem.date!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
                                                                                                child: Text(
                                                                                                  prolistItem.proName!,
                                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Text(
                                                                                            prolistItem.nowcompany!,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).subtitle1,
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: SingleChildScrollView(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '${prolistItem.workhistory?.toString()}년 이상 경력',
                                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                                          color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    prolistItem.primarycertification!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    prolistItem.secondcertification!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    prolistItem.thirdcertification!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        prolistItem.proInfo!,
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
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
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                    child: Text(
                                                                                      prolistItem.intro!,
                                                                                      style: FlutterFlowTheme.of(context).subtitle2,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            AfterSayRecord>>(
                                                                      future: (_firestoreRequestCompleter ??= Completer<
                                                                              List<AfterSayRecord>>()
                                                                            ..complete(queryAfterSayRecordOnce(
                                                                              limit: 3,
                                                                            )))
                                                                          .future,
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<AfterSayRecord>
                                                                            columnAfterSayRecordList =
                                                                            snapshot.data!;
                                                                        return RefreshIndicator(
                                                                          onRefresh:
                                                                              () async {
                                                                            setState(() =>
                                                                                _firestoreRequestCompleter = null);
                                                                            await waitForFirestoreRequestCompleter();
                                                                          },
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            physics:
                                                                                const AlwaysScrollableScrollPhysics(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: List.generate(columnAfterSayRecordList.length, (columnIndex) {
                                                                                final columnAfterSayRecord = columnAfterSayRecordList[columnIndex];
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.star_sharp,
                                                                                          color: Color(0xFFFFBE00),
                                                                                          size: 18,
                                                                                        ),
                                                                                        Text(
                                                                                          columnAfterSayRecord.goodNum!.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                        child: Text(
                                                                                          columnAfterSayRecord.text!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              }),
                                                                            ),
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.38,
                                                constraints: BoxConstraints(
                                                  maxWidth: 444,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'profileview',
                                                      queryParams: {
                                                        'proref':
                                                            serializeParam(
                                                          prolistItem.reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
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
                                                                  .fromSTEB(0,
                                                                      5, 0, 2),
                                                          child: Text(
                                                            prolistItem.date!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              prolistItem
                                                                  .proName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          prolistItem
                                                              .nowcompany!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1,
                                                                          3,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    '${prolistItem.workhistory?.toString()}년 이상 경력',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).subtitle1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  prolistItem
                                                                      .primarycertification!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Text(
                                                                  prolistItem
                                                                      .secondcertification!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Text(
                                                                  prolistItem
                                                                      .thirdcertification!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      prolistItem
                                                                          .proInfo!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
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
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'profileview',
                                                  queryParams: {
                                                    'proref': serializeParam(
                                                      prolistItem.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.33,
                                                height: 222,
                                                constraints: BoxConstraints(
                                                  maxWidth: 444,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3, 3, 3, 11),
                                                      child: Text(
                                                        '상담사 후기',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                    ),
                                                    FutureBuilder<
                                                        List<
                                                            ProaftersayRecord>>(
                                                      future:
                                                          queryProaftersayRecordOnce(
                                                        parent: prolistItem
                                                            .reference,
                                                        limit: 5,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<ProaftersayRecord>
                                                            columnProaftersayRecordList =
                                                            snapshot.data!;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              columnProaftersayRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnProaftersayRecord =
                                                                columnProaftersayRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          7),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .star_sharp,
                                                                        color: Color(
                                                                            0xFFFFBE00),
                                                                        size:
                                                                            18,
                                                                      ),
                                                                      Text(
                                                                        columnProaftersayRecord
                                                                            .goodnum!
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              15,
                                                                              0,
                                                                              15,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        columnProaftersayRecord
                                                                            .postDescription!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                );
                              },
                            );
                          },
                        ),
                      Builder(
                        builder: (context) {
                          final searchlist = simpleSearchResults.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: searchlist.length,
                            itemBuilder: (context, searchlistIndex) {
                              final searchlistItem =
                                  searchlist[searchlistIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  constraints: BoxConstraints(
                                    maxWidth: 999,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        color: Color(0x1F000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 400,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              11,
                                                                              0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.36,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              333,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      'profileview',
                                                                                      queryParams: {
                                                                                        'proref': serializeParam(
                                                                                          searchlistItem.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(50),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        searchlistItem.img,
                                                                                        'https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927',
                                                                                      ),
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    context.pushNamed(
                                                                                      'reserveCalendar',
                                                                                      queryParams: {
                                                                                        'proref': serializeParam(
                                                                                          searchlistItem.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: '예약하기',
                                                                                  options: FFButtonOptions(
                                                                                    width: 130,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                          color: Colors.white,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                        ),
                                                                                    elevation: 4,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.38,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        444,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'profileview',
                                                                        queryParams:
                                                                            {
                                                                          'proref':
                                                                              serializeParam(
                                                                            searchlistItem.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                11,
                                                                                0,
                                                                                2),
                                                                            child:
                                                                                Text(
                                                                              searchlistItem.date!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
                                                                                child: Text(
                                                                                  searchlistItem.proName!,
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            searchlistItem.nowcompany!,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    '${searchlistItem.workhistory?.toString()}년 이상 경력',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    searchlistItem.primarycertification!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    searchlistItem.secondcertification!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    searchlistItem.thirdcertification!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        searchlistItem.proInfo!,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
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
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  desktop: false,
                                                ))
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        1),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              11,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 11),
                                                                              child: Text(
                                                                                '상담사 소개',
                                                                                style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                              child: Text(
                                                                                searchlistItem.intro!,
                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          AfterSayRecord>>(
                                                                    future:
                                                                        queryAfterSayRecordOnce(
                                                                      limit: 3,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<AfterSayRecord>
                                                                          columnAfterSayRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: List.generate(
                                                                              columnAfterSayRecordList.length,
                                                                              (columnIndex) {
                                                                            final columnAfterSayRecord =
                                                                                columnAfterSayRecordList[columnIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.star_sharp,
                                                                                        color: Color(0xFFFFBE00),
                                                                                        size: 18,
                                                                                      ),
                                                                                      Text(
                                                                                        columnAfterSayRecord.goodNum!.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                      child: Text(
                                                                                        columnAfterSayRecord.text!,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.66,
                                              constraints: BoxConstraints(
                                                maxWidth: 777,
                                              ),
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.33,
                                                      height: 222,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 333,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 1),
                                                        child: ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              3),
                                                                          child:
                                                                              Text(
                                                                            '상담사 소개',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).subtitle2,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            searchlistItem.intro!,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'profileview',
                                                        queryParams: {
                                                          'proref':
                                                              serializeParam(
                                                            searchlistItem
                                                                .reference,
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
                                                              0.33,
                                                      height: 222,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 444,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
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
                                                                    .fromSTEB(
                                                                        3,
                                                                        3,
                                                                        3,
                                                                        11),
                                                            child: Text(
                                                              '상담사 후기',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle2,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                FutureBuilder<
                                                                    List<
                                                                        ProaftersayRecord>>(
                                                                  future:
                                                                      queryProaftersayRecordOnce(
                                                                    parent: searchlistItem
                                                                        .reference,
                                                                    limit: 5,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProaftersayRecord>
                                                                        columnProaftersayRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          columnProaftersayRecordList
                                                                              .length,
                                                                          (columnIndex) {
                                                                        final columnProaftersayRecord =
                                                                            columnProaftersayRecordList[columnIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              7),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.star_sharp,
                                                                                    color: Color(0xFFFFBE00),
                                                                                    size: 18,
                                                                                  ),
                                                                                  Text(
                                                                                    columnProaftersayRecord.goodnum!.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                  child: Text(
                                                                                    columnProaftersayRecord.postDescription!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
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
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: MenuWidget(
                    drawer: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
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
                                ? MediaQuery.of(context).viewInsets.bottom > 0
                                : _isKeyboardVisible) &&
                            responsiveVisibility(
                              context: context,
                              desktop: false,
                            ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: NavbarWidget(
                            c1: FlutterFlowTheme.of(context).secondaryText,
                            c2: FlutterFlowTheme.of(context).secondaryText,
                            c3: FlutterFlowTheme.of(context).primaryBackground,
                            c4: FlutterFlowTheme.of(context).secondaryText,
                            c5: FlutterFlowTheme.of(context).secondaryText,
                            c12: FlutterFlowTheme.of(context).primaryColor,
                            c45: FlutterFlowTheme.of(context).secondaryText,
                          ),
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

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
