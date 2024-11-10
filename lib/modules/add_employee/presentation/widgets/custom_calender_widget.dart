import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../common/enums/date_option_enum.dart';
import '../../../../common/extensions/context_extension.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_font_size.dart';
import '../../../../common/theme/app_geometry.dart';
import '../../../../common/widgets/custom_sized_boxes.dart';
import '../../../../common/widgets/custom_text_widgets.dart';
import 'calender_bottom_widget.dart';
import 'package:intl/intl.dart';

class CustomCalendarWidget extends StatefulWidget {
  const CustomCalendarWidget(
      {super.key, required this.onDateSelected, this.initialDate});
  final ValueChanged<DateTime?> onDateSelected;
  final DateTime? initialDate;

  @override
  State<CustomCalendarWidget> createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  DateTime? _selectedDate;
  late DateTime _calendarDate;
  late int _daysInMonth;
  late int _firstDayOfMonthWeekday;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.initialDate;
    _calendarDate = widget.initialDate ?? DateTime.now();
    _calculateMonth();
  }

  // Calculate the number of days and the first weekday of the month for _calendarDate
  void _calculateMonth() {
    _daysInMonth =
        DateUtils.getDaysInMonth(_calendarDate.year, _calendarDate.month);
    _firstDayOfMonthWeekday =
        DateTime(_calendarDate.year, _calendarDate.month, 1).weekday % 7;
  }

  // Predefined date options
  List<DateOption> dateOptions = [
    DateOption.today,
    DateOption.nextMonday,
    DateOption.nextTuesday,
    DateOption.nextWeek,
    DateOption.noDate,
  ];

  // Moves to the previous month
  void _previousMonth() {
    setState(() {
      int targetMonth = _calendarDate.month - 1;
      int targetYear = _calendarDate.year;
      if (targetMonth < 1) {
        targetMonth = 12;
        targetYear -= 1;
      }
      int daysInTargetMonth = DateUtils.getDaysInMonth(targetYear, targetMonth);
      int newDay = _calendarDate.day > daysInTargetMonth
          ? daysInTargetMonth
          : _calendarDate.day;

      _calendarDate = DateTime(targetYear, targetMonth, newDay);
      _calculateMonth();
    });
  }

  // Moves to the next month
  void _nextMonth() {
    setState(() {
      int targetMonth = _calendarDate.month + 1;
      int targetYear = _calendarDate.year;
      if (targetMonth > 12) {
        targetMonth = 1;
        targetYear += 1;
      }
      int daysInTargetMonth = DateUtils.getDaysInMonth(targetYear, targetMonth);
      int newDay = _calendarDate.day > daysInTargetMonth
          ? daysInTargetMonth
          : _calendarDate.day;

      _calendarDate = DateTime(targetYear, targetMonth, newDay);
      _calculateMonth();
    });
  }

  // Renders each cell in the table for a day
  Widget _buildDayCell(int day) {
    final isSelected = _selectedDate != null &&
        day == _selectedDate!.day &&
        _calendarDate.month == _selectedDate!.month &&
        _calendarDate.year == _selectedDate!.year;

    final isToday = day == DateTime.now().day &&
        _calendarDate.month == DateTime.now().month &&
        _calendarDate.year == DateTime.now().year;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate =
              DateTime(_calendarDate.year, _calendarDate.month, day);
          widget.onDateSelected(_selectedDate);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : Colors.transparent,
          shape: BoxShape.circle,
          border: isToday && !isSelected
              ? Border.all(color: AppColors.blue, width: 2)
              : null,
        ),
        child: Text(
          day.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Builds the options grid
  Widget _buildDateOptions() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: context.isDesktop
          ? 10
          : context.isTablet
              ? 5
              : 2.5,
      physics: const NeverScrollableScrollPhysics(),
      children: dateOptions.map((option) {
        log('is selected ${option.value == _selectedDate} //$_selectedDate  // ${option.value}');
        final isSelected = option.value?.day == _selectedDate?.day ||
            (option.value == null && _selectedDate == null);
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = option.value;
              if (_selectedDate != null) {
                _calendarDate = _selectedDate!;
                _calculateMonth();
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color:
                  isSelected ? AppColors.blue : AppColors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: TextRobo14W400(
                option.title,
                color: isSelected ? Colors.white : AppColors.blue,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> days = [];
    // Add empty spaces for the first week
    days.addAll(List.generate(
        _firstDayOfMonthWeekday, (index) => const SizedBox.shrink()));

    for (int day = 1; day <= _daysInMonth; day++) {
      days.add(_buildDayCell(day));
    }

    return Container(
      padding: AppEdgeInsets.a10,
      child: Column(
        children: [
          _buildDateOptions(),
          const SBH20(),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: _previousMonth,
                        icon: const Icon(Icons.chevron_left)),
                    Text(
                      DateFormat.yMMMM().format(_calendarDate),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: _nextMonth,
                        icon: const Icon(Icons.chevron_right)),
                  ],
                ),
                const SizedBox(height: 8),
                Table(
                  children: [
                    TableRow(
                      children: List.generate(7, (index) {
                        final dayName =
                            DateFormat.E().format(DateTime(2023, 1, index + 1));
                        return Center(
                            child: Text(dayName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)));
                      }),
                    ),
                  ],
                ),
                Table(
                  children: [
                    for (int i = 0; i < (days.length / 7).ceil(); i++)
                      TableRow(
                        children: List.generate(7, (index) {
                          final dayIndex = i * 7 + index;
                          return dayIndex < days.length
                              ? days[dayIndex]
                              : const SizedBox.shrink();
                        }),
                      ),
                  ],
                ),
              ],
            ),
          ),
          CalendarBottomWidget(
            buttonWidth: AppSize.size90,
            onCancelPressed: () {
              Navigator.of(context).pop();
            },
            onSavePressed: () {
              widget.onDateSelected(_selectedDate);
              Navigator.of(context).pop();
            },
            selectedDate: _selectedDate,
          ),
          const SBH10(),
        ],
      ),
    );
  }
}
