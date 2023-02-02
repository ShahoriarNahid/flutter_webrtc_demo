// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userList_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListModel _$UserListModelFromJson(Map<String, dynamic> json) =>
    UserListModel(
      createdByUsername: json['createdByUsername'] as String?,
      createdByFullname: json['createdByFullname'] as String?,
      createdByEmail: json['createdByEmail'] as String?,
      createdByMobile: json['createdByMobile'] as String?,
      createdOn: json['createdOn'] as String?,
      createdAt: json['createdAt'] as String?,
      id: json['id'] as String?,
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      unitId: json['unitId'] as String?,
      unitCode: json['unitCode'] as String?,
      unitName: json['unitName'] as String?,
      locationId: json['locationId'] as String?,
      locationCode: json['locationCode'] as String?,
      locationName: json['locationName'] as String?,
      address: json['address'] as String?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      officeLatitude: (json['officeLatitude'] as num?)?.toDouble(),
      officeLongitude: (json['officeLongitude'] as num?)?.toDouble(),
      reportingManagerId: json['reportingManagerId'] as String?,
      reportingManagerUsername: json['reportingManagerUsername'] as String?,
      reportingManagerFullname: json['reportingManagerFullname'] as String?,
      reportingManagerGender: json['reportingManagerGender'] as String?,
      reportingManagerEmail: json['reportingManagerEmail'] as String?,
      reportingManagerMobile: json['reportingManagerMobile'] as String?,
      reportingManagerRole: json['reportingManagerRole'] as String?,
      reportingManagerRoleLevel: json['reportingManagerRoleLevel'] as int?,
      reportingManagerRoleGroup: json['reportingManagerRoleGroup'] as String?,
      reportingManagerRoleGroupLevel:
          json['reportingManagerRoleGroupLevel'] as int?,
      approved: json['approved'] as bool?,
    );

Map<String, dynamic> _$UserListModelToJson(UserListModel instance) =>
    <String, dynamic>{
      'createdByUsername': instance.createdByUsername,
      'createdByFullname': instance.createdByFullname,
      'createdByEmail': instance.createdByEmail,
      'createdByMobile': instance.createdByMobile,
      'createdOn': instance.createdOn,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'unitId': instance.unitId,
      'unitCode': instance.unitCode,
      'unitName': instance.unitName,
      'locationId': instance.locationId,
      'locationCode': instance.locationCode,
      'locationName': instance.locationName,
      'address': instance.address,
      'userId': instance.userId,
      'username': instance.username,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'gender': instance.gender,
      'officeLatitude': instance.officeLatitude,
      'officeLongitude': instance.officeLongitude,
      'reportingManagerId': instance.reportingManagerId,
      'reportingManagerUsername': instance.reportingManagerUsername,
      'reportingManagerFullname': instance.reportingManagerFullname,
      'reportingManagerGender': instance.reportingManagerGender,
      'reportingManagerEmail': instance.reportingManagerEmail,
      'reportingManagerMobile': instance.reportingManagerMobile,
      'reportingManagerRole': instance.reportingManagerRole,
      'reportingManagerRoleLevel': instance.reportingManagerRoleLevel,
      'reportingManagerRoleGroup': instance.reportingManagerRoleGroup,
      'reportingManagerRoleGroupLevel': instance.reportingManagerRoleGroupLevel,
      'approved': instance.approved,
    };