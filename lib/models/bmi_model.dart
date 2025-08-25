class BmiModel {
  final BmiData? data;
  BmiModel({this.data});

  factory BmiModel.fromJson(Map<String, dynamic> json) {
    return BmiModel(
      data: json["data"] != null ? BmiData.fromJson(json["data"]) : null,
    );
  }
}

class BmiData {
  final double? bmi;
  final double? height;
  final double? weight;
  final String? summary;
  final String? risk;
  final String? recommendation;

  BmiData({
    this.bmi,
    this.height,
    this.weight,
    this.summary,
    this.risk,
    this.recommendation,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      bmi: (json["bmi"] is num) ? (json["bmi"] as num).toDouble() : null,
      height: double.tryParse(json["height"])??0,
      weight: double.tryParse(json["weight"])??0,
      summary: json["summary"],
      risk: json["risk"],
      recommendation: json["recommendation"],
    );
  }
}
