import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';
import 'screens/perfil_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DevFolioApp());
}

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.temaEscuro,
      home: const DevFolioHome(),
    );
  }
}

/// Navegação adaptativa: inferior em telas pequenas e lateral no desktop.
class DevFolioHome extends StatefulWidget {
  const DevFolioHome({super.key});

  @override
  State<DevFolioHome> createState() => _DevFolioHomeState();
}

class _DevFolioHomeState extends State<DevFolioHome> {
  int _paginaAtual = 0;

  void _navegar(int indice) {
    if (_paginaAtual == indice) return;
    setState(() => _paginaAtual = indice);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final desktop = constraints.maxWidth >= 900;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 68,
            titleSpacing: 20,
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Logomarca(),
                SizedBox(width: 11),
                Text(
                  'DevFolio',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  ' / app',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textoSecundario,
                  ),
                ),
              ],
            ),
            actions: [
              if (desktop)
                const Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Center(
                    child: Text(
                      'PORTFÓLIO DE DESENVOLVEDOR',
                      style: TextStyle(
                        color: AppTheme.textoSecundario,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(height: 1, color: AppTheme.borda),
            ),
          ),
          body: Row(
            children: [
              if (desktop) ...[
                NavigationRail(
                  backgroundColor: AppTheme.superficie,
                  indicatorColor: AppTheme.azul.withValues(alpha: 0.22),
                  selectedIndex: _paginaAtual,
                  onDestinationSelected: _navegar,
                  labelType: NavigationRailLabelType.all,
                  minWidth: 86,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline_rounded),
                      selectedIcon: Icon(Icons.person_rounded),
                      label: Text('Perfil'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.dashboard_outlined),
                      selectedIcon: Icon(Icons.dashboard_rounded),
                      label: Text('Projetos'),
                    ),
                  ],
                ),
                const VerticalDivider(width: 1, color: AppTheme.borda),
              ],
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  child: _paginaAtual == 0
                      ? PerfilScreen(
                          key: const ValueKey('perfil'),
                          onVerProjetos: () => _navegar(1),
                        )
                      : const DashboardScreen(key: ValueKey('dashboard')),
                ),
              ),
            ],
          ),
          bottomNavigationBar: desktop
              ? null
              : NavigationBar(
                  height: 70,
                  selectedIndex: _paginaAtual,
                  onDestinationSelected: _navegar,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.person_outline_rounded),
                      selectedIcon: Icon(Icons.person_rounded),
                      label: 'Perfil',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.dashboard_outlined),
                      selectedIcon: Icon(Icons.dashboard_rounded),
                      label: 'Projetos',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _Logomarca extends StatelessWidget {
  const _Logomarca();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 37,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.azul, Color(0xFF66C8FF)],
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: const Center(
        child: Text(
          '</>',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
