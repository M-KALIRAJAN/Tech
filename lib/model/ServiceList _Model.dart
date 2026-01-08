// import 'dart:convert';


// ServiceListModel serviceListFromJson(String str) =>
//     ServiceListModel.fromJson(json.decode(str));

// String serviceListToJson(ServiceListModel data) =>
//     json.encode(data.toJson());


// class ServiceListModel {
//   int count;
//   List<Datum> data;

//   ServiceListModel({
//     required this.count,
//     required this.data,
//   });

//   factory ServiceListModel.fromJson(Map<String, dynamic> json) =>
//       ServiceListModel(
//         count: json["count"],
//         data: List<Datum>.from(
//           json["data"].map((x) => Datum.fromJson(x)),
//         ),
//       );

//   Map<String, dynamic> toJson() => {
//         "count": count,
//         "data": data.map((x) => x.toJson()).toList(),
//       };
// }


// class Datum {
//   StatusTimestamps statusTimestamps;
//   String id;
//   UserId userId;
//   ServiceId serviceId;
//   IssuesId issuesId;
//   dynamic otherIssue;
//   String feedback;
//   DateTime scheduleService;
//   bool immediateAssistance;
//   String serviceStatus;
//   dynamic reason;
//   bool technicianAccepted;
//   int payment;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String serviceRequestId;
//   Address address;
//   String assignmentStatus;
//   dynamic assignmentReason;
    

//   Datum({
//     required this.statusTimestamps,
//     required this.id,
//     required this.userId,
//     required this.serviceId,
//     required this.issuesId,
//     required this.otherIssue,
//     required this.feedback,
//     required this.scheduleService,
//     required this.immediateAssistance,
//     required this.serviceStatus,
//     required this.reason,
//     required this.technicianAccepted,
//     required this.payment,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.serviceRequestId,
//     required this.address,
//     required this.assignmentStatus,
//     required this.assignmentReason,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         statusTimestamps:
//             StatusTimestamps.fromJson(json["statusTimestamps"]),
//         id: json["_id"],
//         userId: UserId.fromJson(json["userId"]),
//         serviceId: ServiceId.fromJson(json["serviceId"]),
//         issuesId: IssuesId.fromJson(json["issuesId"]),
//         otherIssue: json["otherIssue"],
//         feedback: json["feedback"],
//         scheduleService: DateTime.parse(json["scheduleService"]),
//         immediateAssistance: json["immediateAssistance"],
//         serviceStatus: json["serviceStatus"],
//         reason: json["reason"],
//         technicianAccepted: json["technicianAccepted"],
//         payment: json["payment"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         serviceRequestId: json["serviceRequestID"],
//         address: Address.fromJson(json["address"]),
//         assignmentStatus: json["assignmentStatus"],
      
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "feedback": feedback,
//         "serviceStatus": serviceStatus,
//         "payment": payment,
//       };
// }

// /// ===============================
// /// ADDRESS (CLEANED)
// /// ===============================
// class Address {
//   String id;
//   String userId;
//   String addressType;
//   String city;
//   String building;
//   String floor;
//   int aptNo;
//   String roadId;
//   String blockId;

//   Address({
//     required this.id,
//     required this.userId,
//     required this.addressType,
//     required this.city,
//     required this.building,
//     required this.floor,
//     required this.aptNo,
//     required this.roadId,
//     required this.blockId,
//   });

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         id: json["_id"],
//         userId: json["userId"],
//         addressType: json["addressType"],
//         city: json["city"],
//         building: json["building"],
//         floor: json["floor"],
//         aptNo: json["aptNo"],
//         roadId: json["roadId"],
//         blockId: json["blockId"],
//       );
// }

// /// ===============================
// /// ISSUES
// /// ===============================
// class IssuesId {
//   String id;
//   String serviceId;
//   String issue;
//   DateTime createdAt;
//   DateTime updatedAt;

//   IssuesId({
//     required this.id,
//     required this.serviceId,
//     required this.issue,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory IssuesId.fromJson(Map<String, dynamic> json) => IssuesId(
//         id: json["_id"],
//         serviceId: json["serviceId"],
//         issue: json["issue"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );
// }

// /// ===============================
// /// SERVICE INFO
// /// ===============================
// class ServiceId {
//   String id;
//   String name;
//   String serviceImage;
//   String serviceLogo;
//   DateTime createdAt;
//   DateTime updatedAt;

//   ServiceId({
//     required this.id,
//     required this.name,
//     required this.serviceImage,
//     required this.serviceLogo,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
//         id: json["_id"],
//         name: json["name"],
//         serviceImage: json["serviceImage"],
//         serviceLogo: json["serviceLogo"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );
// }

