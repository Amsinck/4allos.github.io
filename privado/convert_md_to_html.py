# ================================
# SCRIPT: convert_md_to_html.py
# CAMINHO SUGERIDO: C:\4All_OS\privado\
# PROPÓSITO:
#   Converte arquivos Markdown (.md) para HTML
#   Utiliza um layout padrão com cabeçalho e rodapé institucional
#   Aplica um CSS limpo e responsivo, com botão de navegação
#
# COMPATIBILIDADE:
#   - Windows 7/10/11
#   - Python 3.8+
#
# DEPENDÊNCIAS:
#   pip install markdown
#
# MANTENEDOR:
#   Fundação 4All_OS - admin.4allos@proton.me
# ================================

import os
import markdown
import sys

# ================================
# CONFIGURAÇÕES GLOBAIS
# ================================

# Rodapé institucional padrão (inserido em cada HTML)
FOOTER_HTML = """
<footer>
  <hr>
  <p><strong>4All_OS Foundation</strong> — Project: <strong>4All_OS</strong></p>
  <p>Contact: <a href="mailto:admin.4allos@proton.me">admin.4allos@proton.me</a></p>
  <p>Session ID: <code>05d1c3f1a70cb80bf4d46f3b6bd63b2d27b0d08e331bf509eb6f9938021ca59e0</code></p>
</footer>
"""

# Função para envolver conteúdo HTML num layout padrão
def wrap_html(content, title):
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{title} - 4All_OS</title>
  <style>
    body {{
      font-family: 'Segoe UI', Arial, sans-serif;
      background: #f9f9f9;
      color: #333;
      padding: 30px;
      line-height: 1.6;
      max-width: 900px;
      margin: auto;
    }}
    h1, h2, h3 {{
      color: #1a73e8;
    }}
    a {{
      color: #1a73e8;
      text-decoration: none;
    }}
    a:hover {{
      text-decoration: underline;
    }}
    .back {{
      display: inline-block;
      margin: 20px 0;
      padding: 8px 16px;
      background: #1a73e8;
      color: white;
      border-radius: 5px;
      text-decoration: none;
    }}
    footer {{
      margin-top: 40px;
      font-size: 0.85em;
      color: #555;
    }}
    footer hr {{
      margin: 30px 0;
    }}
  </style>
</head>
<body>
  <a class="back" href="../index.html">← Voltar ao Índice</a>
  {content}
  {FOOTER_HTML}
</body>
</html>
"""

# ================================
# FUNÇÃO PRINCIPAL DE CONVERSÃO
# ================================

def convert_all_markdown_files():
    # Identifica pastas de idioma (en, pt, es, etc.)
    lang_dirs = [
        d for d in os.listdir()
        if os.path.isdir(d) and not d.startswith('.') and d not in ['__pycache__']
    ]

    print("Pastas de idioma detectadas:", lang_dirs)
    total_convertidos = 0

    for lang in lang_dirs:
        for file in os.listdir(lang):
            if file.endswith(".md"):
                md_path = os.path.join(lang, file)
                html_path = os.path.join(lang, file.replace(".md", ".html"))

                try:
                    with open(md_path, "r", encoding="utf-8") as f:
                        md_content = f.read()

                    html_content = markdown.markdown(md_content, extensions=['fenced_code', 'tables'])
                    full_html = wrap_html(html_content, file.replace(".md", "").replace("_", " ").title())

                    with open(html_path, "w", encoding="utf-8") as f:
                        f.write(full_html)

                    print(f"[OK] {md_path} → {html_path}")
                    total_convertidos += 1

                except Exception as e:
                    # Fallback para evitar erro de terminal com unicode
                    print(f"[ERRO] Arquivo: {md_path}")
                    print(f"       Motivo: {str(e)}")

    print(f"\nFinalizado. Total de arquivos convertidos: {total_convertidos}")


# ================================
# PONTO DE ENTRADA DO SCRIPT
# ================================

if __name__ == "__main__":
    print("4All_OS - Conversor de Markdown para HTML")
    print("Iniciando processo...\n")
    convert_all_markdown_files()
