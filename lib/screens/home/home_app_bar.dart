import 'package:flutter/material.dart';
import 'package:fortytwo/screens/home/avatar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              onTap: () {},
              child: const SizedBox(
                  width: 48, height: 48, child: Icon(Icons.search, size: 40)),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          // Expanded(
          //   flex: 20,
          //   child: IconButton(
          //     onPressed: () {
          //       _auth.signOut();
          //     },
          //     icon: const Icon(Icons.search, size: 40),
          //   ),
          // )
        ],
      ),
    );
  }
}
