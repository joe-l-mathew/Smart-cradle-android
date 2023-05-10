import 'dart:convert';

class DbModel {
  final int degreeOfAsleep;
  final bool isCradleOsccilating;
  final bool peeStatus;
  final bool isBabyAwake;
  final bool onOff;
  DbModel({
    required this.degreeOfAsleep,
    required this.isCradleOsccilating,
    required this.peeStatus,
    required this.isBabyAwake,
    required this.onOff,
  });

  DbModel copyWith({
    int? degreeOfAsleep,
    bool? isCradleOsccilating,
    bool? peeStatus,
    bool? isBabyAwake,
    bool? onOff,
  }) {
    return DbModel(
      degreeOfAsleep: degreeOfAsleep ?? this.degreeOfAsleep,
      isCradleOsccilating: isCradleOsccilating ?? this.isCradleOsccilating,
      peeStatus: peeStatus ?? this.peeStatus,
      isBabyAwake: isBabyAwake ?? this.isBabyAwake,
      onOff: onOff ?? this.onOff,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'degreeOfAsleep': degreeOfAsleep});
    result.addAll({'isCradleOsccilating': isCradleOsccilating});
    result.addAll({'peeStatus': peeStatus});
    result.addAll({'isBabyAwake': isBabyAwake});
    result.addAll({'onOff': onOff});
  
    return result;
  }

  factory DbModel.fromMap(Map<String, dynamic> map) {
    return DbModel(
      degreeOfAsleep: map['degreeOfAsleep']?.toInt() ?? 0,
      isCradleOsccilating: map['isCradleOsccilating'] ?? false,
      peeStatus: map['peeStatus'] ?? false,
      isBabyAwake: map['isBabyAwake'] ?? false,
      onOff: map['onOff'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory DbModel.fromJson(String source) => DbModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DbModel(degreeOfAsleep: $degreeOfAsleep, isCradleOsccilating: $isCradleOsccilating, peeStatus: $peeStatus, isBabyAwake: $isBabyAwake, onOff: $onOff)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DbModel &&
      other.degreeOfAsleep == degreeOfAsleep &&
      other.isCradleOsccilating == isCradleOsccilating &&
      other.peeStatus == peeStatus &&
      other.isBabyAwake == isBabyAwake &&
      other.onOff == onOff;
  }

  @override
  int get hashCode {
    return degreeOfAsleep.hashCode ^
      isCradleOsccilating.hashCode ^
      peeStatus.hashCode ^
      isBabyAwake.hashCode ^
      onOff.hashCode;
  }
}
