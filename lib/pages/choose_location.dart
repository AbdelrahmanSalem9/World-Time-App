// ignore_for_file: prefer_const_constructors

//import 'dart:html';

import 'package:world/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'location': worldTime.location,
      'flagUrl': worldTime.flagUrl,
      'time': worldTime.time,
      'isDaytime': worldTime.isDaytime
    });
  }

  List<WorldTime> locations = [
    WorldTime('Europe/London', 'London', 'uk.png'),
    WorldTime('Europe/Athens', 'Athens', 'greece.png'),
    WorldTime('Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'kenya.png'),
    WorldTime('America/Chicago', 'Chicago', 'usa.png'),
    WorldTime('America/New_York', 'New York', 'usa.png'),
    WorldTime('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (() {
                updateTime(index);
              }),
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/${locations[index].flagUrl}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
