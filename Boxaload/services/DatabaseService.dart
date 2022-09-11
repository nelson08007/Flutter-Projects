import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String? uid;

  DatabaseService({ this.uid });

  final CollectionReference person = FirebaseFirestore.instance.collection("users");

  final CollectionReference campaign = FirebaseFirestore.instance.collection("campaign");

  final CollectionReference markers = FirebaseFirestore.instance.collection("markers");

  Future delad( ) async {
    return await person.doc(uid).update({
      'campaign' : 'no'
    });
  }

  Future delrider( ) async {
    return await person.doc(uid).update({
      'campaign id' : 'no',
      'verifypic' : 'no',
      'upload' : 'no',
      '1time' : 'no',
      'pic1' : 'no',
      'distance' : FieldValue.arrayUnion([0]),
      "km": 0,
    });
  }

  Future del(String id ) async {
    return await markers.doc(id).delete();
  }

  Future addkm(num d ) async {
    return await person.doc(uid).update(
        {
          "km": d
        }
    );
  }

  Future adddistance(var d ) async {
    return await person.doc(uid).update(
        {
         'distance' : FieldValue.arrayUnion([d])
        }
    );
  }

  Future startmarker(String name , String? campaign) async {
    return await markers.doc(uid).set(
      {
        'name' : name,
        'id': uid,
        'coords': GeoPoint(59.3293,18.0686),
        'campaign id': campaign,
        'polyline' : FieldValue.arrayUnion([GeoPoint(59.3293,18.0686)]),
      }
    );
  }

  Future updatemarker(double? lat , double? lng ) async {
    return await markers.doc(uid).update(
        {
          'coords': GeoPoint(lat ?? 59.3293,lng ?? 18.0686),
          'polyline' : FieldValue.arrayUnion([GeoPoint(lat ?? 59.3293,lng ?? 18.0686)]),
        }
    );
  }

  Future addpurchase(int purchase) async {
   return await person.doc(uid).update(
       {
         'purchase': purchase
       }
   );

 }

  Future picverify() async {
    return await person.doc(uid).update(
        {
          'verifypic' : 'yes'
        }
    );
  }

  Future riderupload(String url) async {
   return await person.doc(uid).update(
       {
         'pic1': url
       }
   );
 }

  Future riderregistered() async {
    return await person.doc(uid).update(
      {
        '1time' : 'yes'
      }
    );
  }

  Future<void> allowupload () async {
    return await person.doc(uid).update(
      {
        'upload' : 'yes',
      }
    );
  }

  Future<void> startrider (int rider ,  String id) async {
    return await campaign.doc(uid).update(
        {
          "no of riders" : rider,
          'campaign id' : uid,
          'rider': {
            id : {
              'uid' : id,
              'status' : 'joined',
              'post' : 'no',
              'lat' : 'no',
              'long' : 'no',
              'distance' : 'no',

            }
          }

        }
    );
  }

  Future<void> startrider1 (String id) async{
    return await person.doc(uid).update(
        {
          'campaign id' : id,
        }
    );
  }

  Future<void> startcampaign (String id) async {
    return await campaign.doc(uid).set(
      {
        "no of riders" : 0,
        'uid': id,
        'title': 'no',
        'description' : 'no',
        'city':'no',
        'cyclist': '0',
        'weeks': '0',
        'file1': 'no',
        'file2': 'no',
        'file3': 'no',
        'file4': 'no',
        'file5': 'no',
        'status': 'pending',
        'set':'no',
        'campaign' : 'no',
        'rider status' : 'not joined yet',
      }
      );


  }

  Future<void> acceptcampaign () async {

    return await campaign.doc(uid).update(

      {
        'status': 'payment verified'
      }

    );
  }

  Future<void> requestcampaign1 () async {
    return await person.doc(uid).update(
      {
        'campaign' : 'yes',
      }
    );
  }

  Future<void> requestcampaign (
      String title,
      String description,
      String city,
      String cyclist,
      String weeks,
      String file1,
      String file2,
      String file3,
      String file4,
      String file5,
      ) async {
    return await campaign.doc(uid).update(
        {
          'title': title,
          'description' : description,
          'city':city,
          'cyclist': cyclist,
          'weeks': weeks,
          'file1': file1,
          'file2': file2,
          'file3': file3,
          'file4': file4,
          'file5': file5,
          'set':'yes',
          'campaign' : 'yes',
        }
    );
  }

  Future<void> getuserData (
// for riders
      String? title,
      String? firstname,
      String? lastname,
      String? region,
      String? dob,
      String? phone,
      String? street,
      String? zipcode,
      String? city,
      String? iban,
      String? bank,
      String? beneficiary,
      String verify,
      ) async {
    return await person.doc(uid).update(
        {
          'title': title,
          'first name': firstname,
          'last name': lastname,
          'region': region,
          'date of birth':dob,
          'phone number':phone,
          'street':street,
          'zipcode':zipcode,
          'city':city,
          'IBAN number':iban,
          'bank name': bank,
          'beneficiary name':beneficiary,
          'verify':verify,
          'distance' : FieldValue.arrayUnion([0]),
          // "distance" : [
          //   {
          //     "0" : 0
          //   }
          // ],
          "km": 0,
        }
    );
  }


  Future<void> getuserData2(
      // for advertiser
      String? firstname,
      String? lastname,
      String? company,
      String? phone,
      String? address ,
      String? city ,
      String? zipcode ,
      String verify) async {
    return await person.doc(uid).update(
        {
          'first name': firstname,
          'last name' :lastname,
          'company' : company,
          'phone number':phone,
          'address':address,
          'city': city,
          'zipcode': zipcode,
          'verify': verify,

        }
    );
  }

  Future<void> getuserData1 (
    // for signup
      String role,
      String verify,
      String title,
      String firstname,
      String lastname,
      String region,
      String dob,
      String phone,
      String street,
      String zipcode,
      String city,
      String iban,
      String bank,
      String beneficiary,
      String address,
      String company,
      String email,
      ) async {
    return await person.doc(uid).set(
        {
          'role': role,
          'verify':verify,
          'title': title,
          'first name': firstname,
          'last name': lastname,
          'region':region,
          'date of birth':dob,
          'phone number':phone,
          'street':street,
          'zipcode':zipcode,
          'city':city,
          'IBAN number':iban,
          'bank name': bank,
          'beneficiary name':beneficiary,
          'address':address,
          'company':company,
          'campaign' : 'no',
          'email': email,
          'campaign id' : 'no',
          'upload' : 'no',
          'uid' : uid,
          '1time' : 'no',
          'pic1': 'no',
          'verifypic' : 'no',
          'purchase': 0,
        }
    );
  }
}