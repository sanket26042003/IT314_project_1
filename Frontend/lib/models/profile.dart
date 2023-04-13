class MyProfile {
  static final profiles = [
    Item(
        EmployeeID: "202001008",
        EmployeeName: "Sanket Doshi",
        Email: "sanketdoshi1234567@gmail.com",
        Gender: "Male",
        Address: "XYZ",
        PhoneNo: "6353315349",
        Department: "1",
        Manager: "Saurabh Tiwari",
        DateOfJoining: "2020",
        Post: "Group Representative",
        roll: "Software Engineer",
        currentProject: "IT314",
        image:
            "https://media.licdn.com/dms/image/C4D03AQHeGQues54a7A/profile-displayphoto-shrink_800_800/0/1660370113184?e=1686787200&v=beta&t=b3X8aB9Tb5fLkPr-sRahd4l2AEKAFZAYBJpgTaQLVW8")
  ];
}

class Item {
  final String EmployeeID;
  final String EmployeeName;
  final String Email;
  final String Gender;
  final String Address;
  final String PhoneNo;
  final String Department;
  final String Manager;
  final String DateOfJoining;
  final String Post;
  final String roll;
  final String currentProject;
  final String image;

  Item(
      {required this.EmployeeID,
      required this.EmployeeName,
      required this.Email,
      required this.Gender,
      required this.Address,
      required this.PhoneNo,
      required this.Department,
      required this.Manager,
      required this.DateOfJoining,
      required this.Post,
      required this.roll,
      required this.currentProject,
      required this.image});
}
