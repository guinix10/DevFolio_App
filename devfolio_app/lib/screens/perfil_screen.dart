
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';
import '../widgets/perfil_card.dart';
import '../widgets/skill_chip.dart';

/// Dados individuais de cada perfil.
class DadosPerfil {
  final String nome;
  final String ocupacao;
  final String localizacao;
  final String github;
  final String fotoUrl;
  final String resumo;
  final String sobre;
  final String formacao;
  final String interesse;
  final List<({String nome, IconData icone})> habilidades;

  const DadosPerfil({
    required this.nome,
    required this.ocupacao,
    required this.localizacao,
    required this.github,
    required this.fotoUrl,
    required this.resumo,
    required this.sobre,
    required this.formacao,
    required this.interesse,
    required this.habilidades,
  });

  /// Perfil do Rafael.
  static const rafael = DadosPerfil(
    nome: 'Rafael Pinto',
    ocupacao: 'Desenvolvedor de Software em formação',
    localizacao: 'São Paulo · Brasil',
    github: 'https://github.com/EoPsyco22',
    fotoUrl: 'assets/images/rafael.png',
    resumo:
        'Estudante de Desenvolvimento de Sistemas, apaixonado por criar '
        'soluções úteis. Tenho experiência acadêmica com Python, Flutter, '
        'desenvolvimento web e APIs. Busco minha primeira oportunidade '
        'profissional na área de tecnologia.',
    sobre:
        'Sou estudante do curso técnico em Desenvolvimento de Sistemas. '
        'Valorizo o trabalho em equipe, a organização e a evolução '
        'constante das minhas habilidades.',
    formacao: 'Técnico em Desenvolvimento de Sistemas · 2026',
    interesse: 'Interesse futuro em cibersegurança',
    habilidades: [
      (nome: 'Python', icone: Icons.terminal_rounded),
      (nome: 'JavaScript', icone: Icons.code_rounded),
      (nome: 'HTML', icone: Icons.language_rounded),
      (nome: 'CSS', icone: Icons.palette_outlined),
      (nome: 'SQL', icone: Icons.storage_outlined),
      (nome: 'Flutter', icone: Icons.phone_iphone_rounded),
      (nome: 'Dart', icone: Icons.data_object_rounded),
      (nome: 'Git / GitHub', icone: Icons.hub_outlined),
    ],
  );

  /// Perfil do Guilherme.
  static const guilherme = DadosPerfil(
    nome: 'Guilherme Monteiro Lima',
    ocupacao: 'Desenvolvedor Full Stack em formação',
    localizacao: 'Mauá · São Paulo',
    github: 'https://github.com/SEU_USUARIO',
    fotoUrl: 'assets/images/guilherme.png',
    resumo:
        'Estudante de Desenvolvimento de Sistemas, interessado em '
        'tecnologia e inovação. Tenho interesse na criação de '
        'aplicações web, desenvolvimento de sistemas e soluções '
        'digitais. Busco evoluir meus conhecimentos por meio de '
        'projetos práticos e novos desafios.',
    sobre:
        'Gosto de explorar novas tecnologias e transformar ideias '
        'em projetos funcionais. Tenho interesse em desenvolvimento '
        'de aplicações, interfaces modernas e soluções que facilitem '
        'o dia a dia das pessoas.',
    formacao: 'Técnico em Desenvolvimento de Sistemas · 2026',
    interesse: 'Interesse em desenvolvimento Full Stack',
    habilidades: [
      (nome: 'HTML5', icone: Icons.language_rounded),
      (nome: 'CSS3', icone: Icons.palette_outlined),
      (nome: 'JavaScript', icone: Icons.code_rounded),
      (nome: 'Python', icone: Icons.terminal_rounded),
      (nome: 'PHP', icone: Icons.php_rounded),
      (nome: 'MySQL', icone: Icons.storage_rounded),
      (nome: 'Git', icone: Icons.hub_outlined),
      (nome: 'Flutter', icone: Icons.phone_android_rounded),
    ],
  );
}

/// Tela principal dos perfis.
class PerfilScreen extends StatefulWidget {
  final VoidCallback onVerProjetos;

