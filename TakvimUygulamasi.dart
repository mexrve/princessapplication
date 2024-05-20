import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TakvimUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Takvim Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TakvimEkrani(),
    );
  }
}

class TakvimEkrani extends StatefulWidget {
  @override
  _TakvimEkraniState createState() => _TakvimEkraniState();
}

class _TakvimEkraniState extends State<TakvimEkrani> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> _markedDays = [];
  int countOfMarkedDays=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takvim Uygulaması'),
      ),
      body:
      Column(
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
                if (_markedDays.contains(selectedDay)) {
                  setState(() {
                    countOfMarkedDays=countOfMarkedDays+1;
                  });
                  _markedDays.remove(selectedDay);
                } else {
                  _markedDays.add(selectedDay);
                }
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
              ElevatedButton(
                  child: Text("$countOfMarkedDays günlük seridesin. Zinciri kırma!"),
                  onPressed: (){

                },
              ),
            ],
          ),
        ],
      ),

    );
  }
}