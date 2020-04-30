import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prefirebase/models/recapakdata.dart';
import 'package:prefirebase/models/user.dart';

class DataBaseServices {
  final CollectionReference collection =
      Firestore.instance.collection('recapak');

  final String uid;
  DataBaseServices({this.uid});

  Future updateUserData(List<String> userData) async {
    return await collection.document(uid).setData({
      'username': userData[0],
      'email': userData[1],
      'fullname': userData[2],
      'password': userData[3],
      'age': userData[4],
      'phone': userData[5],
      'about': userData[6],
      'facelink': userData[7],
      'photo': userData[8],
    });
  }

  //convert snapshot to list
  List<ReCapakUserData> _userListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ReCapakUserData(doc.data['title'] ?? '  ',
          doc.data['recap'] ?? '  ', doc.data['type'] ?? '  ');
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<ReCapakUserData>> get reCapakUserData {
    return collection.snapshots().map(_userListFromSnapShot);
  }

  Stream<UserInformation> get userData {
    return collection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserInformation _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserInformation(
      uid,
      snapshot.data['username'],
      snapshot.data['email'],
      snapshot.data['fullname'],
      snapshot.data['password'],
      snapshot.data['age'],
      snapshot.data['phone'],
      snapshot.data['about'],
      snapshot.data['facelink'],
      snapshot.data['photo'],
    );
  }
}
