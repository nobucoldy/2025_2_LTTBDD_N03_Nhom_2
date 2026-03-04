import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime tempDate;

  @override
  void initState() {
    super.initState();
    tempDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Expanded(
            child: CalendarDatePicker(
              initialDate: tempDate,
              firstDate: DateTime(2023),
              lastDate: DateTime(2030),
              onDateChanged: (date) {
                setState(() {
                  tempDate = date;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tempDate = DateTime.now().add(const Duration(days: 30));
                  });
                },
                child: const Text('1 tháng'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tempDate = DateTime.now().add(const Duration(days: 90));
                  });
                },
                child: const Text('3 tháng'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tempDate = DateTime.now().add(const Duration(days: 180));
                  });
                },
                child: const Text('6 tháng'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tempDate = DateTime.now().add(const Duration(days: 365));
                  });
                },
                child: const Text('1 năm'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                widget.onDateSelected(tempDate);
                Navigator.pop(context);
              },
              child: const Text('Chọn'),
            ),
          ),
        ],
      ),
    );
  }
}
