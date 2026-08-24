# Visual Spec — Landing MVP Pet Likeness

**Status:** `VISUAL_DRAFT` + `DISSENT_OPEN`  
**Marcador:** `VISUAL_DESIGN_PROTOCOL`  
**Modo:** QUICK (Composition + Surface + Critique)

### VISUAL_NE_SHIP
`VISUAL_*` ≠ `DESIGN_APPROVED` (S4) ≠ `FECHO_OK` ≠ `SHIPPED`.  
Spec + HTML de estudo — **não** é design pronto nem autorização de produção.

### Budget banner
- Modo: **QUICK**
- Tasks: **N=3** (Composition, Surface, Critique) · crossfire=0
- Intent: lido no BIND (não fanout)

---

## Como pesquisa + copy influenciam o design

| Insight da pesquisa/council | O que o design faz |
|----------------------------|--------------------|
| Job = “é o *meu* pet” / guardar | Hero emocional quente (afiliação), não lab de tecnologia |
| Medo = “não vai parecer” | Prévia como prova visual; secção “The real worry” com ar limpo |
| Bolo ≠ maior mercado; mecanismo = centro | Headline = foto→prévia; bolo só em “Where it shows up” |
| 1 CTA WhatsApp | Sem chrome de marketplace (grid, filtros, preços em strip) |
| Não vender “3D” | Zero ícones de impressora / wireframe no hero |

**Copy + design juntos:** a tipografia e a cor aquecem o System1; a hierarquia entrega o mecanismo; o botão único transforma emoção em conversa (WhatsApp).

---

## Kernel (Design)

- **Diagnóstico:** Uma landing de conversão (não loja). Risco = parecer marketplace genérico ou AI-slop.
- **Diretriz visual (v2 anti-slop):** **Ink Polaroid Workshop** — papel frio + ink verde-preto + laranja hue~20 + Syne/Newsreader; brand **Pet Likeness**; hero assimétrico 5fr/3fr; polaroid tilt; **sem** fade-up-on-scroll. Ver `ANTI-SLOP-RESEARCH.md`.
- **Estrutura:** Hero → How it works → Where it shows up → What you get → The real worry → FAQ → Close → Footer.

### Tokens / Surface
Ver `styles.css` (`:root`). Paleta tipada Cool Paper Warmth: paper/paper-2/polaroid/shot · ink/ink-soft/muted · accent/accent-deep/**accent-btn**/accent-btn-hover/on-accent/wash-amber/glow-amber · sage/sage-soft/wash-sage/hand/hand-2 · fig/fig-deep · line/focus/shadow-*. Tipografia: Syne display · Newsreader body · **Fraunces** detail (`--font-detail`). CTA usa accent-btn (contraste AA). Anti-slop: purple **pass** · cream+#terracotta **pass** (bg ≠ `#F4F1EA`, accent brass) · broadsheet **pass**.

### Motion / A11y
MotionA11y **N/A** (não fanout). Implementação leve: fade-up das secções, soft hero wash, hover CTA; `prefers-reduced-motion: reduce` desliga.

### Por câmara

| Câmara | Rodou? | 1 insight | 1 movimento |
|--------|--------|-----------|-------------|
| Intent | N/A (BIND) | Job = emoção→1 CTA WA | — |
| Composition | sim | Viewport1 = 1 composição | Full-bleed + wire = copy map |
| Surface | sim | Soft Honey Belonging | Tokens + anti-slop |
| MotionA11y | N/A | — | — |
| Critique | sim | Ban marketplace chrome | Experimento brand test pós-HTML |

### Dissent / unresolved
| Ponto | Porquê |
|-------|--------|
| Nome **Pet Likeness** | ASSUMPTION — sem marca real |
| Foto de produto | Placeholder; `Obs_residual=yes` |
| Atmosfera Surface vs âncora Composition | Atmosfera *atrás* do produto, não no lugar |
| “Marketplace” no pedido do user | Critique: MVP = landing; catálogo fora do viewport1 |

### Nao-evidencia
Logo real · fotos reais · teste A/B · contraste medido em device · número WhatsApp real

### Kill / experimento
- Abortar se viewport1 parecer loja/grid ou tiver >1 CTA primário  
- Experimento: mobile 375px, cobrir nav — marca ainda óbvia? só WA?

### Ethics
`PROD_IO_AUTH: nao` · sem `DESIGN_APPROVED` auto-escrito

---

## Arquivos da implementação (MVP)

- `landing/index.html`
- `landing/styles.css`
- `landing/app.js`

Abrir `landing/index.html` no browser. Trocar `WHATSAPP_NUMBER` em `app.js`.
