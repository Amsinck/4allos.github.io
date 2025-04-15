# criar_readme_manual.ps1

# Caminho onde o arquivo README.md será salvo
$readmePath = "C:\4all_os\docs\manuals\README.md"

# Conteúdo detalhado do README.md
$readmeContent = @"
# 📝 Arquivo: README.md
📂 Caminho: C:\4all_os\docs\manuals\README.md  
🔧 Função: Este arquivo documenta a estrutura de manuais multilíngues do projeto 4All OS.  
🎯 Uso: Serve como guia para desenvolvedores e colaboradores que queiram entender, manter ou contribuir com a documentação traduzida.

---

## 📦 Metadados do Projeto

- **Project:** 4All_OS  
- **Organization:** 4All_OS Foundation  
- **Email:** admin.4allos@proton.me  
- **Session ID:** 05d1c3f1a70cb80bf4d46f3b6bd63b2d27b0d08e331bf509eb6f9938021ca59e0b  

---

# 🌐 Multilingual Manuals - 4All OS

Este diretório contém a estrutura dos **manuais multilíngues** para o projeto **4All OS**. O objetivo é permitir que usuários de diferentes idiomas tenham acesso à documentação do sistema de forma automática e organizada.

---

## 📁 Estrutura de Diretórios

Cada idioma possui um subdiretório com um arquivo `index.html` que representa o manual traduzido. A estrutura esperada é a seguinte:



"@  # <-- Precisa estar EXATAMENTE assim (sem espaços antes do "@)
