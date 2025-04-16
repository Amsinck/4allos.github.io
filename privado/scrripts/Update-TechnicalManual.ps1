<#
.SYNOPSIS
    Descri��o do script.

.DESCRIPTION
    Detalhes sobre o funcionamento do script.

.EXAMPLE
    Exemplos de uso do script.
#>## script "Update-TechnicalManual.ps1 ## Função: verifica arquivos modificados no diretório do código-fonte  ## desde a última atualização do manual e adiciona essas informações ao final do arquivo technical_manual. ## Caminho para o diretório di script C:\4All_OS\privado\scrripts  # Caminho para o diretório do manual técnico $manualPath = "C:\4All_OS\docs\manuals\pt\technical_manual.md"  # Caminho para o diretório do código-fonte $sourcePath = "C:\4All_OS\src"  # Obter a data da última modificação do manual $lastManualUpdate = (Get-Item $manualPath).LastWriteTime  # Obter arquivos modificados após a última atualização do manual $modifiedFiles = Get-ChildItem -Path $sourcePath -Recurse | Where-Object { $_.LastWriteTime -gt $lastManualUpdate }  # Se houver arquivos modificados, atualizar o manual if ($modifiedFiles) {     Add-Content -Path $manualPath -Value "`n## Atualizações em $(Get-Date -Format 'dd/MM/yyyy HH:mm')`n"     foreach ($file in $modifiedFiles) {         Add-Content -Path $manualPath -Value "- $($file.FullName) modificado em $($file.LastWriteTime)"     } }
