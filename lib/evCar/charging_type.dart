enum ChargingType {
  slow, // 완속 충전
  fast, // 급속 충전
  superFast, // 초급속 충전
  teslaSupercharger // 테슬라 전용 충전기
}

extension ChargingTypeExtension on ChargingType {
  // 각 충전 타입에 대한 이름 반환
  String get name {
    switch (this) {
      case ChargingType.slow:
        return '완속 충전';
      case ChargingType.fast:
        return '급속 충전';
      case ChargingType.superFast:
        return '초급속 충전';
      case ChargingType.teslaSupercharger:
        return '테슬라 월박스';
      default:
        return '';
    }
  }
}
