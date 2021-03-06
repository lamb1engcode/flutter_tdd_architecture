import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_architecture/src/core/error/failures.dart';
import 'package:flutter_tdd_architecture/src/core/usecases/usecase.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/repositories/authentication_repository.dart';

class Register implements UseCase<User, ParamsRegister> {
  final AuthenticationRepository repository;

  Register({required this.repository});

  @override
  Future<Either<Failure, User>> call(ParamsRegister params) async {
    return await repository.register(
      username: params.username,
      password: params.password,
      fullName: params.fullName,
    );
  }
}

class ParamsRegister extends Equatable {
  final String username;
  final String password;
  final String fullName;

  ParamsRegister({
    required this.username,
    required this.password,
    required this.fullName,
  });

  @override
  List<Object> get props => [username, password, fullName];
}
