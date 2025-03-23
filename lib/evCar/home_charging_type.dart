enum HomeChargingType { wallBox, blueBox, teslaWallConnector }

extension HomeChargingTypeExtension on HomeChargingType {
  // 각 충전 타입에 대한 이름 반환
  String get name {
    switch (this) {
      case HomeChargingType.wallBox:
        return '월박스';
      case HomeChargingType.blueBox:
        return '블루박스';
      case HomeChargingType.teslaWallConnector:
        return '테슬라 월박스';
      default:
        return '';
    }
  }

  String get info {
    switch (this) {
      case HomeChargingType.wallBox:
        return '월박스는 가정에서 사용하기 좋은 전기차 충전기로, 아래와 같은 모델이 있습니다. \n(Pulsar Plus, Commander 2, Copper)\nLevel 2 급속 충전기로, 380V의 전압을 사용하며, 보통 1~2시간 이내에 충전이 가능합니다.';
      case HomeChargingType.blueBox:
        return '블루박스는 완속 충전기로, 일반 220V 콘센트에 연결하여 사용할 수 있는 충전기입니다.\n완속 충전기란? 220V 전원을 사용하고 일반 가정용 전기 콘센트에 연결하여 사용하므로 설치가 간편하지만 충전 속도는 느립니다.\n주로 2~5시간의 시간이 필요합니다.';
      case HomeChargingType.teslaWallConnector:
        return '테슬라 전용 충전기로, 빠른 충전이 가능합니다.';
      default:
        return '';
    }
  }
}
