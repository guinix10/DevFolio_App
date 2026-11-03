import 'package:flutter/material.dart';

import '../models/projeto.dart';
import '../theme/app_theme.dart';
import '../widgets/bloco_estatistica.dart';
import '../widgets/projeto_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _abrirProjeto(BuildContext context, Projeto projeto) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppTheme.superficieElevada,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.65,
        child: DetalhesProjeto(projeto: projeto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tecnologias = projetosPortfolio
        .expand((projeto) => projeto.tecnologias)
        .toSet();
    final destaques = projetosPortfolio.where((projeto) => projeto.destaque);
    final projetosFlutter = projetosPortfolio.where(
      (projeto) => projeto.tecnologias.contains('Flutter'),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final largura = constraints.maxWidth;
        final margem = largura < 500 ? 16.0 : 28.0;

        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(margem, 26, margem, 42),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: LayoutBuilder(
                builder: (context, area) {
                  final larguraConteudo = area.maxWidth;
                  final colunasMetricas = larguraConteudo >= 780 ? 4 : 2;
                  final colunasProjetos = larguraConteudo >= 670 ? 2 : 1;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _CabecalhoDashboard(),
                      const SizedBox(height: 24),
                      const _ResumoDashboard(),
                      const SizedBox(height: 28),
                      _TituloSecao(
                        titulo: 'Visão geral',
                        subtitulo: 'Indicadores calculados a partir dos projetos.',
                      ),
                      const SizedBox(height: 15),
                      GridView.count(
                        crossAxisCount: colunasMetricas,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 13,
                        mainAxisExtent: 162,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          BlocoEstatistica(
                            titulo: 'Projetos',
                            valor: '${projetosPortfolio.length}'.padLeft(2, '0'),
                            legenda: 'No portfólio',
                            icone: Icons.folder_open_rounded,
                            cor: AppTheme.azulClaro,
                          ),
                          BlocoEstatistica(
                            titulo: 'Tecnologias',
                            valor: '${tecnologias.length}'.padLeft(2, '0'),
                            legenda: 'Tecnologias listadas',
                            icone: Icons.code_rounded,
                            cor: AppTheme.verde,
                          ),
                          BlocoEstatistica(
                            titulo: 'Destaques',
                            valor: '${destaques.length}'.padLeft(2, '0'),
                            legenda: 'Projetos destacados',
                            icone: Icons.star_outline_rounded,
                            cor: const Color(0xFFFFCE73),
                          ),
                          BlocoEstatistica(
                            titulo: 'Flutter',
                            valor: '${projetosFlutter.length}'.padLeft(2, '0'),
                            legenda: 'Projeto com Flutter',
                            icone: Icons.phone_android_rounded,
                            cor: const Color(0xFFB39BFF),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const _TituloSecao(
                        titulo: 'Meus projetos',
                        subtitulo:
                            'Selecione um card para visualizar os detalhes.',
                      ),
                      const SizedBox(height: 15),
                      GridView.count(
                        crossAxisCount: colunasProjetos,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 273,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: projetosPortfolio
                            .map((projeto) => ProjetoCard(
                                  projeto: projeto,
                                  onTap: () => _abrirProjeto(context, projeto),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 28),
                      const Center(
                        child: Text(
                          'Projetos de estudo · Informações editáveis em lib/models/projeto.dart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.textoSecundario,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CabecalhoDashboard extends StatelessWidget {
  const _CabecalhoDashboard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MEU PORTFÓLIO  /  PROJETOS',
          style: TextStyle(
            color: AppTheme.azulClaro,
            fontWeight: FontWeight.w700,
            fontSize: 11,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 9),
        Text('Dashboard de projetos',
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 8),
        const Text(
          'Projetos acadêmicos e experiências práticas de desenvolvimento.',
          style: TextStyle(color: AppTheme.textoSecundario, fontSize: 14),
        ),
      ],
    );
  }
}

class _ResumoDashboard extends StatelessWidget {
  const _ResumoDashboard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF213B6D), Color(0xFF152135)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppTheme.azul.withValues(alpha: 0.3)),
      ),
      child: Wrap(
        spacing: 18,
        runSpacing: 14,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppTheme.azul.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.rocket_launch_outlined,
                color: AppTheme.azulClaro, size: 33),
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Da ideia ao código.',
                style: TextStyle(
                  color: AppTheme.texto,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Uma vitrine da minha evolução como desenvolvedor.',
                style: TextStyle(
                  color: AppTheme.textoSecundario,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TituloSecao extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const _TituloSecao({required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(subtitulo,
            style: const TextStyle(
                color: AppTheme.textoSecundario, fontSize: 12)),
      ],
    );
  }
}
