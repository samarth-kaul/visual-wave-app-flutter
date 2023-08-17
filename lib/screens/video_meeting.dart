import 'dart:convert';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoMeetingScreen extends StatefulWidget {
  String channelName;
  // String meetID;
  VideoMeetingScreen({required this.channelName});
  @override
  State<VideoMeetingScreen> createState() => _VideoMeetingScreenState();
}

class _VideoMeetingScreenState extends State<VideoMeetingScreen> {
  late AgoraClient _client;
  bool _loading = true;
  String tempToken = "";

  Future<void> getToken() async {
    // String link =
    //     "https://agora-node-tokenserver--samarthkaul2.repl.co/access_token?channelName=test";
    // Response _response = await get(Uri.parse(link));
    //
    // Map data = jsonDecode(_response.body);
    // // print(["token"]);
    // setState(() {
    //   tempToken = data["token"];
    // });

    _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "2bfcd78b46a7440dbd5ea0dba22ca45c",
          // tempToken: tempToken,
          tokenUrl:
              "https://agora-node-tokenserver--samarthkaul2.repl.co/access_token?channelName=${widget.channelName}",
          // tempToken:
          //     "007eJxTYDi0uOBh1t7PL4xTFvxed2ChXMv2trVmblOKik4+id4x9c1DBQajpLTkFHOLJBOzRHMTE4OUpBTT1EQglWhklJxoYpr8etOdlIZARob/Er8YGRkgEMTnZyjLLC5NzIkvTyxLjU8sKGBgAACvMypk",
          channelName: widget.channelName,
        ),
        enabledPermission: [Permission.camera, Permission.microphone]);

    Future.delayed(Duration(seconds: 1)).then(
      (value) => setState(() => _loading = false),
    );
  }

  // final AgoraClient _client = AgoraClient(
  //     agoraConnectionData: AgoraConnectionData(
  //       appId: "2bfcd78b46a7440dbd5ea0dba22ca45c",
  //       // tempToken: tempToken,
  //       tokenUrl:
  //           "https://agora-node-tokenserver--samarthkaul2.repl.co/access_token?channelName=test",
  //       // tempToken:
  //       //     "007eJxTYDi0uOBh1t7PL4xTFvxed2ChXMv2trVmblOKik4+id4x9c1DBQajpLTkFHOLJBOzRHMTE4OUpBTT1EQglWhklJxoYpr8etOdlIZARob/Er8YGRkgEMTnZyjLLC5NzIkvTyxLjU8sKGBgAACvMypk",
  //
  //       channelName: "visual_wave_app",
  //     ),
  //     enabledPermission: [Permission.camera, Permission.microphone]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    initAgora();
  }

  void initAgora() async {
    await _client.initialize();
    // setState(() {
    //   _loading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meeting ID: ${widget.channelName}"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AgoraVideoViewer(
                    client: _client,
                    // layoutType: Layout.floating,
                  ),
                  AgoraVideoButtons(client: _client, ),
                ],
              ),
      ),
    );
  }
}
