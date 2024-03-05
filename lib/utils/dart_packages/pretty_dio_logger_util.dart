import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PrettyDioLoggerUtil {
  static PrettyDioLogger get prettyDioLogger {
    return PrettyDioLogger(
      request: true,
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      maxWidth: 100,
    );
  }
}
