# MovUni - Sistema de Carpooling Universitario UPT

[![CI/CD Pipeline](https://github.com/Daleskadf/SM2_Examen_CICD/actions/workflows/ci-pipeline.yml/badge.svg)](https://github.com/Daleskadf/SM2_Examen_CICD/actions/workflows/ci-pipeline.yml)

## �� Datos del Alumno

- **Estudiante**: [Daleska Nicolle Fernandez Villanueva]
- **Tecnología**: Flutter 3.35.5
- **Curso**: Soluciones moviles II 
- **Universidad**: Universidad Privada de Tacna

## 🔗 Enlaces del Proyecto

- **Repositorio GitHub**: [https://github.com/Daleskadf/SM2_Examen_CICD](https://github.com/Daleskadf/SM2_Examen_CICD)
- **GitHub Actions**: [Ver Workflows](https://github.com/Daleskadf/SM2_Examen_CICD/actions)

## 🎯 Objetivo del Proyecto

Implementar un flujo de trabajo (Pipeline) de **Integración y Entrega Continua** usando GitHub Actions que:

1. ✅ Verifica la lógica de negocio mediante **Tests Unitarios**
2. ✅ Audita la calidad del código con **Linting** (flutter analyze)
3. ✅ Compila y genera el instalable automáticamente (**APK**)

## 🧪 Tests Unitarios Implementados

Las 5 funciones de validación implementadas en `lib/utils/validator.dart`:

| # | Función | Descripción | Test |
|---|---------|-------------|------|
| 1 | `validarEmailInstitucional()` | Valida emails @virtual.upt.pe | ✅ Verifica formato institucional |
| 2 | `validarSeguridadContrasena()` | Contraseña > 6 caracteres | ✅ Valida longitud mínima |
| 3 | `calcularPrecioViaje()` | Calcula precio × pasajeros | ✅ Verifica cálculo correcto |
| 4 | `validarAsientosDisponibles()` | Valida rango 1-4 asientos | ✅ Verifica límites |
| 5 | `formatearPlacaVehicular()` | Convierte a mayúsculas | ✅ Valida formato |

## 📊 Evidencias de Ejecución

### ✅ Badge de Estado del Pipeline

![Badge CI/CD](imagenes/badge.png)

El badge al inicio de este README muestra el estado actual del pipeline:
- 🟢 **Passing**: Pipeline exitoso

### 🧪 Evidencia de Tests Unitarios

![Tests Unitarios](imagenes/unit-tests.png)

**Resultado esperado:**
```
00:02 +5: All tests passed!
```

### 📦 Evidencia de Construcción (APK)

![APK Artifact](imagenes/apk-artifact.png)

**Artefacto generado:**
- Nombre: `movuni-app-release`
- Ubicación: `MovUni/build/app/outputs/flutter-apk/*.apk`

---

## 🎓 Conclusión

El pipeline de CI/CD fue implementado exitosamente, automatizando:
- ✅ Verificación de calidad de código
- ✅ Ejecución de tests unitarios
- ✅ Compilación y generación de APK
- ✅ Distribución automática de artefactos

**Estado del Pipeline**: 🟢 **PASSING**
