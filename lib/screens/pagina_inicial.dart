import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/monitoring_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detecção de Ameaças Cibernéticas'),
      ),
      body: Column(
        children: [
          // Seção de Controle do Monitoramento
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<MonitoringState>(
              builder: (context, monitoringState, child) {
                return Column(
                  children: [
                    Text(
                      monitoringState.isMonitoring
                          ? 'Monitoramento Ativo'
                          : 'Monitoramento Inativo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        monitoringState.isMonitoring
                            ? monitoringState.stopMonitoring()
                            : monitoringState.startMonitoring();
                      },
                      child: Text(
                        monitoringState.isMonitoring
                            ? 'Parar Monitoramento'
                            : 'Iniciar Monitoramento',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(),
          // Lista de Atividades Suspeitas
          Expanded(
            child: Consumer<MonitoringState>(
              builder: (context, monitoringState, child) {
                return ListView.builder(
                  itemCount: monitoringState.suspiciousActivities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.warning, color: Colors.red),
                      title: Text(monitoringState.suspiciousActivities[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
