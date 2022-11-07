// ignore_for_file: file_names, prefer_collection_literals

class ActivityList {
  int? gpsRetryAttempts;
  bool? hasMoreData;
  bool? remoteAttendanceAllowed;
  int? status;
  String? statusText;
  List<VisitLogList>? visitLogList;

  ActivityList(
      {this.gpsRetryAttempts,
      this.hasMoreData,
      this.remoteAttendanceAllowed,
      this.status,
      this.statusText,
      this.visitLogList});

  ActivityList.fromJson(Map<String, dynamic> json) {
    gpsRetryAttempts = json['gpsRetryAttempts'];
    hasMoreData = json['hasMoreData'];
    remoteAttendanceAllowed = json['remoteAttendanceAllowed'];
    status = json['status'];
    statusText = json['statusText'];
    if (json['visitLogList'] != null) {
      visitLogList = <VisitLogList>[];
      json['visitLogList'].forEach((v) {
        visitLogList!.add(VisitLogList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gpsRetryAttempts'] = gpsRetryAttempts;
    data['hasMoreData'] = hasMoreData;
    data['remoteAttendanceAllowed'] = remoteAttendanceAllowed;
    data['status'] = status;
    data['statusText'] = statusText;
    if (visitLogList != null) {
      data['visitLogList'] = visitLogList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisitLogList {
  ApplicationType? applicationType;
  String? checkInDate;
  String? checkOutDate;
  String? comment;
  EmployeeProfileByAssignedById? employeeProfileByAssignedById;
  EmployeeProfileByAssignedToId? employeeProfileByAssignedToId;
  num? gpserrorIn;
  num? gpserrorOut;
  num? gpsspeedIn;
  num? gpsspeedOut;
  num? id;
  bool? isActive;
  bool? isBlocked;
  double? latitudeIn;
  double? latitudeOut;
  double? longitudeIn;
  double? longitudeOut;
  SystemType? systemType;

  VisitLogList(
      {applicationType,
      checkInDate,
      checkOutDate,
      comment,
      employeeProfileByAssignedById,
      employeeProfileByAssignedToId,
      gpserrorIn,
      gpserrorOut,
      gpsspeedIn,
      gpsspeedOut,
      id,
      isActive,
      isBlocked,
      latitudeIn,
      latitudeOut,
      longitudeIn,
      longitudeOut,
      systemType});

  VisitLogList.fromJson(Map<String, dynamic> json) {
    applicationType = json['applicationType'] != null
        ? ApplicationType.fromJson(json['applicationType'])
        : null;
    checkInDate = json['checkInDate'];
    checkOutDate = json['checkOutDate'];
    comment = json['comment'];
    employeeProfileByAssignedById =
        json['employeeProfileByAssignedById'] != null
            ? EmployeeProfileByAssignedById.fromJson(
                json['employeeProfileByAssignedById'])
            : null;
    employeeProfileByAssignedToId =
        json['employeeProfileByAssignedToId'] != null
            ? EmployeeProfileByAssignedToId.fromJson(
                json['employeeProfileByAssignedToId'])
            : null;
    gpserrorIn = json['gpserrorIn'];
    gpserrorOut = json['gpserrorOut'];
    gpsspeedIn = json['gpsspeedIn'];
    gpsspeedOut = json['gpsspeedOut'];
    id = json['id'];
    isActive = json['isActive'];
    isBlocked = json['isBlocked'];
    latitudeIn = json['latitudeIn'];
    latitudeOut = json['latitudeOut'];
    longitudeIn = json['longitudeIn'];
    longitudeOut = json['longitudeOut'];
    systemType = json['systemType'] != null
        ? SystemType.fromJson(json['systemType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (applicationType != null) {
      data['applicationType'] = applicationType!.toJson();
    }
    data['checkInDate'] = checkInDate;
    data['checkOutDate'] = checkOutDate;
    data['comment'] = comment;
    if (employeeProfileByAssignedById != null) {
      data['employeeProfileByAssignedById'] =
          employeeProfileByAssignedById!.toJson();
    }
    if (employeeProfileByAssignedToId != null) {
      data['employeeProfileByAssignedToId'] =
          employeeProfileByAssignedToId!.toJson();
    }
    data['gpserrorIn'] = gpserrorIn;
    data['gpserrorOut'] = gpserrorOut;
    data['gpsspeedIn'] = gpsspeedIn;
    data['gpsspeedOut'] = gpsspeedOut;
    data['id'] = id;
    data['isActive'] = isActive;
    data['isBlocked'] = isBlocked;
    data['latitudeIn'] = latitudeIn;
    data['latitudeOut'] = latitudeOut;
    data['longitudeIn'] = longitudeIn;
    data['longitudeOut'] = longitudeOut;
    if (systemType != null) {
      data['systemType'] = systemType!.toJson();
    }
    return data;
  }
}

class ApplicationType {
  int? id;
  String? name;

  ApplicationType({id, name});

  ApplicationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class EmployeeProfileByAssignedById {
  String? firstName;
  int? id;
  String? lastName;
  String? middleName;

  EmployeeProfileByAssignedById({firstName, id, lastName, middleName});

  EmployeeProfileByAssignedById.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
    middleName = json['middleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['id'] = id;
    data['lastName'] = lastName;
    data['middleName'] = middleName;
    return data;
  }
}

class EmployeeProfileByAssignedToId {
  String? firstName;
  String? lastName;

  EmployeeProfileByAssignedToId({firstName, lastName});

  EmployeeProfileByAssignedToId.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}

class SystemType {
  int? id;
  bool? isBlocked;
  String? name;

  SystemType({id, isBlocked, name});

  SystemType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isBlocked = json['isBlocked'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['isBlocked'] = isBlocked;
    data['name'] = name;
    return data;
  }
}
