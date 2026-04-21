import 'package:flutter_test/flutter_test.dart';
import 'package:maquetacion/features/login/domain/usecases/log_out_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:maquetacion/features/login/domain/repositories/authentication_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late MockAuthenticationRepository mockAuthenticationRepository;
  late LogOutUsecase logOutUsecase;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    logOutUsecase = LogOutUsecase(mockAuthenticationRepository);
  });

  group('LogOutUsecase', () {
    test(
      'debe completar sin errores cuando signOut se ejecuta correctamente',
      () async {
        // Arrange
        when(
          () => mockAuthenticationRepository.signOut(),
        ).thenAnswer((_) async {});

        // Act
        final result = logOutUsecase();

        // Assert
        await expectLater(result, completes);

        verify(() => mockAuthenticationRepository.signOut()).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepository);
      },
    );

    test('debe lanzar una excepción cuando signOut falla', () async {
      // Arrange
      when(
        () => mockAuthenticationRepository.signOut(),
      ).thenThrow(Exception('Error al cerrar sesión'));

      // Act & Assert
      await expectLater(() => logOutUsecase(), throwsA(isA<Exception>()));

      verify(() => mockAuthenticationRepository.signOut()).called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