  const PerfilScreen({
    super.key,
    required this.onVerProjetos,
  });

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  DadosPerfil perfilAtual = DadosPerfil.rafael;

  /// Copia o GitHub do perfil selecionado.
  Future<void> _copiarGitHub(BuildContext context) async {
    await Clipboard.setData(
      ClipboardData(text: perfilAtual.github),
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Link do GitHub copiado para a área de transferência.',
        ),
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

                  const SizedBox(height: 20),

                  /// Botões para alternar entre os perfis.
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ChoiceChip(
                        label: const Text('Rafael Pinto'),
                        selected: perfilAtual.nome == 'Rafael Pinto',
                        onSelected: (_) {
                          setState(() {
                            perfilAtual = DadosPerfil.rafael;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Guilherme Monteiro Lima'),
                        selected:
                            perfilAtual.nome ==
                                'Guilherme Monteiro Lima',
                        onSelected: (_) {
                          setState(() {
                            perfilAtual = DadosPerfil.guilherme;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// Cartão do perfil selecionado.
                  PerfilCard(
                    nome: perfilAtual.nome,
                    ocupacao: perfilAtual.ocupacao,
                    localizacao: perfilAtual.localizacao,
                    resumo: perfilAtual.resumo,
                    fotoUrl: perfilAtual.fotoUrl,
                    onVerProjetos: widget.onVerProjetos,
                    onCopiarGithub: () => _copiarGitHub(context),
                  ),

                  const SizedBox(height: 24),

                  /// Habilidades e informações individuais.
                  if (paginaLarga)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _Habilidades(
                            habilidades: perfilAtual.habilidades,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: _SobreMim(
                            perfil: perfilAtual,
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        _Habilidades(
                          habilidades: perfilAtual.habilidades,
                        ),
                        const SizedBox(height: 20),
                        _SobreMim(
                          perfil: perfilAtual,
                        ),
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

/// Cabeçalho.
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
        Text(
          'Olá, seja bem-vindo!',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        const Text(
          'Conheça meu perfil, minha trajetória e as tecnologias que estudo.',
          style: TextStyle(
            color: AppTheme.textoSecundario,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

/// Habilidades de cada desenvolvedor.
class _Habilidades extends StatelessWidget {
  final List<({String nome, IconData icone})> habilidades;

  const _Habilidades({
    required this.habilidades,
  });

  @override
  Widget build(BuildContext context) {
    return _Painel(
      titulo: 'Stack & habilidades',
      subtitulo: 'Ferramentas utilizadas nos estudos e projetos.',
      icone: Icons.auto_awesome_outlined,
      conteudo: Wrap(
        spacing: 9,
        runSpacing: 10,
        children: habilidades
            .map(
              (habilidade) => SkillChip(
                rotulo: habilidade.nome,
                icone: habilidade.icone,
              ),
            )
            .toList(),
      ),
    );
  }
}

/// Informações individuais de cada perfil.
class _SobreMim extends StatelessWidget {
  final DadosPerfil perfil;

  const _SobreMim({
    required this.perfil,
  });

  @override
  Widget build(BuildContext context) {
    return _Painel(
      titulo: 'Sobre mim',
      subtitulo: 'O que me motiva a desenvolver.',
      icone: Icons.person_outline_rounded,
      conteudo: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            perfil.sobre,
            style: const TextStyle(
              color: AppTheme.textoSecundario,
              height: 1.55,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(
                Icons.school_outlined,
                color: AppTheme.verde,
                size: 19,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  perfil.formacao,
                  style: const TextStyle(
                    color: AppTheme.texto,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.code_rounded,
                color: AppTheme.verde,
                size: 19,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  perfil.interesse,
                  style: const TextStyle(
                    color: AppTheme.texto,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Painel reutilizável.
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
                Icon(
                  icone,
                  color: AppTheme.azulClaro,
                  size: 21,
                ),
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
            Text(
              subtitulo,
              style: const TextStyle(
                color: AppTheme.textoSecundario,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 19),
            conteudo,
          ],
        ),
      ),
    );
  }
}

/// Rodapé.
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
          style: TextStyle(
            color: AppTheme.textoSecundario,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
