import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart' as Foundation;
// import 'package:flutter/widgets.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

// const DSN_URL =
//     'https://8f221b3cc1b94fd1b9fee453a6ba6cc0@o549560.ingest.sentry.io/5672490';

// Future<void> main() async {
//   await SentryFlutter.init(
//     (options) => options.dsn = DSN_URL,
//     appRunner: () => runApp(App()),
//   );
// }

// class App extends StatelessWidget {
  
//   static FirebaseAnalytics analytics = FirebaseAnalytics();
//   static FirebaseAnalysticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);


//   static Future<void> reportError(dynamic error, dynamic stackTrace) async {
//     // if(Foundation.kDebugMode){
//     //   print(stackTrace);
//     //   return;
//     // }
//     final sentryId =
//         await Sentry.captureException(error, stackTrace: stackTrace);
//     if (sentryId.isSuccessful) {
//       print('Sentry ID: ${sentryId}')
//     }
//     else {
//       print('Failed to report to Sentry: ${sentryId.error}')
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       navigatorObservers: <NavigatorObserver>[observer],
//       home: MyHomePage(
//         title: 'Firebase Analytics Demo',
//         analytics: analytics,
//         observer: observer,
//       ),
//       // home: ExampleScreen(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;
//   final FirebaseAnalytics analytics;
//   final FirebaseAnalyticsObserver observer;
//   MyHomePage({Key key, this.title, this.analytics, this.observer}) : super(key: key);
//   @override
//   _MyHomePageState createState() => _MyHomePageState(analytics, observer);
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final FirebaseAnalyticsObserver observer;
//   final FirebaseAnalytics analytics;
//   String _message = '';

//   _MyHomePageState(this.analytics, this.observer);

//   void setMessage(String message){
//     setState((){
//       _message = message;
//     });
//   }

//   Future<void> _sendAnalyticsEvent() async {
//     await analytics.logEvent(
//       name: 'test_event',
//       parameters: <String, dynamic>{
//         'string': 'string',
//         'int': 42,
//         'long': 12345678910,
//         'double': 42.0,
//         'bool': true,
//       }
//     );
//     setMessage('logEvent succeeded');

//     Future<void> _testSetUserId() async {
//       await analytics.setUserId('some_user');
//       setMessage('setUserId succeeded');
//     }

//     Future<void> _testSetUserProperty() async {
//       await analytics.setUserProperty(name: 'regular', value: 'indeed');
//       setMessage('setUserProperty succeeded');
//     }

//     Future<void> _testAllEventTypes() async {
//       await analytics.logAddPaymentInfo();
//       await analytics.logAddToCard(
//         currency: 'USD',
//         value: 123.0,
//         itemId: 'test item id',
//         itemName: 'test item name',
//         itemCategory: 'test item category',
//         quantity: 5,
//         price: 24.0,
//         origin: 'test origin',
//         itemLocationId: 'test location id',
//         destination: 'test destination',
//         startDate: '2015-09-14',
//         endDate: '2015-09-17',
//       );
//       await analytics.logAddToWishList(
//         itemId: 'test item id',
//         itemName: 'test item name',
//         itemCategory: 'test item category',
//         quantity: 5,
//         price: 24.0,
//         value: 123.0,
//         currency: 'USD',
//         itemLocationId: 'test location id',
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

// class ExampleScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // throw StateError('Example Error');
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Exmaple Screen'),
//         ),
//         body: Center(
//             child: RaisedButton(
//           child: Text('Throw an exception'),
//           onPressed: () {
//             throw StateError('Example Error!');
//           },
//         )));
//   }
// }

