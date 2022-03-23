// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, unused_local_variable, avoid_print
import 'package:flutter/material.dart';
import 'package:world/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime("Egypt", "egypt.png", "Africa/Cairo");
    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flagUrl': worldTime.flagUrl,
      'time': worldTime.time,
      'isDaytime': worldTime.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
