# Anti-slop — o que seniores fazem (pesquisa → aplicação)

**Fontes principais (2025–2026):**
- https://sailop.com/blog/from-ai-slop-to-signature-73-patterns-2026
- https://sailop.com/blog/how-to-make-ai-website-look-unique
- https://sailop.com/blog/anti-slop-manifesto-73-rules-for-unique-design
- https://sailop.com/blog/complete-guide-anti-ai-design-2026
- https://vibecodekit.dev/ai-slop-design
- https://www.925studios.co/blog/ai-slop-web-design-guide
- https://lucky.graphics/learn/anti-ai-design-aesthetic-2026/

## Diagnóstico do nosso MVP (por que “parecia IA”)

| Sinal clássico de slop | Estava no site? |
|------------------------|-----------------|
| Fade-up em **toda** secção no scroll | Sim (`.reveal`) |
| Atmosfera quente genérica “gift brand” + serif soft | Sim (Soft Honey) |
| `backdrop-blur` no header sticky | Sim |
| Ritmo de gap uniforme | Sim |
| Hero simétrico / placeholder plástico | Sim (SVG dog) |
| Mesmo `border-radius` em tudo | Quase |
| Motion `ease` genérico / hue-rotate no fundo | Sim |

Regra Sailop: **1 eixo não basta** — precisa mudar 8–12 decisões juntas para sair do “centro estatístico”.

## O que seniores fazem (checklist curto)

1. **Travar um DESIGN.md / direção nomeada** antes de estilizar (não “deixar bonito”).
2. **Tipografia com opinião** — pairing display+body, tracking óptico no H1, pesos reais (não só 400/600).
3. **Cor fora do centro** — evitar faixa hue 200–290 (azul-roxo) **e** o cluster “cream + serif + terracotta”.
4. **Layout assimétrico** (`5fr 3fr`), não grid 3 cards iguais.
5. **Espaço com ritmo** — largo entre secções, apertado dentro.
6. **Dois raios que discordam** — botão ≠ mídia/container.
7. **Matar fade-up-on-scroll** — 1 sequência de load no hero, ou nada.
8. **Craft signals:** `::selection`, `:focus-visible`, grain/papel, underline editorial, overlap.
9. **Imagem específica** > ilustração genérica “lisa demais”.
10. **Menos chrome, mais decisão** — Linear/Stripe destacam por restrição, não por efeitos.

## Nova direção deste projeto

**Ink Polaroid Workshop** — studio de foto/atelier (tinta verde-preta + laranja “hue ~20” + papel frio), não “loja fofa de pet gift”.

Aplicado em `landing/` nesta rodada.
