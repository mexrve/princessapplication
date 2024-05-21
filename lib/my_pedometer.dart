import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';

import 'package:prencess_app/main.dart';

class MyPedometer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prenses Adım Sayar',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StepCounterPage(),
    );
  }
}

class StepCounterPage extends StatefulWidget {
  @override
  _StepCounterPageState createState() => _StepCounterPageState();
}

class _StepCounterPageState extends State<StepCounterPage> {
  late StreamSubscription<StepCount> _subscription;
  int _stepCount = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void initPlatformState() {
    // Subscribe to step count stream and handle step count updates
    _subscription = Pedometer.stepCountStream
        .handleError(onStepCountError)
        .listen(onStepCount);
  }

  void onStepCount(StepCount event) {
    setState(() {
      _stepCount = event.steps; // Update step count from StepCount object
    });
  }

  void onStepCountError(error) {
    print('Failed to get step count: $error');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prenses Adım Sayar'),
        backgroundColor: Colors.pink[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.directions_walk, size: 100, color: Colors.pink[300]),
            SizedBox(height: 20),
            Text(
              'Bugün atılan adım sayısı:',
              style: TextStyle(fontSize: 24, color: Colors.pink[800]),
            ),
            Text(
              '$_stepCount adım',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[900]),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
