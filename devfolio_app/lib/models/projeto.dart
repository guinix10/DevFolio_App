import 'package:flutter/material.dart';

/// Modelo de domínio, independente dos widgets de apresentação.
class Projeto {
  final String titulo;
  final String categoria;
  final String descricao;
  final String detalhes;
  final List<String> tecnologias;
  final String situacao;
  final IconData icone;
  final Color cor;
  final bool destaque;

  const Projeto({
    required this.titulo,
    required this.categoria,
    required this.descricao,
    required this.detalhes,
    required this.tecnologias,
    required this.situacao,
    required this.icone,
    required this.cor,
    this.destaque = false,
  });
}

/// Dados de demonstração baseados em projetos de estudo.
/// Personalize nomes e descrições para retratar apenas o que você realizou.
const List<Projeto> projetosPortfolio = [
  Projeto(
    titulo: 'FluidMES',
    categoria: 'Gestão industrial',
    descricao: 'Solução de apoio à gestão de pedidos e produção de líquidos.',
    detalhes: 'Projeto de TCC sobre Manufacturing Execution Systems (MES). '
        'Apresenta a gestão de pedidos e o acompanhamento da produção '
        'industrial com proposta de integração a equipamentos de automação.',
    tecnologias: ['React', 'Vite', 'MES'],
    situacao: 'Em desenvolvimento',
    icone: Icons.factory_outlined,
    cor: Color(0xFF5498FF),
    destaque: true,
  ),
  Projeto(
    titulo: 'RideWise',
    categoria: 'API e regras de negócio',
    descricao: 'Análise de corridas por custos, lucro e metas do motorista.',
    detalhes: 'Backend em Python e FastAPI que calcula métricas financeiras '
        'de corridas e as classifica em vantajosa, aceitável ou não '
        'recomendada conforme as metas definidas pelo motorista.',
    tecnologias: ['Python', 'FastAPI', 'Pytest'],
    situacao: 'Projeto acadêmico',
    icone: Icons.route_outlined,
    cor: Color(0xFF54D6BD),
    destaque: true,
  ),
  Projeto(
    titulo: 'DevFolio App',
    categoria: 'Aplicativo mobile / web',
    descricao: 'Portfólio pessoal responsivo, construído com Flutter.',
    detalhes: 'Projeto final de Programação para Dispositivos Móveis. '
        'Inclui perfil, chips de habilidades, métricas, grade de cards, '
        'componentização e layout adaptativo para celular e navegador.',
    tecnologias: ['Flutter', 'Dart'],
    situacao: 'Em desenvolvimento',
    icone: Icons.phone_android_outlined,
    cor: Color(0xFFAB8BFF),
  ),
  Projeto(
    titulo: 'Landing Page FluidMES',
    categoria: 'Interface web',
    descricao: 'Vitrine digital do sistema FluidMES para o mercado industrial.',
    detalhes: 'Landing page em React e Vite com foco em apresentação do '
        'produto, navegação por seções e experiência visual voltada '
        'para software B2B.',
    tecnologias: ['React', 'Vite', 'CSS'],
    situacao: 'Projeto acadêmico',
    icone: Icons.web_outlined,
    cor: Color(0xFFFFC477),
  ),
];
