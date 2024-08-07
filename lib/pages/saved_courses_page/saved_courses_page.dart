import 'package:flutter/material.dart';
import 'package:fortytwo/shared_widgets/avatar_widget.dart';

class SavedCoursesPage extends StatelessWidget {
  const SavedCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {},
                child: const UserAvatar()),
            Expanded(
              flex: 60,
              child: Container(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/grades');
                },
                child: const SizedBox(
                    width: 48, height: 48, child: Icon(Icons.search, size: 40)),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
