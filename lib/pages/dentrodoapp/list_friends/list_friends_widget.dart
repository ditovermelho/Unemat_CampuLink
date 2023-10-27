import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_friends_model.dart';
export 'list_friends_model.dart';

class ListFriendsWidget extends StatefulWidget {
  const ListFriendsWidget({
    Key? key,
    required this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _ListFriendsWidgetState createState() => _ListFriendsWidgetState();
}

class _ListFriendsWidgetState extends State<ListFriendsWidget> {
  late ListFriendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListFriendsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Lista de Coneções',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).info,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: StreamBuilder<List<ConnectionsRecord>>(
                  stream: queryConnectionsRecord(
                    queryBuilder: (connectionsRecord) =>
                        connectionsRecord.where(
                      'user_ref',
                      isEqualTo: widget.userRef,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ConnectionsRecord> listViewConnectionsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewConnectionsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewConnectionsRecord =
                            listViewConnectionsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 1.0),
                          child: Container(
                            width: 100.0,
                            height: 72.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewConnectionsRecord.otherUser!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final rowUsersRecord = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 2.0, 2.0, 2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(44.0),
                                            child: Image.network(
                                              rowUsersRecord.photoUrl,
                                              width: 44.0,
                                              height: 44.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  rowUsersRecord.displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                              ),
                                              Text(
                                                rowUsersRecord.email,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.message,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.result =
                                              await queryChatsRecordOnce(
                                            queryBuilder: (chatsRecord) =>
                                                chatsRecord
                                                    .where(
                                                      'user_a',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'user_b',
                                                      isEqualTo: rowUsersRecord
                                                          .reference,
                                                    ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if ((_model.result != null) != null) {
                                            context.pushNamed(
                                              'chat',
                                              queryParameters: {
                                                'chatRef': serializeParam(
                                                  _model.result?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'chatUser': serializeParam(
                                                  rowUsersRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'chatUser': rowUsersRecord,
                                              },
                                            );
                                          } else {
                                            var chatsRecordReference =
                                                ChatsRecord.collection.doc();
                                            await chatsRecordReference
                                                .set(createChatsRecordData(
                                              userA: currentUserReference,
                                              userB: rowUsersRecord.reference,
                                            ));
                                            _model.newChat =
                                                ChatsRecord.getDocumentFromData(
                                                    createChatsRecordData(
                                                      userA:
                                                          currentUserReference,
                                                      userB: rowUsersRecord
                                                          .reference,
                                                    ),
                                                    chatsRecordReference);

                                            context.pushNamed(
                                              'chat',
                                              queryParameters: {
                                                'chatUser': serializeParam(
                                                  rowUsersRecord,
                                                  ParamType.Document,
                                                ),
                                                'chatRef': serializeParam(
                                                  _model.newChat?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'chatUser': rowUsersRecord,
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed(
                                            'profile_another_use_stop_follow',
                                            queryParameters: {
                                              'refUser': serializeParam(
                                                rowUsersRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'connecref': serializeParam(
                                                listViewConnectionsRecord
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
