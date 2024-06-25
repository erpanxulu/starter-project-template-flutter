class MyDataType {
  MyDataType._();

  static const String text = "text";
  static const String numeric = "numeric";
  static const String memo = "memo";
  static const String date = "date";
  static const String time = "time";
  static const String datetime = "datetime";
  static const String dropdown = "dropdown";
  static const String editor = "editor";
  static const String boolean = "booleans";
  static const String tag = "tag";
  static const String login = "login";
  static const String formatIntegers = "integers";
  static const String formatDecimals = "decimals";

  /// Media
  static const String picture = "picture";
  static const String video = "video";
  static const String file = "file";
  static const String audio = "audio";
  static const String allMedia = "allMedia";

  static bool isDateTimeType(String? type) {
    return type == MyDataType.date || type == MyDataType.time || type == MyDataType.datetime;
  }

  static bool isAuditDateTimeType(String? field) {
    return field == 'updatedAt' || field == 'createdAt';
  }

  static bool isTimeType(String? type) {
    return type == MyDataType.time;
  }

  static bool isMedia(String? type) {
    return type == MyDataType.picture || type == MyDataType.video || type == MyDataType.audio || type == MyDataType.file;
  }

  static bool isNotMedia(String? type) {
    return type != MyDataType.picture && type != MyDataType.video && type != MyDataType.audio && type != MyDataType.file;
  }

  static List<String> formDataTypeToMimes(String formDataType) {
    switch (formDataType) {
      case "picture":
        return <String>["image/jpeg", "image/png", "image/gif"];
      case "video":
        return <String>["video/mp4", "video/quicktime"];
      case "audio":
        return <String>["audio/mp3", "audio/mpeg"];
      case "file":
        return <String>[
          "application/pdf",
          "application/msword",
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
          "application/vnd.ms-excel",
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          "application/vnd.ms-powerpoint",
          "application/vnd.openxmlformats-officedocument.presentationml.presentation",
          "text/plain",
          "text/csv",
          "application/zip",
          "application/x-zip-compressed",
        ];
      default:
        return <String>[
          "image/jpeg",
          "image/png",
          "image/gif",
          "video/mp4",
          "video/quicktime",
          "audio/mp3",
          "audio/mpeg",
          "application/pdf",
          "application/msword",
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
          "application/vnd.ms-excel",
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          "application/vnd.ms-powerpoint",
          "application/vnd.openxmlformats-officedocument.presentationml.presentation",
          "text/plain",
          "text/csv",
          "application/zip",
          "application/x-zip-compressed",
        ];
    }
  }
}
