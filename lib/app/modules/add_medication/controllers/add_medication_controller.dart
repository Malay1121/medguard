import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:medguard/app/helper/all_imports.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class AddMedicationController extends CommonController {
  //TODO: Implement AddMedicationController
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  Map weekDays = {
    1: {
      "day": "Monday",
      "id": 1,
    },
    2: {
      "day": "Tuesday",
      "id": 2,
    },
    3: {
      "day": "Wednesday",
      "id": 3,
    },
    4: {
      "day": "Thursday",
      "id": 4,
    },
    5: {
      "day": "Friday",
      "id": 5,
    },
    6: {
      "day": "Saturday",
      "id": 6,
    },
    7: {
      "day": "Sunday",
      "id": 7,
    },
  };
  List selectedDays = [];
  List<Time> timings = [];
  List types = [
    "Weekdays",
    "Periodic",
  ];
  String type = "weekdays";

  TextEditingController medicineNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void toggleWeekday(int day) {
    if (containsWeekday(day)) {
      selectedDays.remove(weekDays[day]);
    } else {
      selectedDays.add(weekDays[day]);
    }
    update();
  }

  bool containsWeekday(int day) {
    return selectedDays.contains(weekDays[day]);
  }

  void addTiming() {
    Navigator.of(Get.context!).push(
      showPicker(
        context: Get.context!,
        value: Time(
          hour: DateTime.now().hour,
          minute: DateTime.now().second,
        ),
        sunrise: TimeOfDay(hour: 6, minute: 0), // optional
        sunset: TimeOfDay(hour: 18, minute: 0), // optional
        duskSpanInMinutes: 120, // optional
        onChange: (newTime) {
          timings.add(newTime);

          update();
          // Navigator.pop(Get.context!);
        },
      ),
    );
  }

  void getDates() async {
    // print("object");
    int days = endDate.difference(startDate).inDays;
    // print(days);
    for (int day = 0; day <= days; day++) {
      DateTime date = startDate.add(Duration(days: day));

      if (selectedDays.contains(weekDays[date.weekday])) {
        for (Time time in timings) {
          date =
              DateTime(date.year, date.month, date.day, time.hour, time.minute);
          if (date.isAfter(DateTime.now())) {
            setReminder(date);
          }
        }
      }
    }
    List localTime = [];
    for (Time time in timings) {
      DateTime now = DateTime.now();
      localTime
          .add(DateTime(now.year, now.month, now.day, time.hour, time.minute));
    }

    await DatabaseHelper.createMedication(data: {
      "startDate": startDate,
      "endDate": endDate,
      "timings": localTime,
      "name": medicineNameController.text,
      "description": descriptionController.text,
      "id":
          startDate.year * 10000 + startDate.month * 1000 + startDate.day * 100,
    });
    Get.offAndToNamed(Routes.MEDICINE_REMINDER);
  }

  void setReminder(DateTime date) async {
    tz.initializeTimeZones();

    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    await flutterLocalNotificationsPlugin.zonedSchedule(
        date.year * 10000 +
            date.month * 1000 +
            date.day * 100 +
            date.hour * 10 +
            date.minute,
        medicineNameController.text,
        descriptionController.text,
        tz.TZDateTime.fromMillisecondsSinceEpoch(
            tz.local, date.millisecondsSinceEpoch),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'medguard_medication',
          'Medication Reminder',
          channelDescription: 'Get reminders for taking medications',
          priority: Priority.high,
          enableVibration: true,
          importance: Importance.high,
          visibility: NotificationVisibility.public,
          playSound: true,
        )),
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
