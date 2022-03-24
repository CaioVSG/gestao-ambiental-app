import 'package:flutter/foundation.dart';

class VisitsModel with ChangeNotifier {
  //Dados da Visita
  final String visitDate;
  final String visitDoneDate;
  final String requirementId;
  final String complaintId;
  final String? analistId;
  final String createdAt;
  final String updatedAt;
  final String pruningId; //solicitação_poda_id

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

class CompanyModel {
  final String name;
  final String cpfCnpj;
  final String isCnpj;
  final String? port;
  final String userId;
  final String phoneId;
  final String addressId;
  final String created_at;
  final String updated_at;
  final String legal_represetant;

  CompanyModel(
      {required this.name,
      required this.cpfCnpj,
      required this.isCnpj,
      this.port,
      required this.userId,
      required this.phoneId,
      required this.addressId,
      required this.created_at,
      required this.updated_at,
      required this.legal_represetant});
}
