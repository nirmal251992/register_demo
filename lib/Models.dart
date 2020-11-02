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
class Political {
  int id;
  String name;

  Political(this.id, this.name);
  static List<Political> getCompanies() {
    return <Political>[

      Political(1, 'BJP'),
      Political(2, 'INC'),
      Political(3, 'AAP'),
      Political(4, 'BSP'),
    ];
  }
}
class Education {
  int id;
  String name;

  Education(this.id, this.name);
  static List<Education> getCompanies() {
    return <Education>[

      Education(1, 'BE'),
      Education(2, 'ME'),
      Education(3, 'MCA'),
      Education(4, 'BCA'),
    ];
  }
}
class Income {
  int id;
  String slot;

  Income(this.id, this.slot);
  static List<Income> getCompanies() {
    return <Income>[

      Income(1, '<1000'),
      Income(2, '<5000'),
      Income(3, '<10000'),

    ];
  }
}