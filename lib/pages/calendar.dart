import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {}
  HijriDatePickerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = HijriDatePickerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SfHijriDateRangePicker(
          view: HijriDatePickerView.month,
          selectionMode: DateRangePickerSelectionMode.multiple,
          selectionColor: Colors.purple,
          controller: _controller,
          onSelectionChanged: _onSelectionChanged,
          monthViewSettings: const HijriDatePickerMonthViewSettings(
            firstDayOfWeek: 1,
            showWeekNumber: true,
            weekNumberStyle: DateRangePickerWeekNumberStyle(
                textStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
                backgroundColor: Colors.purple),
                
          ),
        ),
      ),
    );
  }
}
