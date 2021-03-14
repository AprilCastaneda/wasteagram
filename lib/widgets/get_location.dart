// import 'package:flutter/material.dart';

// import 'package:location/location.dart';

// class Location extends StatefulWidget {
//   @override
//   _LocationState createState() => _LocationState();
// }

// class _LocationState extends State<Location> {
//   LocationData locationData;

//   void initState() {
//     super.initState();
//     retrieveLocation();
//   }

//   void retrieveLocation() async {
//     var locationService = Location();
//     locationData = await locationService.getLocation();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (locationData == null) {
//       return Center(child: CircularProgressIndicator());
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // Text(
//               //   'You have pushed the button this many times:',
//               // ),
//               // Text(
//               //   '$_counter',
//               //   style: Theme.of(context).textTheme.headline4,
//               // ),
//               Text('Latitude: ${locationData.latitude}',
//                   style: Theme.of(context).textTheme.headline4),
//               Text('Longitude: ${locationData.longitude}',
//                   style: Theme.of(context).textTheme.headline4),
//             ],
//           ),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//       );
//     }
//   }
// }
