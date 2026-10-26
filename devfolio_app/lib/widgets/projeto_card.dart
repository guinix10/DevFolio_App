import 'package:flutter/material.dart';

import '../models/projeto.dart';
import '../theme/app_theme.dart';
import 'skill_chip.dart';

/// Card reutilizável com Stack + Positioned para o selo de destaque.
class ProjetoCard extends StatelessWidget {
  final Projeto projeto;
  final VoidCallback onTap;

  const ProjetoCard({
    super.key,
    required this.projeto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: projeto.cor.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(projeto.icone, color: projeto.cor, size: 24),
                    ),
                    const SizedBox(height: 13),
                    Text(
                      projeto.categoria.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: projeto.cor,
                        fontSize: 10,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      projeto.titulo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppTheme.texto,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      projeto.descricao,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppTheme.textoSecundario,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            projeto.situacao,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppTheme.textoSecundario,
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 19,
                          color: AppTheme.azulClaro,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (projeto.destaque)
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.azul,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star_rounded, color: Colors.white, size: 13),
                      SizedBox(width: 4),
                      Text(
                        'Destaque',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Conteúdo do modal aberto ao tocar em um projeto.
class DetalhesProjeto extends StatelessWidget {
  final Projeto projeto;

  const DetalhesProjeto({super.key, required this.projeto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 26),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(projeto.icone, color: projeto.cor, size: 30),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      projeto.titulo,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Fechar detalhes',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(projeto.detalhes, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 22),
              const Text(
                'Tecnologias utilizadas',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.texto,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: projeto.tecnologias
                    .map((tecnologia) => SkillChip(
                          rotulo: tecnologia,
                          compacto: true,
                          cor: projeto.cor,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 18),
              Text('Situação: ${projeto.situacao}',
                  style: const TextStyle(color: AppTheme.textoSecundario)),
            ],
          ),
        ),
      ),
    );
  }
}
