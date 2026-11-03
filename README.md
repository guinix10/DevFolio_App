DevFolio App
Portfólio responsivo criado com Flutter e Dart para o projeto final da disciplina de Programação para Dispositivos Móveis (PPDM), turma t2dev-t3.
Objetivo
Apresentar o perfil de um desenvolvedor, suas habilidades e seus projetos em uma interface que funcione em dispositivos móveis e no navegador.
Telas
- Perfil e crachá: avatar, apresentação, formação, gradiente, chips de habilidades e link para o GitHub (copiado para a área de transferência).
- Dashboard de projetos: métricas calculadas a partir da lista de projetos, grade responsiva de Cards, selos de destaque com Stack e Positioned, e detalhes exibidos ao tocar nos cards.
Tecnologias e recursos Flutter
Flutter, Dart, Material 3, ThemeData, CircleAvatar, LinearGradient, Wrap, Row, Column, Expanded, GridView.count, Card, Stack, Positioned, LayoutBuilder, NavigationBar e NavigationRail.
Estrutura do código
lib/
├── main.dart
├── screens/
│   ├── perfil_screen.dart
│   └── dashboard_screen.dart
├── widgets/
│   ├── perfil_card.dart
│   ├── skill_chip.dart
│   ├── bloco_estatistica.dart
│   └── projeto_card.dart
├── models/
│   └── projeto.dart
└── theme/
    └── app_theme.dart
Execução local
flutter pub get
flutter run -d web-server --web-port 8080
Se a porta 8080 estiver ocupada, troque por 8081.
Testes
dart format lib test
flutter analyze
flutter test
Como editar
Os dados de perfil e foto estão em lib/screens/perfil_screen.dart (DadosPerfil). Projetos e tecnologias estão em lib/models/projeto.dart (projetosPortfolio). A paleta está em lib/theme/app_theme.dart.
Capturas de tela
Inclua aqui as capturas reais do aplicativo rodando no servidor de sala, por exemplo:
- screenshots/perfil.png
- screenshots/dashboard.png
As capturas precisam ser feitas após a execução do app; este repositório não traz screenshots pré-fabricadas.

Referências
- Flutter — Building layouts
- Flutter — Adaptive & responsive design
- Flutter — ThemeData
- Flutter — Debugging layout issues
