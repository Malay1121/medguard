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
  static String systemPrompt =
      "The prompt will contain a json input which will contain details about the user. It will have their age, weight, height, gender, and more(It is possible that it might not contain and be null). And there will be a list of symptoms that the user has. You have to scan those details and return what diseases the user might have or can have in future. It should also give percentage(chances 0-1) and how likely(chances 0-1) the user should show to a doctor. It should also include disease description where user can see what disease they have. JSON should also contain how to cure/prevent the disease. Don't include anything else except JSON in the output.  Also make sure that the application is used by elder people so generate the output accordingly. JUST WANT THE JSON OUPTUT. NOTHING ELSE. input structure: { 'age': 60,                        'weight': 80,                        'height': 150,                        'gender': 'male',                        'symptoms': [                            {                                'ID': 188,                                'name': 'Disease 1'                            },                            {                                'ID': 10,                                'name': 'Disease 2'                            },                            {                                'ID': 223,                                'name': 'Disease 3'                            },                            {                                'ID': 984,                                'name': 'Disease 4'                            },                            {                                'ID': 974,                                'name': 'Disease 5'                            }                        ]                    }                      output structure: {                        'diseases': [                            {                                'name': 'Diseases name',                                'description': 'About the disease',                                'what_to_do': 'What can be done to prevent/cure it',                                'chance': 0.2342,                                'show_doctor': 0.43                            }                        ]                    }";
  static String systemPromptPost =
      '''Working on an Elderly healthcare application. I need some good random tips to show on homepage. It can include a good diet meal's recipe, how to stay safe online, best exercises, etc (Do not just stick to the topics I gave, anything works that is going to help elderly people) any thing that can help elderly people. 

Choose a random topic and write a post about it in HTML

If the user's prompt also contains symptoms, diseases. age, weight, etc 50% of the time try to generate a post which relates to their data and try to keep the post personalized. If it is null, then you can generate random posts.
Symptoms will look like this: {'symptoms':[{
    'ID': 1,
    'name': 'Symptom 1'
  },{
    'ID': 4,
    'Name': 'Symptom 2'
  },]}

Disease will also look similar.


JUST GIVE ME THE HTML OUTPUT. NOTHING ELSE

HTML format for recipe but have to change it to Inline CSS (Even for other topic. keep it something similar. Keep the style same. And layout veryyyyyy similar) (CONVERT IT TO INLINE CSS) (Don't add <title> tag in head):
<!DOCTYPE html>
<head>
 <style>
 body {
  font-family: 'Helvetica Neue', Arial, sans-serif;
  margin: 10px;
  background-color: #FFFFF;
  color: #333;
 }
 h1 {
  color: #1C2A3A;
  font-size: 22px;
  text-align: center;
  margin-bottom: 10px;
 }
 h2 {
  color: #1C2A3A;
  font-size: 18px;
  margin-bottom: 10px;
 }
 p {
  line-height: 1.5;
  font-size: 14px;
  margin-bottom: 10px;
  color: #6B7280
 }
 li {
  line-height: 1.5;
  font-size: 14px;
  margin-bottom: 10px;
  color: #6B7280
 }
 .recipe {
  padding: 15px;
  border-radius: 5px;
  background-color: #F9FAFB;
 }
 .recipe h3 {
  color: #1F2A37;
  font-size: 16px;
  margin-bottom: 5px;
 }
 .recipe ul, .recipe ol {
  margin: 10px 0;
  padding-left: 20px;
  font-size: 14px;
 }
 .recipe li, .recipe ol li {
  margin-bottom: 5px;
 }
 </style>
</head>
<body>
 <h3>title</h3><p>description</p><div class="recipe">
 <h2>Quinoa Salad with Vegetables</h2>
 <h3>Ingredients:</h3>
 <ul>
  <li>1 cup quinoa</li>
  <li>2 cups water</li>
  <li>1 cup cherry tomatoes, halved</li>
  <li>1 cucumber, diced</li>
  <li>1 red bell pepper, diced</li>
  <li>1/4 cup red onion, finely chopped</li>
  <li>1/4 cup fresh parsley, chopped</li>
  <li>1/4 cup olive oil</li>
  <li>2 tbsp lemon juice</li>
  <li>Salt and pepper to taste</li>
 </ul>
 <h3>Instructions:</h3>
 <ol>
  <li>Rinse the quinoa under cold water.</li>
  <li>In a saucepan, bring water to a boil. Add quinoa, reduce heat, cover, and simmer for 15 minutes or until tender.</li>
  <li>Let quinoa cool. Combine with tomatoes, cucumber, bell pepper, onion, and parsley.</li>
  <li>Whisk olive oil, lemon juice, salt, and pepper. Pour over salad and toss.</li>
  <li>Serve immediately or refrigerate for up to 2 days.</li>
 </ol>
 <p>Enjoy this nutritious quinoa salad, perfect for a balanced diet and energy boost!</p>
 </div>
</body>
</html>


After generating: Convert the code to Inline CSS''';
  static String emailValidation = "Please enter a valid email";
  static String nameValidation = "Please enter a valid name";
  static String passwordValidation = "Please enter a valid password";
  static String passwordErrorMessage =
      "Minimum 8 characters, at least 1 lower case, at least 1 upper case, at least 1 digit";

  static String needHelp = "Need Help?";
  static String activateSOS = "Do you want to call the emergency service?";
  static String getHelp = "Get Help!";
  static String close = "Close";
  static String confirm = "Confirm";

  static String selectSymptoms = "Select Symptoms";
  static String diseasesResult = "Diseases Result";
  static String addMedication = "Add Medication";
  static String medicationReminder = "Medication Reminder";
  static String today = "Today";
  static String all = "All";
  static String weAreHereToRemindYou = "We are here to remind you!";

  static String next = "Next";
  static String skip = "Skip";
  static String symptomTracker = 'Symptom Tracker';
  static String editSymptoms = 'Edit Symptoms';
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

  static String options = "Options";
  static String seeAll = "See All";
  static String symptoms = "Symptoms";
  static String medicineReminder = "Medicine Reminder";
  static String doctorAppointmentReminder = "Doctor Appointment Reminder";

  static String medicineName = 'Medicine Name';
  static String description = 'Description';
  static String startDate = 'Start Date';
  static String endDate = 'End Date';
  static String whichDays = 'Which Days?';
  static String whatTime = 'What Time?';
  static String addTime = 'Add Time';
  static String chances = 'Chances are ';
  static String showDoctor = 'Show doctor ';
}
