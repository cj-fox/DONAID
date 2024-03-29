import 'package:cloud_firestore/cloud_firestore.dart';

class UrgentCase{
  String title;
  String description;
  double goalAmount;
  double amountRaised;
  String category;
  Timestamp endDate;
  Timestamp dateCreated;
  String id;
  String organizationID;
  bool active;
  bool approved;
  String? denialReason;
  bool rejected;

  UrgentCase(
      {
        required this.title,
        required this.description,
        required this.goalAmount,
        required this.amountRaised,
        required this.category,
        required this.endDate,
        required this.dateCreated,
        required this.id,
        required this.organizationID,
        required this.active,
        required this.approved,
        required this.rejected,
        this.denialReason
      });
}