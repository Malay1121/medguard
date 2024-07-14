import '../helper/all_imports.dart';

class CommonController extends GetxController {
  // Future<void> checkInternetConnection() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.none) {
  //     // Display a "No Internet Connection" message
  //     showDialog(
  //       context: Get.context!,
  //       builder: (context) => AlertDialog(
  //         title: Text('No Internet Connection'),
  //         content: Text('Please check your internet connection and try again.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     // Perform the network request
  //     // ...
  //   }
  // }

  @override
  void onInit() {
    // print('loll');
    // checkInternetConnection();

    super.onInit();
  }
}
