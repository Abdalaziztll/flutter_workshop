import 'package:dio/dio.dart';

getHeader({bool useToken = true}) {
  if (useToken) {
    return Options(headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmRAZ21haWwuY29tIiwiaWF0IjoxNzE1OTQ2ODkyLCJleHAiOjE3MTY1NTE2OTJ9.d6ZGJwbBzfTPCmtv5YUIV8Bw8DNtGR1T7xRz4rETz6A"
    });
  } else {
    return Options(
      headers: {
        "content-type": "application/json",
      },
    );
  }
}
