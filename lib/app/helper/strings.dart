String imagesDirectory = 'assets/images/';
String iconsDirectory = 'assets/icons/';
String svgsDirectory = 'assets/svgs/';

class AppImages {
  static String onboard1 = '${imagesDirectory}onboard1.png';
  static String onboard2 = '${imagesDirectory}onboard2.png';
  static String onboard3 = '${imagesDirectory}onboard3.png';
  static String logo = '${imagesDirectory}logo.png';
  static String appointmentReminderTab =
      '${imagesDirectory}appointment_reminder_tab.png';
  static String medicationReminderTab =
      '${imagesDirectory}medication_reminder_tab.png';
  static String symptomsTab = '${imagesDirectory}symptoms_tab.png';
}

class AppIcons {
  static String user = '${svgsDirectory}user.svg';
  static String email = '${svgsDirectory}email.svg';
  static String lock = '${svgsDirectory}lock.svg';
  static String appointmentReminder =
      '${svgsDirectory}appointment_reminder.svg';
  static String medicationReminder = '${svgsDirectory}medication_reminder.svg';
  static String symptoms = '${svgsDirectory}symptoms.svg';
}

class AppStrings {
  static String emailValidation = "Please enter a valid email";
  static String nameValidation = "Please enter a valid name";
  static String passwordValidation = "Please enter a valid password";
  static String passwordErrorMessage =
      "Minimum 8 characters, at least 1 lower case, at least 1 upper case, at least 1 digit";

  static String next = "Next";
  static String skip = "Skip";
  static String symptomTracker = 'Symptom Tracker';
  static String symptomTrackerDesc =
      'Allows users to log daily symptoms and monitor changes over time.';
  static String appointmentReminders = 'Appointment Reminders';
  static String appointmentRemindersDesc =
      "Users can set reminders for upcoming doctor's appointments, medication schedules, and other health-related tasks.";
  static String healthTips = 'Health Tips and Resources';
  static String healthTipsDesc =
      "Offers personalized health tips and advice based on user's identified risks";

  static String createAccount = 'Create Account';
  static String weAreHereToHelpYou = 'We are here to help you!';
  static String yourName = 'Your Name';
  static String yourEmail = 'Your Email';
  static String password = 'Password';
  static String or = 'or';
  static String doYouHaveAnAccount = 'Do you have an account ?';
  static String signIn = 'Sign In';
  static String hiWelcomeBack = 'Hi, Welcome Back! ';
  static String dontHaveAnAccountYet = 'Don’t have an account yet?';
  static String signUp = 'Sign up';
  static String hopeYoureDoingFine = 'Hope you’re doing fine.';

  static String categories = "Categories";
  static String seeAll = "See All";
  static String symptoms = "Symptoms";
  static String medicineReminder = "Medicine Reminder";
  static String doctorAppointmentReminder = "Doctor Appointment Reminder";
}
