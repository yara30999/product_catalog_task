import 'package:products_app/core/resourses/constants_manager.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return ConstantsManager.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ConstantsManager.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return ConstantsManager.zeroDouble;
    } else {
      return this!;
    }
  }
}
