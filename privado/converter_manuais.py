import markdown
import os

TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>{title}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    body {{
      font-family: 'Segoe UI', Arial, sans-serif;
      background-color: #f7f9fc;
      color: #222;
      margin: 0;
      padding: 50px;
      line-height: 1.6;
    }}
    h1, h2, h3 {{ color: #0056d2; }}
    a {{ color: #0078d4; }}
    header {{
      background-color: #0056d2;
      color: white;
      padding: 20px;
      text-align: center;
      border-bottom: 4px solid #0041a8;
    }}
    footer {{
      background: #eee;
      padding: 30px;
      text-align: center;
      margin-top: 40px;
      font-size: 0.9em;
      color: #333;
    }}
    .back-button {{
      display: inline-block;
      margin-top: 20px;
      padding: 10px 18px;
      background: #0078d4;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
      transition: background 0.3s;
    }}
    .back-button:hover {{
      background: #0056a4;
    }}
  </style>
</head>
<body>
<header>
  <h1>{title}</h1>
  <p>Project: <strong>4All_OS</strong> &mdash; Organization: <strong>4All_OS Foundation</strong></p>
</header>

<main>
{content}
</main>

<div style="text-align:center">
  <a class="back-button" href="../index.html">⬅ Voltar ao menu de idiomas</a>
</div>

<footer>
  <p>📧 Email: <a href="mailto:admin.4allos@proton.me">admin.4allos@proton.me</a></p>
  <p>🔐 Session ID: <code>{session_id}</code></p>
</footer>

</body>
</html>
"""

session_id = "05d1c3f1a70cb80bf4d46f3b6bd63b2d27b0d08e331bf509eb6f9938021ca59e0b"
base_path = "./manuals"

for lang in os.listdir(base_path):
    folder = os.path.join(base_path, lang)
    md_path = os.path.join(folder, "manual.md")
    html_path = os.path.join(folder, "manual.html")

    if os.path.isfile(md_path):
        with open(md_path, "r", encoding="utf-8") as md_file:
            md_content = md_file.read()

        html_content = markdown.markdown(md_content, extensions=["tables", "fenced_code", "toc"])
        final_html = TEMPLATE.format(
            title=f"4All_OS Manual - {lang.upper()}",
            content=html_content,
            session_id=session_id
        )

        with open(html_path, "w", encoding="utf-8") as html_file:
            html_file.write(final_html)

        print(f"✅ Convertido: {lang}/manual.html")
    else:
        print(f"⚠️ Não encontrado: {lang}/manual.md")
