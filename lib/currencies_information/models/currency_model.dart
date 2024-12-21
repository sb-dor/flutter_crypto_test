class CurrencyModel {
  final String? instrument;
  final String? market;
  final double? value;
  final String? valueFlag;
  final int? lastUpdateTimestamp;
  final double? currentHourHigh;
  final double? currentHourLow;
  final double? currentHourChangePercentage;

  CurrencyModel({
    this.instrument,
    this.market,
    this.value,
    this.valueFlag,
    this.lastUpdateTimestamp,
    this.currentHourHigh,
    this.currentHourLow,
    this.currentHourChangePercentage,
  });

  factory CurrencyModel.fromJson(Map<String, Object?> json) {
    return CurrencyModel(
      instrument: json['INSTRUMENT'] as String?,
      market: json['MARKET'] as String?,
      value: (json['VALUE'] as num?)?.toDouble(),
      valueFlag: json['VALUE_FLAG'] as String?,
      lastUpdateTimestamp: json['VALUE_LAST_UPDATE_TS'] as int?,
      currentHourHigh: (json['CURRENT_HOUR_HIGH'] as num?)?.toDouble(),
      currentHourLow: (json['CURRENT_HOUR_LOW'] as num?)?.toDouble(),
      currentHourChangePercentage: (json['CURRENT_HOUR_CHANGE_PERCENTAGE'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instrument': instrument,
      'market': market,
      'value': value,
      'valueFlag': valueFlag,
      'lastUpdateTimestamp': lastUpdateTimestamp,
      'currentHourHigh': currentHourHigh,
      'currentHourLow': currentHourLow,
      'currentHourChangePercentage': currentHourChangePercentage,
    };
  }
}
