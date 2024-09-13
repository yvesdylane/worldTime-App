import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Laoding extends StatefulWidget {
  const Laoding({super.key});

  @override
  State<Laoding> createState() => _LaodingState();
}

class _LaodingState extends State<Laoding> {


  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Douala', flag: 'germany.png', url: 'Africa/Douala');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
