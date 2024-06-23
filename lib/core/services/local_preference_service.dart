import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferenceService {
  static LocalPreferenceService? _localPreference;
  static SharedPreferences? _preferences;

  static Future<LocalPreferenceService> getInstance() async {
    if (_localPreference == null) {
      var secureStorage = LocalPreferenceService._();
      await secureStorage._init();
      _localPreference = secureStorage;
    }
    return _localPreference!;
  }

  LocalPreferenceService._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void writeValue(String key, value) {
    if (value is String) {
      _preferences?.setString(key, value);
    }
    if (value is bool) {
      _preferences?.setBool(key, value);
    }
    if (value is int) {
      _preferences?.setInt(key, value);
    }
    if (value is double) {
      _preferences?.setDouble(key, value);
    }
    if (value is List<String>) {
      _preferences?.setStringList(key, value);
    }
  }

  static dynamic readValue(String k) {
    final result = _preferences?.get(k);
    return result;
  }

  static void removeValue(String k) {
    _preferences?.remove(k);
  }

  static const String constTokenExp = 'userTokenExp';
  static String getTokenExp() => readValue(constTokenExp) ?? "";
  static void setTokenExp(String tokenExp) {
    writeValue(constTokenExp, tokenExp);
  }

  static const String constAccessToken = "accessToken";
  static String getAccessToken() => readValue(constAccessToken) ?? "";
  static void setAccessToken(String accessToken) {
    writeValue(constAccessToken, accessToken);
  }

  static const String constTinodeToken = "tinodeToken";
  static String? getTinodeToken() => readValue(constTinodeToken);
  static void setTinodeToken(String? tinodeToken) {
    writeValue(constTinodeToken, tinodeToken);
  }

  static const String constDeviceId = "deviceIdApp";
  static String getDeviceId() => readValue(constDeviceId) ?? "";
  static void setDeviceId(String deviceId) {
    writeValue(constDeviceId, deviceId);
  }

  static const String constUserId = "userId";
  static String getUserId() => readValue(constUserId) ?? "";
  static void setUserId(String id) {
    writeValue(constUserId, id);
  }

  static const String constEmployeeId = "employeeId";
  static String getEmployeeId() => readValue(constEmployeeId) ?? "";
  static void setEmployeeId(String id) {
    writeValue(constEmployeeId, id);
  }

  static const String constRoleId = "roleId";
  static int? getRoleId() => readValue(constRoleId);
  static void setRoleId(int id) {
    writeValue(constRoleId, id);
  }

  static const String constUserEmail = "userEmail";
  static String getUserEmail() => readValue(constUserEmail) ?? "";
  static void setUserEmail(String email) {
    writeValue(constUserEmail, email);
  }

  static const String constUserName = "userName";
  static String getUserName() => readValue(constUserName) ?? "";
  static void setUserName(String userName) {
    writeValue(constUserName, userName);
  }

  static const String constFullName = "fullName";
  static String getFullName() => readValue(constFullName) ?? "";
  static void setFullName(String fullName) {
    writeValue(constFullName, fullName);
  }

  static const String constUserLanguageKey = 'userLanguage';
  static String getLanguage() => readValue(constUserLanguageKey) ?? "en";
  static void setLanguage(String language) {
    writeValue(constUserLanguageKey, language);
  }

  static const String constIntlanguageKey = 'intlLanguage';
  static String? getIntl() => readValue(constIntlanguageKey);
  static void setIntl(String intl) {
    writeValue(constIntlanguageKey, intl);
  }

  static const String constThemeMode = 'themeMode';
  static String getThemeMode() => readValue(constThemeMode) ?? "Light";
  static void setThemeMode(String mode) {
    writeValue(constThemeMode, mode);
  }

  static const String constThemeModel = 'themeModel';
  static String? getTheme() => readValue(constThemeModel);
  static void setTheme(String theme) {
    writeValue(constThemeModel, theme);
  }

  static const String constIsUploadingMedia = 'isUploadingMedia';
  static bool getIsUploadingMedia() => readValue(constIsUploadingMedia) ?? false;
  static void setIsUploadingMedia(bool isUploadingMedia) {
    writeValue(constIsUploadingMedia, isUploadingMedia);
  }

  static const String constDoNotDisturb = "doNotDisturb";
  static bool getDoNotDisturb() => readValue(constDoNotDisturb) ?? false;
  static void setDoNotDisturb(bool silent) {
    writeValue(constDoNotDisturb, silent);
  }

  /// Company
  static const String constCompanyName = "companyName";
  static String getCompanyName() => readValue(constCompanyName) ?? "";
  static void setCompanyName(String? company) {
    writeValue(constCompanyName, company);
  }

  static const String constCompanyBaseUrl = "companyBaseUrl";
  static String getCompanyBaseUrl() => readValue(constCompanyBaseUrl) ?? "";
  static void setCompanyBaseUrl(String? company) {
    writeValue(constCompanyBaseUrl, company);
  }

  static const String constCompanyLogo = "companyLogo";
  static String getCompanyLogo() => readValue(constCompanyLogo) ?? "";
  static void setCompanyLogo(String? company) {
    writeValue(constCompanyLogo, company);
  }

  static const String constCompanyId = "companyId";
  static String? getCompanyId() => readValue(constCompanyId);
  static void setCompanyId(String? company) {
    writeValue(constCompanyId, company);
  }

  static const String constCompanySocketUrl = "companySocketUrl";
  static String getCompanySocketUrl() => readValue(constCompanySocketUrl) ?? "";
  static void setCompanySocketUrl(String? company) {
    writeValue(constCompanySocketUrl, company);
  }

  static const String constConferenceUrl = "conferenceUrl";
  static String getConferenceUrl() => readValue(constConferenceUrl) ?? "";
  static void setConferenceUrl(String? conference) {
    writeValue(constConferenceUrl, conference);
  }

  static bool isHaveCompanyCredential() {
    final companyBaseUrl = getCompanyBaseUrl().isNotEmpty;
    final companyName = getCompanyName().isNotEmpty;
    final companyLogo = getCompanyLogo().isNotEmpty;
    final companyId = (getCompanyId() ?? "").isNotEmpty;
    final companySocketUrl = getCompanySocketUrl().isNotEmpty;
    final companyConferenceUrl = getConferenceUrl().isNotEmpty;
    return companyBaseUrl && companyName && companyLogo && companyId && companySocketUrl && companyConferenceUrl;
  }

  static bool isHaveCredential() =>
      (getUserId() != "") && ((getUserEmail() != "") || getUserName() != "") && (getAccessToken() != "") && (getRoleId() != null) && (getTokenExp() != "");

  static void removeCredential() {
    removeValue(constUserId);
    removeValue(constEmployeeId);
    removeValue(constUserEmail);
    removeValue(constUserName);
    removeValue(constFullName);
    removeValue(constAccessToken);
    removeValue(constTokenExp);
    removeValue(constDeviceId);
    removeValue(constRoleId);
    setDoNotDisturb(true);
  }
}
