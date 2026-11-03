import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Crachá principal, com avatar, gradiente, botões e dados do aluno.
class PerfilCard extends StatelessWidget {
  final String nome;
  final String ocupacao;
  final String localizacao;
  final String resumo;
  final String fotoUrl;
  final VoidCallback onVerProjetos;
  final VoidCallback onCopiarGithub;

  const PerfilCard({
    super.key,
    required this.nome,
    required this.ocupacao,
    required this.localizacao,
    required this.resumo,
    required this.fotoUrl,
    required this.onVerProjetos,
    required this.onCopiarGithub,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF223D72), Color(0xFF162339), Color(0xFF141D2B)],
          stops: [0, 0.55, 1],
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppTheme.azul.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.azul.withValues(alpha: 0.10),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final pequeno = constraints.maxWidth < 480;

              if (pequeno) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Avatar(nome: nome, fotoUrl: fotoUrl, raio: 45),
                    const SizedBox(height: 18),
                    _Identificacao(
                      nome: nome,
                      ocupacao: ocupacao,
                      localizacao: localizacao,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _Avatar(nome: nome, fotoUrl: fotoUrl, raio: 51),
                  const SizedBox(width: 22),
                  Expanded(
                    child: _Identificacao(
                      nome: nome,
                      ocupacao: ocupacao,
                      localizacao: localizacao,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 22),
          const Divider(color: Color(0x553F6DAC)),
          const SizedBox(height: 12),
          Text(
            resumo,
            style: const TextStyle(
              color: Color(0xFFDFE9F8),
              fontSize: 14,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 23),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: onVerProjetos,
                icon: const Icon(Icons.grid_view_rounded, size: 19),
                label: const Text('Ver meus projetos'),
              ),
              OutlinedButton.icon(
                onPressed: onCopiarGithub,
                icon: const Icon(Icons.content_copy_rounded, size: 17),
                label: const Text('Copiar GitHub'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String nome;
  final String fotoUrl;
  final double raio;

  const _Avatar({
    required this.nome,
    required this.fotoUrl,
    required this.raio,
  });

  @override
  Widget build(BuildContext context) {
    final partes = nome.trim().split(RegExp(r'\s+'));
    final iniciais = partes.isEmpty
        ? 'DEV'
        : '${partes.first[0]}${partes.length > 1 ? partes.last[0] : ''}'
            .toUpperCase();

    Widget avatarPadrao() => Center(
          child: Text(
            iniciais,
            style: TextStyle(
              fontSize: raio * 0.42,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        );

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.azulClaro, width: 2),
      ),
      child: CircleAvatar(
        radius: raio,
        backgroundColor: AppTheme.azul,
        child: ClipOval(
          child: fotoUrl.trim().isEmpty
              ? avatarPadrao()
              : Image.network(
                  fotoUrl,
                  width: raio * 2,
                  height: raio * 2,
                  fit: BoxFit.cover,
                  errorBuilder: (context, erro, stackTrace) => avatarPadrao(),
                ),
        ),
      ),
    );
  }
}

class _Identificacao extends StatelessWidget {
  final String nome;
  final String ocupacao;
  final String localizacao;

  const _Identificacao({
    required this.nome,
    required this.ocupacao,
    required this.localizacao,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.verde.withValues(alpha: 0.13),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppTheme.verde.withValues(alpha: 0.38)),
          ),
          child: const Text(
            'DISPONÍVEL PARA OPORTUNIDADES',
            style: TextStyle(
              color: AppTheme.verde,
              fontWeight: FontWeight.w700,
              fontSize: 10,
              letterSpacing: 0.6,
            ),
          ),
        ),
        const SizedBox(height: 11),
        Text(
          nome,
          style: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width < 400 ? 25 : 30,
            fontWeight: FontWeight.w800,
            height: 1.12,
            color: AppTheme.texto,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          ocupacao,
          style: const TextStyle(
            color: AppTheme.azulClaro,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 15,
              color: AppTheme.textoSecundario,
            ),
            const SizedBox(width: 4),
            Text(
              localizacao,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppTheme.textoSecundario,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
