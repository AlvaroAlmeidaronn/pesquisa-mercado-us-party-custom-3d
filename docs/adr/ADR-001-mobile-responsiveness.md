# ADR: Responsividade mobile da landing Pet Likeness

- Status: proposed
- Data: 2026-08-24

### Para o Álvaro (gestor)
- Pedido: saber se o site no telemóvel está perfeito (UI + UX) e, com arch/ship/loop, corrigir o que faltar
- Resultado vs objetivo: **não bate** — não está perfeito; há base responsiva, mas gaps reais de conversão no telemóvel
- Os 3 selos (separados): Entrega (`SHIPPED` após ship) · Fecho (`FECHO_OK` não — Goals MISSING) · Mundo real (`PROD_IO_AUTH: nao`)
- Residual / risco: sem Goals confirmed; sem eye-test em iPhone/Android físico; imagens geradas ≠ foto de produto real
- O que preciso de ti: decidir se aceitas o critério “mobile ok” abaixo (sim/não); opcionalmente abrir a página no teu telemóvel
- Perguntas sim/não:
  - Q1: Aceitas “mobile ok” = sem scroll horizontal em 375/390, CTA do close acima da barra, alvos ≥44px, safe-area iOS? (proposto: sim)
  - Q2: Queres Goals de negócio confirmados agora via truth, ou seguir só com VISUAL_DRAFT? (proposto: seguir draft neste ship)

## Contexto
A landing já tem breakpoints, `mobile-bar` e clearance no footer. Devil (BO/Verdade/Simplicidade) mostrou que “perfeito” é claim falso: Goals MISSING, clearance incompleto no `#close`, chrome da topbar aperta o viewport, e 375px emulado ≠ device real.

## Decisão
Tratar mobile como **hipótese falsificável**, não como perfeição. Um contrato CSS: `--mobile-bar-offset` + safe-area + alívio de topbar + tap targets. Sem redesign, sem framework.

## Alternativas rejeitadas
1. Redesenhar mobile-first completo — scope creep; eng. reversa mostra que o layout já serve com patches.
2. Declarar “perfeito” só porque há `mobile-bar` — desonesto face ao devil merge.

## Invariantes
- 1 CTA WhatsApp primário por momento de decisão
- Abrigo Sereno / Cool Paper via `data-palette`
- Sem SVG decorativo de produto
- `PROD_IO_AUTH: nao` (número WA placeholder)

## Não muda (fora de escopo)
- Redesign tipográfico, nova IA de imagens, backend, auth, pagamento, Goals confirmed (salvo truth futuro)

## Advogado do diabo (subagents)
- Lens-BO: close CTA pode ficar sob a barra → clearance no `#close` / `--mobile-bar-offset`
- Lens-Verdade: “perfeito” sem Goals/device real → label DRAFT_AUDIT + residual `no_real_device_eye_test`
- Lens-Simplicidade: 4 bandaids → 1 variável `--mobile-bar-offset` + consumidores

## Plano de verificação (ship)
```bash
tests/verify-landing-media.sh
# + checks CSS: --mobile-bar-offset, safe-area, close padding, status-badge hide
python3 -m http.server 8765  # smoke 390×844
```

## Riscos top 3
1. Safe-area mal calibrada em notch → mitigar com `env(safe-area-inset-*)`
2. Barra esconde CTA → padding no `.close` e no `body` mobile
3. Falsa confiança pós-emulação → residual explícito device real
