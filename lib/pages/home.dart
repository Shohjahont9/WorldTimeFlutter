import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : {"dataKey": ModalRoute.of(context)!.settings.arguments};
    Map data1 = data['dataKey'];

    print('dataList -> ${data['dataKey']}');

    String bgImage = data1['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data1['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              // ignore: deprecated_member_use
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data['dataKey'] = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(color: Colors.grey[300]),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['dataKey']['location'],
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[300]),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['dataKey']['time'],
                style: TextStyle(
                    fontSize: 66,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300]),
              )
            ],
          ),
        ),
      )),
    );
  }
}
