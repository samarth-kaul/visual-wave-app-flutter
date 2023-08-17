import 'package:flutter/material.dart';
import 'package:visual_wave_app/resources/auth_methods.dart';
import 'package:visual_wave_app/screens/history_meeting_screen.dart';
import 'package:visual_wave_app/screens/join_meeting_screen.dart';
import 'package:visual_wave_app/utils/colors.dart';
import 'package:visual_wave_app/widgets/custom_button.dart';
import 'package:visual_wave_app/widgets/home_meeting_button.dart';

import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    CustomButton(text: "Log Out", onPressed: () => AuthMethods().signOut())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Meet & Chat"),
        centerTitle: true,
        elevation: 0,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onPageChanged,
        backgroundColor: footerColor,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meetings"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.person_outline_rounded), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.videocam_rounded,
              text: "New Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => JoinMeetingScreen()),
                // );
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
