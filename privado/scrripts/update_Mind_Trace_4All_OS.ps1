<#
.SYNOPSIS
    Atualiza a árvore de diretórios do 4All_OS a partir do GitHub e mantém o módulo Mind Trace sincronizado.

.DESCRIPTION
    Este script profissional verifica a integridade do repositório local, realiza backup opcional, sincroniza com o repositório remoto e exibe o log das alterações.
    Ele foi projetado para ser integrado diretamente ao sistema operacional 4All_OS.

.NOTES
    Desenvolvido para o sistema 4All_OS por Fernando
    Última atualização: 2025-04-14
#>

# Configurações principais
$repoPath = "C:\Users\Fernando\Documents\4All_OS"
$repoURL = "https://github.com/SEU_USUARIO/4All_OS.git"  # Substitua com o URL real do seu repositório
$backupPath = "$repoPath\_backup_$(Get-Date -Format 'yyyy-MM-dd_HHmmss')"
$mindTracePath = "$repoPath\modules\mind_trace.py"

Write-Host "🚀 Iniciando atualização do sistema 4All_OS..." -ForegroundColor Cyan

# Verificação do repositório
if (!(Test-Path $repoPath)) {
    Write-Host "❌ Repositório não encontrado em $repoPath. Deseja clonar? (s/n)" -ForegroundColor Yellow
    $resposta = Read-Host
    if ($resposta -eq "s") {
        git clone $repoURL $repoPath
        Write-Host "✅ Repositório clonado com sucesso!" -ForegroundColor Green
    } else {
        Write-Host "⚠️ Atualização cancelada." -ForegroundColor DarkYellow
        exit
    }
}

# Backup opcional
Write-Host "💾 Deseja criar backup do estado atual? (s/n)" -ForegroundColor Gray
$backup = Read-Host
if ($backup -eq "s") {
    Copy-Item -Path $repoPath -Destination $backupPath -Recurse
    Write-Host "✅ Backup criado em: $backupPath" -ForegroundColor Green
}

# Acessar o repositório
Set-Location $repoPath

# Verificar se há modificações locais
$changes = git status --porcelain
if ($changes) {
    Write-Host "⚠️ Há modificações locais não comitadas." -ForegroundColor Yellow
    Write-Host $changes
    Write-Host "Deseja continuar mesmo assim? (s/n)" -ForegroundColor Yellow
    $res = Read-Host
    if ($res -ne "s") {
        Write-Host "🛑 Atualização abortada para preservar suas alterações." -ForegroundColor Red
        exit
    }
}

# Atualizar a árvore (pull)
Write-Host "🔁 Atualizando repositório via git pull..." -ForegroundColor Cyan
git pull

# Verificar módulo Mind Trace
if (Test-Path $mindTracePath) {
    Write-Host "✅ Módulo Mind Trace localizado." -ForegroundColor Green
} else {
    Write-Host "❌ Módulo Mind Trace não encontrado. Deseja baixá-lo novamente? (s/n)" -ForegroundColor Red
    $mindRes = Read-Host
    if ($mindRes -eq "s") {
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SEU_USUARIO/4All_OS/main/modules/mind_trace.py" -OutFile $mindTracePath
        Write-Host "📥 Mind Trace restaurado com sucesso." -ForegroundColor Green
    }
}

# Mostrar o log das últimas atualizações
Write-Host "📄 Últimas alterações no repositório:" -ForegroundColor Cyan
git log -5 --oneline

Write-Host "✅ Atualização concluída com sucesso!" -ForegroundColor Green
