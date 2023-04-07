import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "212663d5ef594531ac47467556ea3026";
const token =
    "007eJxTYFi45X296lvRpPjXyhMfNDrMuzO/QPqBXHvfg4M1PO57dIsUGIwMjczMjFNMU9NMLU1MjQ0Tk03MTczMTU3NUhONDYzMns/XS2kIZGTomc7PxMgAgSA+K0NOYk5mCQMDAI7YH5E=";
const channel = "lalit";

void main() => runApp(const MaterialApp(home: videoCall()));

class videoCall extends StatefulWidget {
  const videoCall({Key? key}) : super(key: key);

  @override
  State<videoCall> createState() => _MyAppState();
}

class _MyAppState extends State<videoCall> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
    appId: appId,
    tempToken: token,
    channelName: channel,
  ));

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          // debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          // debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: const Text('Video Call'),
            ),
            backgroundColor: Colors.purple,
          ),
          body: Stack(
            children: [
              Center(
                child: _remoteVideo(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: Center(
                    child: _localUserJoined
                        ? AgoraVideoView(
                            controller: VideoViewController(
                              rtcEngine: _engine,
                              canvas: const VideoCanvas(uid: 0),
                            ),
                          )
                        : const CircularProgressIndicator(),
                  ),
                ),
              ),
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
                showAVState: true,
                // showMuteIndicator: true,
              ),
              AgoraVideoButtons(
                client: _client,
                enabledButtons: const [
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.toggleMic,
                  BuiltInButtons.switchCamera,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(channelId: channel),
        ),
      );
    } else {
      return const Text(
        'Wait',
        textAlign: TextAlign.center,
      );
    }
  }
}
