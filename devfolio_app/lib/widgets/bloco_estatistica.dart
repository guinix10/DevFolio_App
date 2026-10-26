import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Bloco de métrica utilizado dentro de um GridView.count.
class BlocoEstatistica extends StatelessWidget {
  final String titulo;
  final String valor;
  final String legenda;
  final IconData icone;
  final Color cor;

  const BlocoEstatistica({
    super.key,
    required this.titulo,
    required this.valor,
    required this.legenda,
    required this.icone,
    this.cor = AppTheme.azul,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: cor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icone, color: cor, size: 20),
                ),
                Icon(
                  Icons.north_east_rounded,
                  size: 15,
                  color: AppTheme.textoSecundario.withValues(alpha: 0.7),
                ),
              ],
            ),
            const Spacer(),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 29,
                height: 1,
                fontWeight: FontWeight.w800,
                color: AppTheme.texto,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              titulo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppTheme.texto,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              legenda,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppTheme.textoSecundario,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
