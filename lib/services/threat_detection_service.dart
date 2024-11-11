import 'dart:math';

class ThreatDetectionService {
  // Função para detectar atividade suspeita (simulada)
  String detectThreat() {
    // Simulação de diferentes tipos de ameaças
    List<String> threatSamples = [
      "Acesso não autorizado detectado",
      "Tentativa de intrusão na rede",
      "Anomalia de tráfego suspeita",
      "Atividade de login em local desconhecido"
    ];

    // Seleciona uma ameaça aleatória
    final random = Random();
    int index = random.nextInt(threatSamples.length);
    return threatSamples[index];
  }
}
