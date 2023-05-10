import 'package:firebase_database/firebase_database.dart';

class FirebaseDbFunctions {
  FirebaseDatabase database = FirebaseDatabase.instance;
  Future<void> turnOnOffCradle(bool isOn) async {
    DatabaseReference ref = database.ref('/smartCradle');
    
    ref.update({"onOff": isOn});
  }
}
