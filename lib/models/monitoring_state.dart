import 'package:flutter/foundation.dart';
import 'dart:async';
import '../services/threat_detection_service.dart';

class MonitoringState with ChangeNotifier {
  bool _isMonitoring = false;
  List<String> _suspiciousActivities = [];
  Timer? _simulationTimer;
  final ThreatDetectionService _detectionService =
      ThreatDetectionService(); // Instancia o serviço

  bool get isMonitoring => _isMonitoring;
  List<String> get suspiciousActivities => _suspiciousActivities;

  // Método para iniciar o monitoramento
  void startMonitoring() {
    _isMonitoring = true;
    _suspiciousActivities.clear();
    notifyListeners();
    _startSimulation(); // Inicia a simulação
  }

  // Método para parar o monitoramento
  void stopMonitoring() {
    _isMonitoring = false;
    _simulationTimer?.cancel(); // Cancela o timer
    notifyListeners();
  }

  // Método para adicionar uma atividade suspeita
  void addSuspiciousActivity(String activity) {
    _suspiciousActivities.add(activity);
    notifyListeners();
  }

  // Método para limpar atividades suspeitas (opcional)
  void clearSuspiciousActivities() {
    _suspiciousActivities.clear();
    notifyListeners();
  }

  // Simulação de atividades suspeitas
  void _startSimulation() {
    _simulationTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (!_isMonitoring) {
        timer.cancel(); // Cancela a simulação se o monitoramento parar
      } else {
        // Usa o ThreatDetectionService para detectar ameaças
        String activity = _detectionService.detectThreat();
        addSuspiciousActivity(activity);
      }
    });
  }
}
