# Power Junk Website - Arquivos Estáticos

Este diretório contém os arquivos HTML estáticos do site powerjunk.ca para uso local SEM WordPress.

## Estrutura de Arquivos

```
powerjunk-site/
├── index.html                  # Página inicial
├── junk-removal.html          # Página de remoção de lixo
├── bin-rentals.html           # Página de aluguel de caçambas
├── small-demolition.html      # Página de pequenas demolições
├── about-us.html              # Página sobre nós
├── contact.html               # Página de contato
├── wp-content/                # Recursos do WordPress (CSS, JS, imagens)
│   ├── themes/
│   ├── plugins/
│   └── uploads/
├── download_assets.bat        # Script para baixar recursos adicionais
└── fix_paths.sh              # Script que já foi executado para corrigir caminhos
```

## Status do Download

### ✅ Completo
- Todas as 6 páginas HTML baixadas
- Caminhos atualizados de absolutos para relativos
- Navegação entre páginas funcionando
- CSS principal (Astra theme)
- Imagens principais (home_01.png, home_03.png, home_04.png)
- Logo da empresa
- Ícones (box-truck, canada, shield, chat)
- Favicons

### ⚠️ Parcialmente Completo
Alguns recursos ainda apontam para URLs externas e podem não funcionar completamente offline:
- Alguns arquivos CSS do Elementor
- Alguns arquivos JavaScript
- Fontes do Google Fonts (requerem internet)
- Alguns plugins do WordPress

## Como Usar

### Opção 1: Abrir Diretamente no Navegador
1. Navegue até: `C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\`
2. Duplo-clique em `index.html`
3. O site abrirá no seu navegador padrão

### Opção 2: Servidor Local (Recomendado)
Para melhor funcionamento, use um servidor web local:

**Com Python 3:**
```bash
cd "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site"
python -m http.server 8000
```

**Com Node.js:**
```bash
npx http-server -p 8000
```

Depois acesse: http://localhost:8000

## Próximos Passos para Melhorar

Se você quiser baixar TODOS os recursos faltantes:

1. **Instale Python 3** (se ainda não tem)
2. **Execute o script melhorado de download** (você pode criar um script Python mais completo)
3. **Ou use ferramentas especializadas** como:
   - HTTrack Website Copier
   - wget (Linux/Mac)
   - WinHTTrack (Windows)

### Comando wget (se disponível):
```bash
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://powerjunk.ca/
```

## Limitações Conhecidas

1. **Fontes externas**: O site usa Google Fonts que requerem conexão com internet
2. **JavaScript externo**: Alguns recursos JS do WordPress podem não funcionar offline
3. **Formulários**: O Contact Form 7 não funcionará sem backend PHP/WordPress
4. **WhatsApp chat**: O widget do WhatsApp pode não funcionar completamente offline

## Arquivos de Backup

Os arquivos HTML originais foram salvos com extensão `.bak`:
- `index.html.bak`
- `junk-removal.html.bak`
- etc.

Você pode restaurá-los se necessário.

## Observações

- O site foi baixado em: 2026-02-13
- Site original: https://powerjunk.ca/
- Tema: Astra 4.11.18
- Page Builder: Elementor 3.35.0
