import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';
import '../widgets/perfil_card.dart';
import '../widgets/skill_chip.dart';

/// EDITE AQUI para personalizar seu portfólio.
/// A URL usa a imagem pública de perfil do GitHub e pode ser substituída.
class DadosPerfil {
  DadosPerfil._();

  static const String nome = 'Rafael Pinto';
  static const String ocupacao = 'Desenvolvedor de Software em formação';
  static const String localizacao = 'São Paulo · Brasil';
  static const String github = 'https://github.com/EoPsyco22';
  static const String fotoUrl = 'https://github.com/EoPsyco22.png';
  static const String resumo =
      'Estudante de Desenvolvimento de Sistemas, apaixonado por criar '
      'soluções úteis. Tenho experiência acadêmica com Python, Flutter, '
      'desenvolvimento web e APIs. Busco minha primeira oportunidade '
      'profissional na área de tecnologia.';
}

class PerfilScreen extends StatelessWidget {
  final VoidCallback onVerProjetos;

  const PerfilScreen({super.key, required this.onVerProjetos});

  Future<void> _copiarGitHub(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: DadosPerfil.github));
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Link do GitHub copiado para a área de transferência.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final largura = constraints.maxWidth;
        final paginaLarga = largura >= 880;
        final margem = largura < 500 ? 16.0 : 28.0;

        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(margem, 26, margem, 40),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _CabecalhoPerfil(),
                  const SizedBox(height: 24),
                  PerfilCard(
                    nome: DadosPerfil.nome,
                    ocupacao: DadosPerfil.ocupacao,
                    localizacao: DadosPerfil.localizacao,
                    resumo: DadosPerfil.resumo,
                    fotoUrl: DadosPerfil.fotoUrl,
                    onVerProjetos: onVerProjetos,
                    onCopiarGithub: () => _copiarGitHub(context),
                  ),
                  const SizedBox(height: 24),
                  if (paginaLarga)
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: _Habilidades()),
                        SizedBox(width: 20),
                        Expanded(flex: 2, child: _SobreMim()),
                      ],
                    )
                  else
                    const Column(
                      children: [
                        _Habilidades(),
                        SizedBox(height: 20),
                        _SobreMim(),
                      ],
                    ),
                  const SizedBox(height: 20),
                  const _RodapePerfil(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CabecalhoPerfil extends StatelessWidget {
  const _CabecalhoPerfil();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MEU PORTFÓLIO  /  APRESENTAÇÃO',
          style: TextStyle(
            color: AppTheme.azulClaro,
            fontWeight: FontWeight.w700,
            fontSize: 11,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 9),
        Text('Olá, seja bem-vindo!',
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 8),
        const Text(
          'Conheça meu perfil, minha trajetória e as tecnologias que estudo.',
          style: TextStyle(color: AppTheme.textoSecundario, fontSize: 14),
        ),
      ],
    );
  }
}

class _Habilidades extends StatelessWidget {
  const _Habilidades();

  @override
  Widget build(BuildContext context) {
    const habilidades = <({String nome, IconData icone})>[
      (nome: 'Python', icone: Icons.terminal_rounded),
      (nome: 'JavaScript', icone: Icons.code_rounded),
      (nome: 'HTML', icone: Icons.language_rounded),
      (nome: 'CSS', icone: Icons.palette_outlined),
      (nome: 'SQL', icone: Icons.storage_outlined),
      (nome: 'Flutter', icone: Icons.phone_iphone_rounded),
      (nome: 'Dart', icone: Icons.data_object_rounded),
      (nome: 'Git / GitHub', icone: Icons.hub_outlined),
    ];

    return _Painel(
      titulo: 'Stack & habilidades',
      subtitulo: 'Ferramentas utilizadas nos estudos e projetos.',
      icone: Icons.auto_awesome_outlined,
      conteudo: Wrap(
        spacing: 9,
        runSpacing: 10,
        children: habilidades
            .map((habilidade) => SkillChip(
                  rotulo: habilidade.nome,
                  icone: habilidade.icone,
                ))
            .toList(),
      ),
    );
  }
}

class _SobreMim extends StatelessWidget {
  const _SobreMim();

  @override
  Widget build(BuildContext context) {
    return _Painel(
      titulo: 'Sobre mim',
      subtitulo: 'O que me motiva a desenvolver.',
      icone: Icons.person_outline_rounded,
      conteudo: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sou estudante do curso técnico em Desenvolvimento de Sistemas. '
            'Valorizo o trabalho em equipe, a organização e a evolução '
            'constante das minhas habilidades.',
            style: TextStyle(
              color: AppTheme.textoSecundario,
              height: 1.55,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.school_outlined, color: AppTheme.verde, size: 19),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Técnico em Desenvolvimento de Sistemas · 2026',
                  style: TextStyle(color: AppTheme.texto, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.security_outlined, color: AppTheme.verde, size: 19),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Interesse futuro em cibersegurança',
                  style: TextStyle(color: AppTheme.texto, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Painel extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icone;
  final Widget conteudo;

  const _Painel({
    required this.titulo,
    required this.subtitulo,
    required this.icone,
    required this.conteudo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icone, color: AppTheme.azulClaro, size: 21),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    titulo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(subtitulo,
                style: const TextStyle(
                    color: AppTheme.textoSecundario, fontSize: 12)),
            const SizedBox(height: 19),
            conteudo,
          ],
        ),
      ),
    );
  }
}

class _RodapePerfil extends StatelessWidget {
  const _RodapePerfil();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'DevFolio App  ·  Desenvolvido com Flutter & Dart',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppTheme.textoSecundario, fontSize: 11),
        ),
      ),
    );
  }
}
