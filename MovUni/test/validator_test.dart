import 'package:flutter_test/flutter_test.dart';
import 'package:movuni/utils/validator.dart';

/// Tests Unitarios para Validadores de MovUni
/// Sistema de carpooling universitario - UPT
void main() {
  group('Validator - Tests Unitarios MovUni', () {
    
    // ========== TEST 1: Validar Email Institucional UPT ==========
    group('validarEmailInstitucional', () {
      test('Debe retornar true para email institucional válido @virtual.upt.pe', () {
        expect(Validator.validarEmailInstitucional('estudiante@virtual.upt.pe'), isTrue);
        expect(Validator.validarEmailInstitucional('conductor@virtual.upt.pe'), isTrue);
        expect(Validator.validarEmailInstitucional('admin@virtual.upt.pe'), isTrue);
        expect(Validator.validarEmailInstitucional('2021123456@virtual.upt.pe'), isTrue);
      });

      test('Debe retornar false para email NO institucional', () {
        expect(Validator.validarEmailInstitucional('usuario@gmail.com'), isFalse);
        expect(Validator.validarEmailInstitucional('test@hotmail.com'), isFalse);
        expect(Validator.validarEmailInstitucional('admin@upt.pe'), isFalse);
      });

      test('Debe retornar false para email sin @ o sin .', () {
        expect(Validator.validarEmailInstitucional('usuariovirtual.upt.pe'), isFalse);
        expect(Validator.validarEmailInstitucional('usuario@virtualuptpe'), isFalse);
      });

      test('Debe retornar false para email vacío', () {
        expect(Validator.validarEmailInstitucional(''), isFalse);
      });
    });

    // ========== TEST 2: Seguridad Contraseña (Firebase Auth) ==========
    group('validarSeguridadContrasena', () {
      test('Debe retornar true para contraseña con más de 6 caracteres', () {
        expect(Validator.validarSeguridadContrasena('1234567'), isTrue);
        expect(Validator.validarSeguridadContrasena('MovUni2024!'), isTrue);
        expect(Validator.validarSeguridadContrasena('SecurePass'), isTrue);
      });

      test('Debe retornar false para contraseña de 6 caracteres o menos', () {
        expect(Validator.validarSeguridadContrasena('123456'), isFalse);
        expect(Validator.validarSeguridadContrasena('pass'), isFalse);
        expect(Validator.validarSeguridadContrasena(''), isFalse);
        expect(Validator.validarSeguridadContrasena('abc'), isFalse);
      });
    });

    // ========== TEST 3: Calcular Precio de Viaje ==========
    group('calcularPrecioViaje', () {
      test('Debe calcular correctamente el precio total del viaje', () {
        // Precio base S/ 5.00 por pasajero
        expect(Validator.calcularPrecioViaje(5.0, 1), equals(5.0));
        expect(Validator.calcularPrecioViaje(5.0, 2), equals(10.0));
        expect(Validator.calcularPrecioViaje(5.0, 3), equals(15.0));
        expect(Validator.calcularPrecioViaje(5.0, 4), equals(20.0));
        
        // Otros precios
        expect(Validator.calcularPrecioViaje(7.5, 2), equals(15.0));
        expect(Validator.calcularPrecioViaje(10.0, 3), equals(30.0));
      });

      test('Debe lanzar error para precio negativo', () {
        expect(
          () => Validator.calcularPrecioViaje(-5.0, 2),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('Debe lanzar error para 0 pasajeros', () {
        expect(
          () => Validator.calcularPrecioViaje(5.0, 0),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('Debe lanzar error para más de 4 pasajeros (límite del vehículo)', () {
        expect(
          () => Validator.calcularPrecioViaje(5.0, 5),
          throwsA(isA<ArgumentError>()),
        );
        expect(
          () => Validator.calcularPrecioViaje(5.0, 10),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    // ========== TEST 4: Validar Asientos Disponibles ==========
    group('validarAsientosDisponibles', () {
      test('Debe retornar true para asientos entre 1 y 4 (capacidad del vehículo)', () {
        expect(Validator.validarAsientosDisponibles(1), isTrue);
        expect(Validator.validarAsientosDisponibles(2), isTrue);
        expect(Validator.validarAsientosDisponibles(3), isTrue);
        expect(Validator.validarAsientosDisponibles(4), isTrue);
      });

      test('Debe retornar false para asientos fuera del rango', () {
        expect(Validator.validarAsientosDisponibles(0), isFalse);
        expect(Validator.validarAsientosDisponibles(5), isFalse);
        expect(Validator.validarAsientosDisponibles(-1), isFalse);
        expect(Validator.validarAsientosDisponibles(10), isFalse);
      });
    });

    // ========== TEST 5: Formatear Placa Vehicular ==========
    group('formatearPlacaVehicular', () {
      test('Debe convertir placa a mayúsculas', () {
        expect(Validator.formatearPlacaVehicular('abc-123'), equals('ABC-123'));
        expect(Validator.formatearPlacaVehicular('xyz-789'), equals('XYZ-789'));
        expect(Validator.formatearPlacaVehicular('t1a-234'), equals('T1A-234'));
      });

      test('Debe mantener placa ya en mayúsculas', () {
        expect(Validator.formatearPlacaVehicular('ABC-123'), equals('ABC-123'));
      });

      test('Debe eliminar espacios en blanco', () {
        expect(Validator.formatearPlacaVehicular(' abc-123 '), equals('ABC-123'));
        expect(Validator.formatearPlacaVehicular('  xyz-789  '), equals('XYZ-789'));
      });

      test('Debe manejar formato mixto', () {
        expect(Validator.formatearPlacaVehicular('AbC-123'), equals('ABC-123'));
      });
    });

    // ========== TESTS ADICIONALES (Bonus) ==========
    
    group('validarDNI', () {
      test('Debe retornar true para DNI peruano válido de 8 dígitos', () {
        expect(Validator.validarDNI('12345678'), isTrue);
        expect(Validator.validarDNI('87654321'), isTrue);
        expect(Validator.validarDNI('00000001'), isTrue);
      });

      test('Debe retornar false para DNI con menos o más de 8 dígitos', () {
        expect(Validator.validarDNI('1234567'), isFalse);
        expect(Validator.validarDNI('123456789'), isFalse);
        expect(Validator.validarDNI(''), isFalse);
      });

      test('Debe retornar false para DNI con letras', () {
        expect(Validator.validarDNI('1234567A'), isFalse);
        expect(Validator.validarDNI('ABCDEFGH'), isFalse);
      });
    });

    group('validarTelefonoCelular', () {
      test('Debe retornar true para celular peruano válido', () {
        expect(Validator.validarTelefonoCelular('987654321'), isTrue);
        expect(Validator.validarTelefonoCelular('912345678'), isTrue);
        expect(Validator.validarTelefonoCelular('999888777'), isTrue);
      });

      test('Debe retornar false para número que no empieza con 9', () {
        expect(Validator.validarTelefonoCelular('812345678'), isFalse);
        expect(Validator.validarTelefonoCelular('512345678'), isFalse);
      });

      test('Debe retornar false para número con menos o más de 9 dígitos', () {
        expect(Validator.validarTelefonoCelular('98765432'), isFalse);
        expect(Validator.validarTelefonoCelular('9876543210'), isFalse);
      });
    });

    group('validarRating', () {
      test('Debe retornar true para rating entre 1.0 y 5.0', () {
        expect(Validator.validarRating(1.0), isTrue);
        expect(Validator.validarRating(3.5), isTrue);
        expect(Validator.validarRating(5.0), isTrue);
        expect(Validator.validarRating(4.8), isTrue);
      });

      test('Debe retornar false para rating fuera de rango', () {
        expect(Validator.validarRating(0.0), isFalse);
        expect(Validator.validarRating(0.5), isFalse);
        expect(Validator.validarRating(5.1), isFalse);
        expect(Validator.validarRating(6.0), isFalse);
        expect(Validator.validarRating(-1.0), isFalse);
      });
    });
  });
}

