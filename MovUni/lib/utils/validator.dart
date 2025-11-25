/// Clase de utilidades para validaciones de negocio - MovUni
/// Requerido para CI/CD Pipeline - SM2 Examen Unidad 3
class Validator {
  /// 1. Validar Email Institucional UPT
  /// Recibe un string. Retorna true si es un correo @virtual.upt.pe válido
  static bool validarEmailInstitucional(String email) {
    if (email.isEmpty) return false;
    return email.contains('@') && 
           email.contains('.') && 
           email.endsWith('@virtual.upt.pe');
  }

  /// 2. Validar Seguridad Contraseña
  /// Recibe un string. Retorna true si la longitud es mayor a 6 caracteres.
  /// Requerido por Firebase Auth en el sistema de registro MovUni
  static bool validarSeguridadContrasena(String contrasena) {
    return contrasena.length > 6;
  }

  /// 3. Calcular Precio de Viaje
  /// Recibe precio base y número de pasajeros. Retorna el precio total del viaje.
  /// Ejemplo: calcularPrecioViaje(5.0, 3) -> 15.0
  static double calcularPrecioViaje(double precioBase, int numeroPasajeros) {
    if (precioBase < 0 || numeroPasajeros < 1) {
      throw ArgumentError('Precio base debe ser positivo y al menos 1 pasajero');
    }
    if (numeroPasajeros > 4) {
      throw ArgumentError('Máximo 4 pasajeros por viaje');
    }
    return precioBase * numeroPasajeros;
  }

  /// 4. Validar Asientos Disponibles
  /// Recibe cantidad de asientos. Retorna true si está entre 1 y 4 (capacidad del vehículo)
  static bool validarAsientosDisponibles(int asientos) {
    return asientos >= 1 && asientos <= 4;
  }

  /// 5. Formatear Placa Vehicular
  /// Recibe una placa y la retorna en formato estándar mayúsculas
  /// Ejemplo: "abc-123" -> "ABC-123"
  static String formatearPlacaVehicular(String placa) {
    return placa.toUpperCase().trim();
  }

  /// 6. Validar DNI Peruano
  /// Recibe un string. Retorna true si tiene exactamente 8 dígitos numéricos
  static bool validarDNI(String dni) {
    if (dni.length != 8) return false;
    return RegExp(r'^\d{8}$').hasMatch(dni);
  }

  /// 7. Validar Teléfono Celular Peruano
  /// Recibe un string. Retorna true si tiene 9 dígitos y empieza con 9
  static bool validarTelefonoCelular(String telefono) {
    if (telefono.length != 9) return false;
    return telefono.startsWith('9') && RegExp(r'^\d{9}$').hasMatch(telefono);
  }

  /// 8. Validar Rango de Rating
  /// Recibe un double. Retorna true si está entre 1.0 y 5.0 (sistema de calificación)
  static bool validarRating(double rating) {
    return rating >= 1.0 && rating <= 5.0;
  }
}
