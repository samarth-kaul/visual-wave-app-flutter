import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:visual_wave_app/resources/firestore_methods.dart';
import 'package:visual_wave_app/resources/jitsi_meet_methods.dart';
import 'package:visual_wave_app/screens/video_meeting.dart';
import '../widgets/home_meeting_button.dart';
import 'join_meeting_screen.dart';

class MeetingScreen extends StatefulWidget {
  MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  String _meetingCode = "abcdfgqw";

  @override
  void initState() {
    // TODO: implement initState
    var uuid = Uuid();
    String temp = uuid.v1();
    _meetingCode = temp.substring(0, 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: () {
                // adding new meeting to the firebase
                FirestoreMethods().addToMeetingHistory(_meetingCode);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VideoMeetingScreen(
                      channelName: _meetingCode.trim(),
                      // meetID: ,
                    ),
                  ),
                );
              },
              icon: Icons.videocam_rounded,
              text: "New Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JoinMeetingScreen(
                        // channelName: _meetingCode.trim(),
                        ),
                  ),
                );
              },
              icon: Icons.add_box_rounded,
              text: "Join Meeting",
            ),
            // HomeMeetingButton(
            //   onPressed: () {},
            //   icon: Icons.calendar_today_rounded,
            //   text: "Schedule",
            // ),
            // HomeMeetingButton(
            //   onPressed: () {},
            //   icon: Icons.arrow_upward_rounded,
            //   text: "Share Screen",
            // ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Create/Join Meetings with just a click",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
