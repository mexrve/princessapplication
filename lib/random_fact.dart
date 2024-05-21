import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RandomFactPage extends StatefulWidget {
  @override
  _RandomFactPageState createState() => _RandomFactPageState();
}

class _RandomFactPageState extends State<RandomFactPage> {
  String _fact = "Rastgele bir bilgi yükleniyor...";

  @override
  void initState() {
    super.initState();
    _fetchRandomFact();
  }

  Future<void> _fetchRandomFact() async {
    final response = await http
        .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _fact = data['text'];
      });
    } else {
      setState(() {
        _fact = "Bilgi alınamadı, lütfen daha sonra tekrar deneyin.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rastgele Bilgi'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _fact,
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchRandomFact,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

