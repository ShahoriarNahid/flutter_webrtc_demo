import 'package:json_annotation/json_annotation.dart';
part 'userList_model.g.dart';

@JsonSerializable()
class UserListModel {
  String? createdByUsername;
  String? createdByFullname;
  String? createdByEmail;
  String? createdByMobile;
  String? createdOn;
  String? createdAt;
  // Null? updatedByUsername;
  // Null? updatedByFullname;
  // Null? updatedByEmail;
  // Null? updatedByMobile;
  // Null? updatedOn;
  // Null? updatedAt;
  // Null? approvedByUsername;
  // Null? approvedByFullname;
  // Null? approvedByEmail;
  // Null? approvedByMobile;
  // Null? approvedOn;
  // Null? approvedAt;
  String? id;
  String? countryId;
  String? countryCode;
  String? countryName;
  String? agencyId;
  String? agencyCode;
  String? agencyName;
  String? unitId;
  String? unitCode;
  String? unitName;
  String? locationId;
  String? locationCode;
  String? locationName;
  String? address;
  String? userId;
  String? username;
  String? fullname;
  // Null? phone;
  String? mobile;
  String? email;
  String? gender;
  double? officeLatitude;
  double? officeLongitude;
  String? reportingManagerId;
  String? reportingManagerUsername;
  String? reportingManagerFullname;
  String? reportingManagerGender;
  String? reportingManagerEmail;
  String? reportingManagerMobile;
  String? reportingManagerRole;
  int? reportingManagerRoleLevel;
  String? reportingManagerRoleGroup;
  int? reportingManagerRoleGroupLevel;
  // Null? geographyPoint;
  // Null? roleModel;
  // Null? employeeRoleModel;
  // Null? userInfo;
  bool? approved;

  UserListModel(
      {this.createdByUsername,
      this.createdByFullname,
      this.createdByEmail,
      this.createdByMobile,
      this.createdOn,
      this.createdAt,
      // this.updatedByUsername,
      // this.updatedByFullname,
      // this.updatedByEmail,
      // this.updatedByMobile,
      // this.updatedOn,
      // this.updatedAt,
      // this.approvedByUsername,
      // this.approvedByFullname,
      // this.approvedByEmail,
      // this.approvedByMobile,
      // this.approvedOn,
      // this.approvedAt,
      this.id,
      this.countryId,
      this.countryCode,
      this.countryName,
      this.agencyId,
      this.agencyCode,
      this.agencyName,
      this.unitId,
      this.unitCode,
      this.unitName,
      this.locationId,
      this.locationCode,
      this.locationName,
      this.address,
      this.userId,
      this.username,
      this.fullname,
      //     this.phone,
      this.mobile,
      this.email,
      this.gender,
      this.officeLatitude,
      this.officeLongitude,
      this.reportingManagerId,
      this.reportingManagerUsername,
      this.reportingManagerFullname,
      this.reportingManagerGender,
      this.reportingManagerEmail,
      this.reportingManagerMobile,
      this.reportingManagerRole,
      this.reportingManagerRoleLevel,
      this.reportingManagerRoleGroup,
      this.reportingManagerRoleGroupLevel,
      // this.geographyPoint,
      // this.roleModel,
      // this.employeeRoleModel,
      // this.userInfo,
      this.approved});

  factory UserListModel.fromJson(Map<String, dynamic> json) =>
      _$UserListModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserListModelToJson(this);
}