// /// ===============================
// /// STATUS TIMESTAMPS
// /// ===============================
// class StatusTimestamps {
//   DateTime submitted;
//   dynamic technicianAssigned;
//   dynamic inProgress;
//   dynamic paymentInProgress;
//   dynamic completed;
//   DateTime accepted;

//   StatusTimestamps({
//     required this.submitted,
//     required this.technicianAssigned,
//     required this.inProgress,
//     required this.paymentInProgress,
//     required this.completed,
//     required this.accepted,
//   });

//   factory StatusTimestamps.fromJson(Map<String, dynamic> json) =>
//       StatusTimestamps(
//         submitted: DateTime.parse(json["submitted"]),
//         technicianAssigned: json["technicianAssigned"],
//         inProgress: json["inProgress"],
//         paymentInProgress: json["paymentInProgress"],
//         completed: json["completed"],
//         accepted: DateTime.parse(json["accepted"]),
//       );
// }

// /// ===============================
// /// USER
// /// ===============================
// class UserId {
//   BasicInfo basicInfo;
//   String id;

//   UserId({
//     required this.basicInfo,
//     required this.id,
//   });

//   factory UserId.fromJson(Map<String, dynamic> json) => UserId(
//         basicInfo: BasicInfo.fromJson(json["basicInfo"]),
//         id: json["_id"],
//       );
// }

// /// ===============================
// /// BASIC INFO (NO PASSWORD ✅)
// /// ===============================
// class BasicInfo {
//   String fullName;
//   int mobileNumber;
//   String email;
//   String gender;

//   BasicInfo({
//     required this.fullName,
//     required this.mobileNumber,
//     required this.email,
//     required this.gender,
//   });

//   factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
//         fullName: json["fullName"],
//         mobileNumber: json["mobileNumber"],
//         email: json["email"],
//         gender: json["gender"],
//       );
// }


import 'dart:convert';

ServiceListModel serviceListFromJson(String str) =>
    ServiceListModel.fromJson(json.decode(str));

String serviceListToJson(ServiceListModel data) =>
    json.encode(data.toJson());

/// ===============================
/// SERVICE LIST MODEL
/// ===============================
class ServiceListModel {
  final int count;
  final List<Datum> data;

  ServiceListModel({
    required this.count,
    required this.data,
  });

