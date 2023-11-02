// To parse this JSON data, do
//
//     final CountryBankModal = CountryBankModalFromJson(jsonString);

import 'dart:convert';

List<CountryBankModal> CountryBankModalFromJson(String str) =>
    List<CountryBankModal>.from(
        json.decode(str).map((x) => CountryBankModal.fromJson(x)));

String CountryBankModalToJson(List<CountryBankModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryBankModal {
  String? id;
  String? branchBic;
  String? branchName;
  Country? country;
  String? parentBranch;
  String? parentBranchName;
  Fin? fin;
  Fin? scoreFileActRealTime;
  Fin? scoreFileActStoreForward;

  CountryBankModal({
    this.id,
    this.branchBic,
    this.branchName,
    this.country,
    this.parentBranch,
    this.parentBranchName,
    this.fin,
    this.scoreFileActRealTime,
    this.scoreFileActStoreForward,
  });

  factory CountryBankModal.fromJson(Map<String, dynamic> json) =>
      CountryBankModal(
        id: json["_id"],
        branchBic: json["branch_BIC"],
        branchName: json["branch_name"],
        country: countryValues.map[json["country"]],
        parentBranch: json["parent_branch"],
        parentBranchName: json["parent_branch_name"],
        fin: finValues.map[json["FIN"]],
        scoreFileActRealTime: finValues.map[json["SCORE_FileAct_Real Time"]],
        scoreFileActStoreForward:
            finValues.map[json["SCORE_FileAct_Store_Forward"]],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "branch_BIC": branchBic,
        "branch_name": branchName,
        "country": countryValues.reverse[country],
        "parent_branch": parentBranch,
        "parent_branch_name": parentBranchName,
        "FIN": finValues.reverse[fin],
        "SCORE_FileAct_Real Time": finValues.reverse[scoreFileActRealTime],
        "SCORE_FileAct_Store_Forward":
            finValues.reverse[scoreFileActStoreForward],
      };
}

enum Country { INDIA }

final countryValues = EnumValues({"INDIA": Country.INDIA});

enum Fin { EMPTY, YES }

final finValues = EnumValues({"": Fin.EMPTY, "YES": Fin.YES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
