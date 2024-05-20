import 'package:flutter/material.dart';

class WaterTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Su Takip Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  @override
  _WaterTrackerPageState createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage> {
  int _waterCount = 0;  // Kullanıcının içtiği su miktarını tutacak değişken

  void _incrementWater() {
    setState(() {
      _waterCount++;  // Su sayısını bir artırır
    });
  }

  void _resetWater() {
    setState(() {
      _waterCount = 0;  // Su sayısını sıfırlar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prenses bugün kaç bardak su içti'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.local_drink, size: 100, color: Colors.lightBlueAccent),
            Text(
              'Bugün içtiğin su miktarı:',
              style: TextStyle(fontSize: 24, color: Colors.pink[800]),
            ),
            Text(
              '$_waterCount bardak',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.pink[900]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: "uniqueTag1",
                    onPressed: _incrementWater,
                    tooltip: 'Su Ekle',
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  FloatingActionButton(
                    heroTag: "uniqueTag2",
                    onPressed: _resetWater,
                    tooltip: 'Sıfırla',
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.refresh, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
