import 'package:flutter/foundation.dart';

//Todos os models Relacionados
class VisitsModel with ChangeNotifier {
  //Dados da Visita
  final String visitDate;
  final String visitDoneDate;
  final int requirementId;
  final int complaintId;
  final int? analistId;
  final String createdAt;
  final String updatedAt;
  final int pruningId; //solicitação_poda_id
  // final String? companyId;
  // final String? companyNotSign;
  // final String address;
  // final String text;
  // final String denunciator;
  // final String? approval;
  // final String? protocol;
  // final String? analistId;
  // final String createdAt;
  // final String updatedAt;
  // final String? id;
  // final String? protocolo;
  // final String? rejectionReason;
  // final String? environmentalAuthorization;
  // final String? status;
  // final String? analistId;
  // final String? addressId;
  // final String? applicantId;
  // final String createdAt;
  // final String updatedAt;
  // final String comment;
  // final String? area;
  // final String name;
  // final String cpfCnpj;
  // final String? isCnpj;
  // final String? port;
  // final String? userId;
  // final String? phoneId;
  // final String? addressId;
  // final String? createdAt;
  // final String? updatedAt;
  // final String? legalRepresetant;
  // final String? id;
  // final String street;
  // final String number;
  // final String district;
  // final String city;
  // final String state;
  // final String? complement;
  // final String? cep;
  // final String? createdAt;
  // final String? updatedAt;
  // final String? id;
  // final String cpf;
  // final String rg;
  // final String orgEmissor;
  // final String? userId;
  // final String? phoneId;
  // final String? addressId;
  // final String? createdAt;
  // final String? updatedAt;

  VisitsModel(
      {required this.visitDate,
      required this.visitDoneDate,
      required this.requirementId,
      required this.complaintId,
      this.analistId,
      required this.createdAt,
      required this.updatedAt,
      required this.pruningId});
}

class ComplaintModel {
  final String? companyId;
  final String? companyNotSign;
  final String address;
  final String text;
  final String denunciator;
  final String? approval;
  final String? protocol;
  final String? analistId;
  final String createdAt;
  final String updatedAt;

  ComplaintModel(
      {this.companyId,
      this.companyNotSign,
      required this.address,
      required this.text,
      required this.denunciator,
      this.approval,
      this.protocol,
      this.analistId,
      required this.createdAt,
      required this.updatedAt});
}

class PruningSolicitationModel {
  final String? id;
  final String? protocolo;
  final String? rejectionReason;
  final String? environmentalAuthorization;
  final String? status;
  final String? analistId;
  final String? addressId;
  final String? applicantId;
  final String createdAt;
  final String updatedAt;
  final String comment;
  final String? area;

  PruningSolicitationModel(
      {this.id,
      this.protocolo,
      this.rejectionReason,
      this.environmentalAuthorization,
      this.status,
      this.analistId,
      this.addressId,
      this.applicantId,
      required this.createdAt,
      required this.updatedAt,
      required this.comment,
      this.area});
}

class CompanyModel {
  final String name;
  final String cpfCnpj;
  final String? isCnpj;
  final String? port;
  final String? userId;
  final String? phoneId;
  final String? addressId;
  final String? createdAt;
  final String? updatedAt;
  final String? legalRepresetant;

  CompanyModel(
      {required this.name,
      required this.cpfCnpj,
      this.isCnpj,
      this.port,
      this.userId,
      this.phoneId,
      this.addressId,
      this.createdAt,
      this.updatedAt,
      this.legalRepresetant});
}

class AddressModel {
  final String? id;
  final String street;
  final String number;
  final String district;
  final String city;
  final String state;
  final String complement;
  final String cep;
  final String? createdAt;
  final String? updatedAt;

  AddressModel({
    this.id,
    required this.street,
    required this.number,
    required this.district,
    required this.city,
    required this.state,
    required this.complement,
    required this.cep,
    this.createdAt,
    this.updatedAt,
  });
}

class Phone {
  final String? id;
  final String number;
  final String? createdAt;
  final String? updatedAt;

  Phone({
    this.id,
    required this.number,
    this.createdAt,
    this.updatedAt,
  });
}

class Applicant {
  final String? id;
  final String cpf;
  final String rg;
  final String orgEmissor;
  final String? userId;
  final String? phoneId;
  final String? addressId;
  final String? createdAt;
  final String? updatedAt;

  Applicant({
    this.id,
    required this.cpf,
    required this.rg,
    required this.orgEmissor,
    this.userId,
    this.phoneId,
    this.addressId,
    this.createdAt,
    this.updatedAt,
  });
}

class Profile {
  final String? id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? role;
  final String? profilePhotoPath;
  final String? createdAt;
  final String? updatedAt;
  final String profilePhotoUrl;
  Profile(
      {this.id,
      required this.name,
      required this.email,
      this.emailVerifiedAt,
      this.role,
      this.profilePhotoPath,
      this.createdAt,
      this.updatedAt,
      required this.profilePhotoUrl});
}
