import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilebarWidget extends StatefulWidget {
  const ProfilebarWidget({Key? key}) : super(key: key);

  @override
  _ProfilebarWidgetState createState() => _ProfilebarWidgetState();
}

class _ProfilebarWidgetState extends State<ProfilebarWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 111,
            height: 111,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              child: AuthUserStreamWidget(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    valueOrDefault<String>(
                      currentUserPhoto,
                      'https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/309/59932b0eb046f9fa3e063b8875032edd_res.jpeg',
                    ),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: AuthUserStreamWidget(
                    child: Text(
                      currentUserDisplayName,
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('MyPage');
                    },
                    child: Text(
                      'My Page',
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle1Family,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle1Family),
                          ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    context.pushNamed('MyPage');
                  },
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF273E46),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
