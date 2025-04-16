<#
.SYNOPSIS
    Descrição do script.

.DESCRIPTION
    Detalhes sobre o funcionamento do script.

.EXAMPLE
    Exemplos de uso do script.
#>Write-Host "Criando estrutura de pastas do sistema operacional 4All_OS..."  $folders = @(     "docs",     "docs\design_docs",     "src\kernel",     "src\modules",     "src\utilities",     "assets\build" )  foreach ($folder in $folders) {     $fullPath = Join-Path $PWD $folder     if (!(Test-Path $fullPath)) {         New-Item -ItemType Directory -Path $fullPath -Force         Write-Host "Criado: $fullPath"     } }
