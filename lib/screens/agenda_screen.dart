import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<Event>> _events = {};

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _addEvent(String title, TimeOfDay time, String notes) {
    final event = Event(title, time, notes);
    setState(() {
      if (_events[_selectedDay] != null) {
        _events[_selectedDay]!.add(event);
      } else {
        _events[_selectedDay] = [event];
      }
    });
  }

  Future<void> _displayAddEventDialog(BuildContext context) async {
    String eventTitle = '';
    TimeOfDay? eventTime;
    String eventNotes = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Evento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  eventTitle = value;
                },
                decoration: InputDecoration(hintText: "Título del Evento"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null && pickedTime != eventTime) {
                    setState(() {
                      eventTime = pickedTime;
                    });
                  }
                },
                child: Text(eventTime != null
                    ? 'Hora: ${eventTime!.hour}:${eventTime!.minute}'
                    : 'Seleccionar Hora'),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  eventNotes = value;
                },
                decoration: InputDecoration(hintText: "Notas"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar', style: TextStyle(color: Colors.green)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Agregar', style: TextStyle(color: Colors.green)),
              onPressed: () {
                if (eventTitle.isNotEmpty && eventTime != null) {
                  _addEvent(eventTitle, eventTime!, eventNotes);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda', style: TextStyle(color: Colors.green)),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(color: Colors.black),
            ),
          ),
          ..._getEventsForDay(_selectedDay).map((event) => ListTile(
            title: Text(event.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hora: ${event.time.hour}:${event.time.minute}'),
                if (event.notes.isNotEmpty) Text('Notas: ${event.notes}'),
              ],
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddEventDialog(context),
        child: Icon(Icons.add ,color: Colors.green,),
      ),
    );
  }
}

class Event {
  final String title;
  final TimeOfDay time;
  final String notes;

  Event(this.title, this.time, this.notes);
}
