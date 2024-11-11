import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_aep/models/monitoring_state.dart';
import 'package:project_aep/screens/pagina_inicial.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Exibe título e botão de monitoramento',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => MonitoringState(),
          child: HomeScreen(),
        ),
      ),
    );

    // Verifica o título
    expect(find.text('Detecção de Ameaças Cibernéticas'), findsOneWidget);

    // Verifica o botão de monitoramento
    expect(find.text('Iniciar Monitoramento'), findsOneWidget);
  });

  testWidgets('Inicia e para o monitoramento corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => MonitoringState(),
          child: HomeScreen(),
        ),
      ),
    );

    // Clica no botão de iniciar monitoramento
    await tester.tap(find.text('Iniciar Monitoramento'));
    await tester.pump();

    // Verifica se o botão muda para "Parar Monitoramento"
    expect(find.text('Parar Monitoramento'), findsOneWidget);
  });
}
