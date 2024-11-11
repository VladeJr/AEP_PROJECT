import 'package:flutter_test/flutter_test.dart';
import 'package:project_aep/models/monitoring_state.dart';

void main() {
  group('MonitoringState', () {
    late MonitoringState monitoringState;

    setUp(() {
      monitoringState = MonitoringState();
    });

    test('Inicia o monitoramento corretamente', () {
      monitoringState.startMonitoring();
      expect(monitoringState.isMonitoring, true);
      expect(monitoringState.suspiciousActivities.isEmpty, true);
    });

    test('Para o monitoramento corretamente', () {
      monitoringState.startMonitoring();
      monitoringState.stopMonitoring();
      expect(monitoringState.isMonitoring, false);
    });

    test('Adiciona atividades suspeitas corretamente', () {
      monitoringState.startMonitoring();
      monitoringState.addSuspiciousActivity('Atividade suspeita 1');
      expect(monitoringState.suspiciousActivities.length, 1);
      expect(
          monitoringState.suspiciousActivities.first, 'Atividade suspeita 1');
    });
  });
}
