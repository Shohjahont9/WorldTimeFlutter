import 'package:CountryTime/services/world_time.dart';
import 'package:flutter/material.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  _Choose_locationState createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: "uk.png", url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: "greece.png", url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: "egypt.png", url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: "kenya.png", url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: "usa.png", url: 'America/Chicago'),
    WorldTime(location: 'New_York', flag: "usa.png", url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: "south_korea.png", url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: "indenesia.png", url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose location"),
        centerTitle: true,
        elevation: 4.0,
      ),
      // ignore: deprecated_member_use
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/ca.jpg"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
