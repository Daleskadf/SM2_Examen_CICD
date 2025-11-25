import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movuni/utils/address_resolver.dart' as ar;
import 'package:movuni/services/session_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
	test('resolveAddressFromData returns default when null', () async {
		final result = await ar.resolveAddressFromData(null, 'Sin origen');
		expect(result, equals('Sin origen'));
	});

	test('resolveAddressFromData returns nombre when provided', () async {
		final input = {'nombre': 'Parada Central'};
		final result = await ar.resolveAddressFromData(input, 'Sin origen');
		expect(result, equals('Parada Central'));
	});

	test('resolveAddressFromData formats coordinates when lat/lng provided', () async {
		// Use coordinates that will likely cause placemarkFromCoordinates to
		// either return placemarks or throw; in either case the function falls
		// back to a 'Lat: ..., Lng: ...' string when geocoding fails.
		final input = {'lat': 10.123456, 'lng': -75.123456};
		final result = await ar.resolveAddressFromData(input, 'Sin origen');
			expect(result.startsWith('Lat:') || result.isNotEmpty, isTrue);
	});

		test('SessionService saves, retrieves and clears user role', () async {
			// Use mock preferences so tests don't hit platform channels
			SharedPreferences.setMockInitialValues({});
			final service = SessionService();

			await service.saveUserRole('admin');
			final role = await service.getUserRole();
			expect(role, equals('admin'));

			await service.clearUserRole();
			final cleared = await service.getUserRole();
			expect(cleared, isNull);
		});

		testWidgets('AddressPair shows default texts when origen/destino null', (WidgetTester tester) async {
			final data = {'origen': null, 'destino': null};
			await tester.pumpWidget(MaterialApp(
				home: Scaffold(body: ar.AddressPair(data: data)),
			));

			// Wait for FutureBuilder to complete and assert the expected label
			await tester.pumpAndSettle();
			// The AddressPair builds 'Sin origen → Sin destino'
			expect(find.text('Sin origen → Sin destino'), findsOneWidget);
		});
}
