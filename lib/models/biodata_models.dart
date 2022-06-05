import 'dart:ui';

Color mainColor = const Color(0xff14272E);
Color whiteColor = const Color(0xffffffff);

class BioData {
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final int age;
  final String phoneNumber;
  final String emailId;
  final String city;
  final String state;
  final String country;
  final int postCode;

  BioData({
    required this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.age,
    required this.phoneNumber,
    required this.emailId,
    required this.country,
    required this.city,
    required this.state,
    required this.postCode,
  });

  factory BioData.fromJson(Map<String, dynamic> json) {
    return BioData(
      profilePicture: json["results"][0]["picture"]["large"],
      firstName: json["results"][0]["name"]["first"],
      lastName: json["results"][0]["name"]["last"],
      gender: json["results"][0]["gender"],
      dob: json["results"][0]["dob"]["date"],
      age: json["results"][0]["dob"]["age"],
      phoneNumber: json["results"][0]["phone"],
      emailId: json["results"][0]["email"],
      country: json["results"][0]["location"]["country"],
      city: json["results"][0]["location"]["city"],
      state: json["results"][0]["location"]["state"],
      postCode: json["results"][0]["location"]["postcode"],
    );
  }
}
