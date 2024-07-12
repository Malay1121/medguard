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

  void setReminders() async {
    tz.initializeTimeZones();

    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        medicineNameController.text,
        descriptionController.text,
        tz.TZDateTime.fromMillisecondsSinceEpoch(
                tz.local, startDate.millisecondsSinceEpoch)
            .add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
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
