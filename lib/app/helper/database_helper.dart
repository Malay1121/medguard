import 'package:medguard/app/helper/all_imports.dart';
import 'package:medguard/app/helper/utils.dart';

class DatabaseHelper {
  static Future getApis() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("api_key")
          .doc("api_key")
          .get();
      apiKeys = documentSnapshot.data() as Map;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future createUser({required Map<String, dynamic> data}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: data["email"], password: generateMd5(data["password"]));
      data.addEntries({"uid": user.user!.uid}.entries);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(data["uid"])
          .set(data);
      writeUserDetails(data);
      return user.user;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future? loginUser({required Map<String, dynamic> data}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: data["email"], password: generateMd5(data["password"]));
      Map<String, dynamic>? userData = (await FirebaseFirestore.instance
              .collection("users")
              .doc(user.user!.uid)
              .get())
          .data();
      if (userData != null) writeUserDetails(userData);
      return user;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future editUser(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .update(data);
      editUserDetails(data);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future createMedication(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("medications")
          .doc(data["id"].toString())
          .set(data);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future<List> getMedications({String? uid}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(uid)
              .collection("medications")
              .get();
      List docs = [];
      for (var doc in querySnapshot.docs) {
        docs.add(doc.data());
      }
      return docs;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
    return [];
  }

  static Future editMedication(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("medications")
          .doc(data["id"])
          .update(data);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future deleteMedication(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("medications")
          .doc(data["id"])
          .delete();
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future<bool> diseaseExists({
    String? uid,
  }) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("disease")
          .doc("disease")
          .get();
      return documentSnapshot.exists;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
    return false;
  }

  static Future createDisease(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("disease")
          .doc("disease")
          .set(data);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future updateDisease(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("disease")
          .doc("disease")
          .update(data);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future<Map> getDisease({
    String? uid,
  }) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("disease")
          .doc("disease")
          .get();
      return documentSnapshot.data() as Map;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
    return {};
  }

  static Future<Map<String, dynamic>> getSymptoms({
    String? uid,
  }) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("symptoms")
          .doc("symptoms")
          .get();
      return documentSnapshot.data() as Map<String, dynamic>;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
    return {};
  }

  static Future updateSymptoms(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("symptoms")
          .doc("symptoms")
          .update(data);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future createSymptoms(
      {String? uid, required Map<String, dynamic> data}) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("symptoms")
          .doc("symptoms")
          .set(data);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future<bool> symptomsExists({
    String? uid,
  }) async {
    try {
      uid = uid ?? getStorage.read("userDetails")["uid"];
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("symptoms")
          .doc("symptoms")
          .get();
      return documentSnapshot.exists;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
    return false;
  }
}
