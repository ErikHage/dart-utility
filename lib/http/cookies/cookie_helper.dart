class CookieHelper {
  static RegExp setCookieHeaderSplitRegex = RegExp(r'(?<=)(,)(?=[^;]+?=)');

  static Map<String, List<String>> parseSetCookieHeaders(String? rawSetCookieHeaders) {
    Map<String, List<String>> cookies = {};

    if (rawSetCookieHeaders == null) {
      return cookies;
    }

    List<String> headersList = rawSetCookieHeaders.split(setCookieHeaderSplitRegex);

    List<String> splitCookies = [];
    for (int i = 0; i < headersList.length; i++) {
      splitCookies.addAll(headersList[i].split(";"));
    }

    for (String kvPair in splitCookies) {
      List<String> kv = kvPair.split("=");

      if (kv.length > 1) {
        String key = kv[0].trim();
        String value = kv[1].trim();

        if (cookies.containsKey(key)) {
          cookies[key]!.add(value);
        } else {
          cookies[key] = [value];
        }
      }
    }

    return cookies;
  }

  static String getCookieHeader(Map<String, String> cookies) {
    List<String> headers = [];

    for (var key in cookies.keys) {
      String value = cookies[key]!;

      headers.add("$key=${Uri.encodeComponent(value)}");
    }

    return headers.join("; ");
  }

  static String? extractCookieValue(Map<String, List<String>> cookies, String cookieName) {
    List<String> values = cookies[cookieName] ?? [];

    if (values.isEmpty) {
      return null;
    }

    return Uri.decodeFull(values[0]);
  }
}