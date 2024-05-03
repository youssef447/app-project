abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errMessage);
}
