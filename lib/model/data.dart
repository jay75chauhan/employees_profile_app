class Item {
  String employeeName;
  String department;
  String designation;
  String contactNo;
  String joiningDate;
  String reportingManager;
  String id;

  Item(
      {this.employeeName,
      this.department,
      this.designation,
      this.contactNo,
      this.joiningDate,
      this.reportingManager,
      this.id});

  Item.fromJson(Map json) {
    employeeName = json['employeeName'];
    department = json['department'];
    designation = json['designation'];
    contactNo = json['contactNo'];
    joiningDate = json['joiningDate'];
    reportingManager = json['reportingManager'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'employeeName': employeeName,
      'department': department,
      'designation': designation,
      'contactNo': contactNo,
      'joiningDate': joiningDate,
      'reportingManager': reportingManager,
      'id': id
    };
  }
}
