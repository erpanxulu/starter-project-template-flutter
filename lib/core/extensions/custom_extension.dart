import 'package:intl/intl.dart';
import 'package:mytodo_mobx_app/core/utils/my_data_type.dart';

extension ParseEnumToString on Enum {
  String parseToString() => toString().split('.').last;
}

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  String titleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize()).join(' ');

  bool isDeltaFormat() {
    if (startsWith('[') && endsWith(']') && contains('{') && contains('}') && contains(':')) {
      return true;
    } else {
      return false;
    }
  }

  String get removeSlash => replaceAll("/", "");

  String textOrDate(String? type) {
    try {
      if (MyDataType.isDateTimeType(type)) {
        final dateTime = DateTime.parse(this).toLocal();
        if (type == MyDataType.date) return DateFormat("dd-MM-yyyy").format(dateTime);
        return DateFormat('dd-MM-yyyy HH:mm:ss').format(dateTime);
      } else if (MyDataType.isTimeType(type)) {
        final dateTime = DateTime.parse(this).toLocal();
        return DateFormat('HH:mm:ss').format(dateTime);
      } else {
        return this;
      }
    } catch (e) {
      return this;
    }
  }
}
