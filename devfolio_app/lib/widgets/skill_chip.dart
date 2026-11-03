import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Chip reutilizável para habilidades e tecnologias.
class SkillChip extends StatelessWidget {
  final String rotulo;
  final IconData? icone;
  final Color? cor;
  final bool compacto;

  const SkillChip({
    super.key,
    required this.rotulo,
    this.icone,
    this.cor,
    this.compacto = false,
  });

  @override
  Widget build(BuildContext context) {
    final destaque = cor ?? AppTheme.azul;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compacto ? 10 : 13,
        vertical: compacto ? 6 : 9,
      ),
      decoration: BoxDecoration(
        color: destaque.withValues(alpha: 0.10),
        border: Border.all(color: destaque.withValues(alpha: 0.28)),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icone != null) ...[
            Icon(icone, size: compacto ? 13 : 16, color: destaque),
            const SizedBox(width: 7),
          ],
          Text(
            rotulo,
            style: TextStyle(
              color: AppTheme.texto,
              fontSize: compacto ? 11 : 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
