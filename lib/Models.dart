class Gender {
  int id;
  String gender;

  Gender(this.id, this.gender);
  static List<Gender> getCompanies() {
    return <Gender>[

      Gender(1, 'Male'),
      Gender(2, 'Female'),

    ];
  }
}
class FirstVoter {
  int id;
  String type;

  FirstVoter(this.id, this.type);
  static List<FirstVoter> getCompanies() {
    return <FirstVoter>[

      FirstVoter(1, 'Yes'),
      FirstVoter(2, 'No'),

    ];
  }
}