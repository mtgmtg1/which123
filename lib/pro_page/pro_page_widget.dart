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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_search/text_search.dart';

class ProPageWidget extends StatefulWidget {
  const ProPageWidget({
    Key? key,
    this.filterBasic,
    this.filterRecent,
    this.filterBest,
  }) : super(key: key);

  final String? filterBasic;
  final String? filterRecent;
  final String? filterBest;

  @override
  _ProPageWidgetState createState() => _ProPageWidgetState();
}

class _ProPageWidgetState extends State<ProPageWidget>
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
  List<ProRecord> simpleSearchResults = [];
  String? dropDownValue;
  PagingController<DocumentSnapshot?, ProRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().searchdone = false);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProRecord>>(
      future: queryProRecordOnce(
        queryBuilder: (proRecord) =>
            proRecord.where('catergory', isEqualTo: '전문상담사'),
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
        List<ProRecord> proPageProRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          drawer: Drawer(
            elevation: 16,
            child: DrawerWidget(),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100,
                        height: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primaryColor,
                                      FlutterFlowTheme.of(context)
                                          .secondaryColor
                                    ],
                                    stops: [0, 1],
                                    begin: AlignmentDirectional(0, -1),
                                    end: AlignmentDirectional(0, 1),
                                  ),
                                ),
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
                                          '전문 상담사 찾기',
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
                                        '부부상담전문',
                                        '연애상담전문',
                                        '청소년상담전문',
                                        '거리순'
                                      ],
                                      onChanged: (val) async {
                                        setState(() => dropDownValue = val);
                                        setState(() =>
                                            FFAppState().searchdone = true);
                                        await queryProRecordOnce()
                                            .then(
                                              (records) => simpleSearchResults =
                                                  TextSearch(
                                                records
                                                    .map(
                                                      (record) =>
                                                          TextSearchItem(
                                                              record, [
                                                        record.proName!,
                                                        record.intro!,
                                                        record
                                                            .primarycertification!,
                                                        record
                                                            .secondcertification!,
                                                        record
                                                            .thirdcertification!,
                                                        record.gender!
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                      .search(dropDownValue!)
                                                      .map((r) => r.object)
                                                      .take(44)
                                                      .toList(),
                                            )
                                            .onError((_, __) =>
                                                simpleSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      width: 177,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Colors.black,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
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
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Visibility(
                                  visible: FFAppState().searchdone == false,
                                  child: Builder(
                                    builder: (context) {
                                      final prolist =
                                          proPageProRecordList.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: prolist.length,
                                        itemBuilder: (context, prolistIndex) {
                                          final prolistItem =
                                              prolist[prolistIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 12),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              constraints: BoxConstraints(
                                                maxWidth: 1222,
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
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 3, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 11, 0),
                                                                                  child: Container(
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            1),
                                                                        child:
                                                                            ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 11),
                                                                                          child: Text(
                                                                                            '상담사 소개',
                                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        if (responsiveVisibility(
                                                                                          context: context,
                                                                                          desktop: false,
                                                                                        ))
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
                                                                            ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                              child: FutureBuilder<List<AfterSayRecord>>(
                                                                                future: queryAfterSayRecordOnce(
                                                                                  limit: 3,
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
                                                                                  List<AfterSayRecord> columnAfterSayRecordList = snapshot.data!;
                                                                                  return SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: List.generate(columnAfterSayRecordList.length, (columnIndex) {
                                                                                        final columnAfterSayRecord = columnAfterSayRecordList[columnIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                                  child: Text(
                                                                                                    columnAfterSayRecord.text!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                          fontSize: 12,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
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
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.36,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 444,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'profileview',
                                                                  queryParams: {
                                                                    'proref':
                                                                        serializeParam(
                                                                      prolistItem
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              11,
                                                                              0,
                                                                              2),
                                                                      child:
                                                                          Text(
                                                                        prolistItem
                                                                            .date!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              11,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            prolistItem.proName!,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).subtitle1,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      prolistItem
                                                                          .nowcompany!,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1,
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
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
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.33,
                                                                  height: 222,
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            11),
                                                                        child:
                                                                            Text(
                                                                          '상담사 후기',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          List<
                                                                              ProaftersayRecord>>(
                                                                        future:
                                                                            queryProaftersayRecordOnce(
                                                                          parent:
                                                                              prolistItem.reference,
                                                                          limit:
                                                                              5,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<ProaftersayRecord>
                                                                              columnProaftersayRecordList =
                                                                              snapshot.data!;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                List.generate(columnProaftersayRecordList.length, (columnIndex) {
                                                                              final columnProaftersayRecord = columnProaftersayRecordList[columnIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation1']!),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (FFAppState().searchdone == false)
                        PagedListView<DocumentSnapshot<Object?>?, ProRecord>(
                          pagingController: () {
                            final Query<Object?> Function(Query<Object?>)
                                queryBuilder = (proRecord) => proRecord;
                            if (_pagingController != null) {
                              final query = queryBuilder(ProRecord.collection);
                              if (query != _pagingQuery) {
                                // The query has changed
                                _pagingQuery = query;
                                _streamSubscriptions
                                    .forEach((s) => s?.cancel());
                                _streamSubscriptions.clear();
                                _pagingController!.refresh();
                              }
                              return _pagingController!;
                            }

                            _pagingController =
                                PagingController(firstPageKey: null);
                            _pagingQuery = queryBuilder(ProRecord.collection);
                            _pagingController!
                                .addPageRequestListener((nextPageMarker) {
                              queryProRecordPage(
                                queryBuilder: (proRecord) => proRecord,
                                nextPageMarker: nextPageMarker,
                                pageSize: 25,
                                isStream: true,
                              ).then((page) {
                                _pagingController!.appendPage(
                                  page.data,
                                  page.nextPageMarker,
                                );
                                final streamSubscription =
                                    page.dataStream?.listen((data) {
                                  final itemIndexes = _pagingController!
                                      .itemList!
                                      .asMap()
                                      .map((k, v) =>
                                          MapEntry(v.reference.id, k));
                                  data.forEach((item) {
                                    final index =
                                        itemIndexes[item.reference.id];
                                    final items = _pagingController!.itemList!;
                                    if (index != null) {
                                      items.replaceRange(
                                          index, index + 1, [item]);
                                      _pagingController!.itemList = {
                                        for (var item in items)
                                          item.reference: item
                                      }.values.toList();
                                    }
                                  });
                                  setState(() {});
                                });
                                _streamSubscriptions.add(streamSubscription);
                              });
                            });
                            return _pagingController!;
                          }(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          builderDelegate: PagedChildBuilderDelegate<ProRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewMoIndex) {
                              final listViewMoProRecord =
                                  _pagingController!.itemList![listViewMoIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  constraints: BoxConstraints(
                                    maxWidth: 1222,
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
                                                                                          listViewMoProRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(100),
                                                                                    child: Image.network(
                                                                                      listViewMoProRecord.img!,
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
                                                                                          listViewMoProRecord.reference,
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
                                                                      0.36,
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
                                                                            listViewMoProRecord.reference,
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
                                                                              listViewMoProRecord.date!,
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
                                                                                  listViewMoProRecord.proName!,
                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            listViewMoProRecord.nowcompany!,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).subtitle2,
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
                                                                                    '${listViewMoProRecord.workhistory?.toString()}년 이상 경력',
                                                                                    style: FlutterFlowTheme.of(context).subtitle2,
                                                                                  ),
                                                                                  Text(
                                                                                    listViewMoProRecord.primarycertification!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    listViewMoProRecord.secondcertification!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    listViewMoProRecord.thirdcertification!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        listViewMoProRecord.proInfo!,
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 11),
                                                                              child: Text(
                                                                                '상담사 소개',
                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                              child: Text(
                                                                                listViewMoProRecord.intro!,
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                      child: Text(
                                                                                        columnAfterSayRecord.text!,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                              fontSize: 12,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                            ),
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
                                                                            listViewMoProRecord.intro!,
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
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.33,
                                                    height: 222,
                                                    constraints: BoxConstraints(
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
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(3,
                                                                      3, 3, 11),
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
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: [
                                                              FutureBuilder<
                                                                  List<
                                                                      ProaftersayRecord>>(
                                                                future:
                                                                    queryProaftersayRecordOnce(
                                                                  parent: listViewMoProRecord
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
                                                                          columnProaftersayRecordList[
                                                                              columnIndex];
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
                          ),
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
                    drawer: () async {},
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
                        child: NavbarWidget(
                          c1: FlutterFlowTheme.of(context).primaryColor,
                          c2: FlutterFlowTheme.of(context).secondaryText,
                          c3: FlutterFlowTheme.of(context).primaryBackground,
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
            ),
          ),
        );
      },
    );
  }
}
