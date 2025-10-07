/// Not supported exception
class NotSupportedException implements Exception {
  /// Constructor
  const NotSupportedException([this.message]);

  /// Optional message
  final String? message;

  @override
  String toString() => message ?? 'NotSupportedException';
}
