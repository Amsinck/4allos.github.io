param (
    [string]$NomeDoScript
)

if (-not $NomeDoScript) {
    Write-Host "⚠️  Uso: .\criar_script.ps1 NomeDoScript"
    exit 1
}

$baseDir = "$PSScriptRoot"
$scriptFile = "$baseDir\$NomeDoScript.ps1"

if (Test-Path $scriptFile) {
    Write-Host "❌ O script '$scriptFile' já existe. Escolha outro nome."
    exit 1
}

# Conteúdo inicial do script com template estilo Big Tech
$conteudo = @"
<#
.SYNOPSIS
    Script: $NomeDoScript.ps1
    Projeto: 4All_OS — Operating System Foundation
    Local: tools/scripts/
    Objetivo: Script automatizado criado para ser executado como parte do sistema modular 4All_OS.
    Data de criação: $(Get-Date -Format 'yyyy-MM-dd HH:mm')
    Autor: Fundação 4All_OS (admin.4allos@proton.me)
    Licença: MPL-2.0

.DESCRIPTION
    Este script faz parte do ecossistema operacional 4All_OS e deve seguir os padrões de engenharia segura.
    Ele será utilizado para tarefas específicas dentro da pipeline técnica e poderá ser executado individualmente ou por outros scripts automatizados.

.NOTES
    Todos os scripts devem ser versionados no GitHub e validados por revisão técnica. Insira lógica condicional, logs e segurança mínima conforme necessidade.
#>

Write-Host "🔧 Executando script: $NomeDoScript.ps1"

# === Início da Lógica Principal ===
# TODO: Insira sua lógica abaixo

Write-Host "📌 [LOG] Ainda não implementado — adicione comandos aqui."

# === Fim da Lógica ===
"@

# Criar arquivo com o conteúdo
$conteudo | Set-Content -Encoding UTF8 $scriptFile

Write-Host "✅ Script gerado com sucesso: $scriptFile"
