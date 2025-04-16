<#
.SYNOPSIS
    Descri��o do script.

.DESCRIPTION
    Detalhes sobre o funcionamento do script.

.EXAMPLE
    Exemplos de uso do script.
#>## Implementação de um sistema que permita aos usuários reportar erros encontrados durante o uso do sistema. ## Este script solicita ao usuário uma descrição do erro e registra as informações em um arquivo de log. ## Nome do script "Report-Error.ps1" ## Caminho  C:\4All_OS\privado\scrripts  # Caminho para o arquivo de log de erros $errorLogPath = "C:\4All_OS\logs\error_reports.log"  # Verificar se o diretório de logs existe; se não, criar $logDir = Split-Path $errorLogPath if (-not (Test-Path -Path $logDir)) {     New-Item -Path $logDir -ItemType Directory -Force }  # Solicitar descrição do erro ao usuário $description = Read-Host "Descreva o erro encontrado"  # Capturar informações adicionais $user = $env:USERNAME $timestamp = Get-Date -Format 'dd/MM/yyyy HH:mm'  # Registrar o erro no arquivo de log Add-Content -Path $errorLogPath -Value "`n[$timestamp] Erro reportado por ${user}:`n$description`n"     ## Explicação do Script Report-Error.ps1 ## Split-Path: Obtém o diretório do caminho do arquivo de log. ## Test-Path: Verifica se o diretório existe. ## New-Item: Cria o diretório se ele não existir. ## Read-Host: Solicita ao usuário a descrição do erro. ## $env:USERNAME: Obtém o nome do usuário atual. ## Get-Date: Captura a data e hora atuais. ## Add-Content: Adiciona o conteúdo ao arquivo de log.
