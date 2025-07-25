import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditMenstruationDateScreen extends StatefulWidget {
  const EditMenstruationDateScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditMenstruationDateScreenState createState() =>
      _EditMenstruationDateScreenState();
}

class _EditMenstruationDateScreenState
    extends State<EditMenstruationDateScreen> {
  DateTime selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _getPhase(DateTime date) {
    int day = date.day;
    if (day <= 5) {
      return "Menstrual Phase";
    } else if (day <= 14) {
      return "Follicular Phase";
    } else if (day <= 16) {
      return "Ovulatory Phase";
    } else {
      return "Luteal Phase";
    }
  }

  int _daysLeft(DateTime date, int startDay) {
    int cycleLength = 28;
    int diff = (startDay - date.day + cycleLength) % cycleLength;
    return diff == 0 ? cycleLength : diff;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) {
                  DateTime weekDate = selectedDate.subtract(
                      Duration(days: selectedDate.weekday - index - 1));
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: weekDate.day == selectedDate.day
                            ? Colors.purple
                            : Colors.grey.shade200,
                        child: Text("${weekDate.day}"),
                      ),
                      Text(DateFormat('E').format(weekDate)),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey.shade300, Colors.white]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat("d MMMM yyyy").format(selectedDate),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("Day 1 of your ${_getPhase(selectedDate)}",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
              child: Text("Edit Date", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 16),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  _phaseCard(
                      "Menstrual Phase",
                      const Color.fromARGB(255, 247, 236, 118),
                      _daysLeft(selectedDate, 1),
                      "menstrual.png"),
                  _phaseCard("Follicular Phase", Colors.pinkAccent,
                      _daysLeft(selectedDate, 6), "follicular.png"),
                  _phaseCard("Ovulatory Phase", Colors.yellowAccent,
                      _daysLeft(selectedDate, 14), "ovulation1.png"),
                  _phaseCard(
                      "Luteal Phase",
                      const Color.fromARGB(255, 227, 129, 244),
                      _daysLeft(selectedDate, 17),
                      "luteal.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phaseCard(String title, Color color, int daysLeft, String assetPath) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(assetPath, height: 30),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("$daysLeft days to go", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}