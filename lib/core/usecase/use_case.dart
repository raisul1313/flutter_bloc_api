import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_api/core/error/failure.dart';

abstract class UseCase<output, input> {
  Future<Either<Failure, output>> execute(input inputParams);
}
