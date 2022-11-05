class User {
  int? id;
  String? name;
  String? contact;
  String? email;
  String? department;
  String? rollnumber;
  String? interest;
  String? description;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['contact'] = contact!;
    mapping['email'] = email!;
    mapping['department'] = department!;
    mapping['rollnumber'] = rollnumber!;
    mapping['interest'] = interest!;
    mapping['description'] = description!;
    return mapping;
  }
}