  factory ServiceListModel.fromJson(Map<String, dynamic> json) {
    return ServiceListModel(
      count: json["count"] ?? 0,
      data: (json["data"] as List)
          .map((x) => Datum.fromJson(x))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

/// ===============================
/// DATUM (SERVICE REQUEST)
/// ===============================
class Datum {
  final StatusTimestamps statusTimestamps;
  final String id;
  final UserId userId;
  final ServiceId serviceId;
  final IssuesId issuesId;

  final String? otherIssue;
  final String? feedback;

  final DateTime scheduleService;
  final bool immediateAssistance;
  final String serviceStatus;

  final String? reason;
  final bool technicianAccepted;
  final int payment;

  final DateTime createdAt;
  final DateTime updatedAt;

  final String serviceRequestId;
  final Address address;

  final String assignmentStatus;
  final String? assignmentReason;

  Datum({
    required this.statusTimestamps,
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.issuesId,
    this.otherIssue,
    this.feedback,
    required this.scheduleService,
    required this.immediateAssistance,
    required this.serviceStatus,
    this.reason,
    required this.technicianAccepted,
    required this.payment,
    required this.createdAt,
    required this.updatedAt,
    required this.serviceRequestId,
    required this.address,
    required this.assignmentStatus,
    this.assignmentReason,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      statusTimestamps:
          StatusTimestamps.fromJson(json["statusTimestamps"] ?? {}),
      id: json["_id"] ?? "",
      userId: UserId.fromJson(json["userId"] ?? {}),
      serviceId: ServiceId.fromJson(json["serviceId"] ?? {}),
      issuesId: IssuesId.fromJson(json["issuesId"] ?? {}),

      otherIssue: json["otherIssue"],
      feedback: json["feedback"],

      scheduleService:
          DateTime.tryParse(json["scheduleService"] ?? "") ?? DateTime.now(),
      immediateAssistance: json["immediateAssistance"] ?? false,
      serviceStatus: json["serviceStatus"] ?? "",

      reason: json["reason"],
      technicianAccepted: json["technicianAccepted"] ?? false,
      payment: json["payment"] ?? 0,

      createdAt:
          DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime.now(),
      updatedAt:
          DateTime.tryParse(json["updatedAt"] ?? "") ?? DateTime.now(),

      serviceRequestId: json["serviceRequestID"] ?? "",
      address: Address.fromJson(json["address"] ?? {}),

      assignmentStatus: json["assignmentStatus"] ?? "",
      assignmentReason: json["assignmentReason"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceRequestID": serviceRequestId,
        "feedback": feedback,
        "serviceStatus": serviceStatus,
        "payment": payment,
      };
}

/// ===============================
/// ADDRESS
/// ===============================
class Address {
  final String id;
  final String userId;
  final String addressType;
  final String city;
  final String building;
  final String floor;
  final int aptNo;
  final String roadId;
  final String blockId;

  Address({
    required this.id,
    required this.userId,
    required this.addressType,
    required this.city,
    required this.building,
    required this.floor,
    required this.aptNo,
    required this.roadId,
    required this.blockId,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["_id"] ?? "",
      userId: json["userId"] ?? "",
      addressType: json["addressType"] ?? "",
      city: json["city"] ?? "",
      building: json["building"] ?? "",
      floor: json["floor"] ?? "",
      aptNo: json["aptNo"] ?? 0,
      roadId: json["roadId"] ?? "",
      blockId: json["blockId"] ?? "",
    );
  }
}

/// ===============================
/// ISSUES
/// ===============================
class IssuesId {
  final String id;
  final String serviceId;
  final String issue;
  final DateTime createdAt;
  final DateTime updatedAt;

  IssuesId({
    required this.id,
    required this.serviceId,
    required this.issue,
    required this.createdAt,
    required this.updatedAt,
  });

  factory IssuesId.fromJson(Map<String, dynamic> json) {
    return IssuesId(
      id: json["_id"] ?? "",
      serviceId: json["serviceId"] ?? "",
      issue: json["issue"] ?? "",
      createdAt:
          DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime.now(),
      updatedAt:
          DateTime.tryParse(json["updatedAt"] ?? "") ?? DateTime.now(),
    );
  }
}

/// ===============================
/// SERVICE INFO
/// ===============================
class ServiceId {
  final String id;
  final String name;
  final String serviceImage;
  final String serviceLogo;
  final DateTime createdAt;
  final DateTime updatedAt;

  ServiceId({
    required this.id,
    required this.name,
    required this.serviceImage,
    required this.serviceLogo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) {
    return ServiceId(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      serviceImage: json["serviceImage"] ?? "",
      serviceLogo: json["serviceLogo"] ?? "",
      createdAt:
          DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime.now(),
      updatedAt:
          DateTime.tryParse(json["updatedAt"] ?? "") ?? DateTime.now(),
    );
  }
}

/// ===============================
/// STATUS TIMESTAMPS
/// ===============================
class StatusTimestamps {
  final DateTime submitted;
  final DateTime? technicianAssigned;
  final DateTime? inProgress;
  final DateTime? paymentInProgress;
  final DateTime? completed;
  final DateTime? accepted;

  StatusTimestamps({
    required this.submitted,
    this.technicianAssigned,
    this.inProgress,
    this.paymentInProgress,
    this.completed,
    this.accepted,
  });

  factory StatusTimestamps.fromJson(Map<String, dynamic> json) {
    return StatusTimestamps(
      submitted:
          DateTime.tryParse(json["submitted"] ?? "") ?? DateTime.now(),
      technicianAssigned:
          DateTime.tryParse(json["technicianAssigned"] ?? ""),
      inProgress: DateTime.tryParse(json["inProgress"] ?? ""),
      paymentInProgress:
          DateTime.tryParse(json["paymentInProgress"] ?? ""),
      completed: DateTime.tryParse(json["completed"] ?? ""),
      accepted: DateTime.tryParse(json["accepted"] ?? ""),
    );
  }
}

/// ===============================
/// USER
/// ===============================
class UserId {
  final BasicInfo basicInfo;
  final String id;

  UserId({
    required this.basicInfo,
    required this.id,
  });

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      basicInfo: BasicInfo.fromJson(json["basicInfo"] ?? {}),
      id: json["_id"] ?? "",
    );
  }
}

/// ===============================
/// BASIC INFO
/// ===============================
class BasicInfo {
  final String fullName;
  final int mobileNumber;
  final String email;
  final String gender;

  BasicInfo({
    required this.fullName,
    required this.mobileNumber,
    required this.email,
    required this.gender,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) {
    return BasicInfo(
      fullName: json["fullName"] ?? "",
      mobileNumber: json["mobileNumber"] ?? 0,
      email: json["email"] ?? "",
      gender: json["gender"] ?? "",
    );
  }
}
