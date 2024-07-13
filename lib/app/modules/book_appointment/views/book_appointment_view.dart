import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_appointment_controller.dart';

class BookAppointmentView extends GetView<BookAppointmentController> {
  const BookAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => controller.selectDate(context),
              child: Text('Select Date'),
            ),
            SizedBox(height: 20),
            Obx(() => Text('Selected Date: ${controller.selectedDate}')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.selectTime(context),
              child: Text('Select Time'),
            ),
            SizedBox(height: 20),
            Obx(() => Text('Selected Time: ${controller.selectedTime}')),
            Spacer(),
            ElevatedButton(
              onPressed: controller.confirmAppointment,
              child: Text('Confirm Appointment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
