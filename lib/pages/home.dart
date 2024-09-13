import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    Color txColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.deepOrangeAccent,
                    ),
                    label: const Text(
                        'Edit Location',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: txColor
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                      data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color: txColor
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
