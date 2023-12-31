// ignore_for_file: must_be_immutable

import 'package:cervivorbd/Utils/Theme/color_constants.dart';
import 'package:flutter/material.dart';

class Appbar2 extends StatelessWidget with PreferredSizeWidget {
  String? username;
  String? propicURL;
  Appbar2({Key? key, this.username, this.propicURL}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: ClipOval(
              child: Material(
                color: Colors.black, // Button color
                child: InkWell(
                  splashColor: kdarkPink, // Splash color
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.menu, color: Colors.white, size: 20)),
                ),
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: false,
        title: Transform(
          // you can forcefully translate values left side using Transform
          transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: const SizedBox(
            height: 30,
            child: Image(
              alignment: Alignment.topLeft,
              image: AssetImage('assets/images/logoheader.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: kBlackColor900),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(username!.split(' ').first,
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                    width: 40,
                    height: 50,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(propicURL!),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
