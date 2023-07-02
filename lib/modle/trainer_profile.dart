class TrainerProfile{

  dynamic  uId;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic phoneNumber;
  dynamic descriptionJob;
  dynamic country;
  dynamic city;
  dynamic image;

  //TrainerProfile();
  TrainerProfile({
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.descriptionJob,
      this.country,
      this.city,
      this.image,});

  TrainerProfile.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    descriptionJob = json['descriptionJob'];
    country = json['country'];
    city = json['city'];
    image = json['image'];
    uId = json['uId'];

  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'descriptionJob': descriptionJob,
      'country': country,
      'city': city,
      'image': image,



    };
  }

}