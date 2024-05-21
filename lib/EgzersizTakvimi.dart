import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TakvimUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Takvim Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EgzersizTakvimi(),
    );
  }
}

class EgzersizTakvimi extends StatefulWidget {
  @override
  _EgzersizTakvimiState createState() => _EgzersizTakvimiState();
}

class _EgzersizTakvimiState extends State<EgzersizTakvimi> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> _markedDays = [];
  int countOfMarkedDays=0;

  @override
  void initState() {
    super.initState();
    _loadMarkedDays();
  }

  Future<void> _loadMarkedDays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? markedDaysString = prefs.getStringList('markedDays');
    if (markedDaysString != null) {
      setState(() {
        _markedDays = markedDaysString.map((day) => DateTime.parse(day)).toList();
      });
    }
  }

  Future<void> _saveMarkedDays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> markedDaysString = _markedDays.map((day) => day.toIso8601String()).toList();
    await prefs.setStringList('markedDays', markedDaysString);
  }

  @override
  void dispose() {
    _saveMarkedDays();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Egzersiz Takvimi'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                if (_markedDays.contains(selectedDay)){
                  countOfMarkedDays = countOfMarkedDays - 1;
                  _markedDays.remove(selectedDay);
                } else {
                  countOfMarkedDays = countOfMarkedDays + 1;
                  _markedDays.add(selectedDay);
                }
                _saveMarkedDays();
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (_markedDays.contains(date)) {
                  return Positioned(
                    right: 1,
                    bottom: 1,
                    child: Icon(
                      Icons.check_circle,
                      size: 20.0,
                      color: Colors.red,
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){
              },
                child: Text("$countOfMarkedDays günlük seridesin. Zinciri kırma devam et!"),),
            ],
          ),
        ],
      ),
    );
  }
}
