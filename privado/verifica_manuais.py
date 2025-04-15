import os

idiomas = {
    "en": "English",
    "pt": "Português",
    "es": "Español",
    "fr": "Français",
    "de": "Deutsch",
    "it": "Italiano",
    "ja": "日本語",
    "ru": "Русский",
    "zh": "中文",
    "ar": "العربية"
}

base_path = "./manuals"
print("📁 Verificando estrutura de manuais multilíngues...\n")

for code, lang in idiomas.items():
    folder = os.path.join(base_path, code)
    md_file = os.path.join(folder, "manual.md")
    html_file = os.path.join(folder, "manual.html")

    md_exists = os.path.isfile(md_file)
    html_exists = os.path.isfile(html_file)

    print(f"🌐 {lang} ({code.upper()}): ", end="")

    if md_exists and html_exists:
        print("✅ OK (md + html)")
    elif md_exists:
        print("⚠️ Falta: manual.html")
    elif html_exists:
        print("⚠️ Falta: manual.md")
    else:
        print("❌ Nenhum arquivo encontrado")
