import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookAppointmentController extends GetxController {
  var selectedDate = 'Not selected'.obs;
  var selectedTime = 'Not selected'.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      selectedDate.value = picked.toString().split(' ')[0];
    }
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      selectedTime.value = picked.format(context);
    }
  }

  void confirmAppointment() async {
    if (selectedDate.value != 'Not selected' &&
        selectedTime.value != 'Not selected') {
      try {
        // Get current user
        User? user = _auth.currentUser;
        if (user == null) {
          Get.snackbar('Error', 'User not logged in');
          return;
        }

        // Create appointment request
        Map<String, dynamic> appointmentRequest = {
          'patientEmail': user.email,
          'date': selectedDate.value,
          'time': selectedTime.value,
          'status': 'pending',
          'createdAt': FieldValue.serverTimestamp(),
        };

        // Add request to Firestore
        await _firestore
            .collection('doctors')
            .doc('doctorId')
            .collection('requests')
            .add(appointmentRequest);

        Get.dialog(
          AlertDialog(
            title: Text('Appointment Requested'),
            content: Text(
                'Your request has been sent to the doctor. You will be notified once it\'s accepted.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Get.back(); // Close dialog
                  Get.back(); // Go back to previous screen
                },
              ),
            ],
          ),
        );

        // Start listening for status changes
        listenForStatusChanges(user.email!);
      } catch (e) {
        Get.snackbar('Error', 'Failed to send appointment request: $e');
      }
    } else {
      Get.snackbar('Error', 'Please select both date and time');
    }
  }

  void listenForStatusChanges(String patientEmail) {
    _firestore
        .collection('doctors')
        .doc('doctorId')
        .collection('requests')
        .where('patientEmail', isEqualTo: patientEmail)
        .where('status', isEqualTo: 'accepted')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        // Appointment accepted
        Get.snackbar(
          'Appointment Accepted',
          'Your appointment has been accepted by the doctor!',
          duration: Duration(seconds: 5),
        );
        // Here you can add code to send an email notification
        // or implement push notifications
      }
    });
  }
}
