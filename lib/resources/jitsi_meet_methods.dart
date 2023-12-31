// import 'package:flutter/cupertino.dart';
// import 'package:meet_hour/feature_flag/feature_flag.dart';
// import 'package:meet_hour/meet_hour.dart';
// import 'package:meet_hour/meet_hour_options.dart';
//
// import 'auth_methods.dart';
//
// class JitsiMeetMethods {
//   final AuthMethods _authMethods = AuthMethods();
//
//   void createMeeting({
//     required String roomName,
//     required bool isAudioMuted,
//     required bool isVideoMuted,
//     String username = '',
//   }) async {
//     try {
//       FeatureFlag featureFlag = FeatureFlag();
//       featureFlag.welcomePageEnabled = false;
//       featureFlag.resolution = FeatureFlagVideoResolution
//           .MD_RESOLUTION; // Limit video resolution to 360p
//       String name;
//       if (username.isEmpty) {
//         name = _authMethods.user.displayName!;
//       } else {
//         name = username;
//       }
//       var options = MeetHourMeetingOptions(room: roomName)
//         ..userDisplayName = name
//         ..userEmail = _authMethods.user.email
//         ..userAvatarURL = _authMethods.user.photoURL
//         ..audioMuted = isAudioMuted
//         ..videoMuted = isVideoMuted;
//
//       // _firestoreMethods.addToMeetingHistory(roomName);
//       await MeetHour.joinMeeting(options);
//     } catch (error) {
//       print("error: $error");
//     }
//   }
// }
