<#
.SYNOPSIS
    Script para adaptar a estrutura de diretórios e adicionar docstrings aos scripts existentes.

.DESCRIPTION
    Este script percorre os diretórios especificados, verifica a existência de arquivos de script e adiciona docstrings
    conforme o padrão PEP 257. Além disso, realiza ajustes na estrutura de diretórios conforme necessário.

.PARAMETER DiretorioRaiz
    Caminho do diretório raiz onde a adaptação será realizada.

.EXAMPLE
    .\adaptar-estrutura.ps1 -DiretorioRaiz "C:\Projetos\MeuProjeto"
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$DiretorioRaiz
)

function Adicionar-Docstrings {
    <#
    .SYNOPSIS
        Adiciona docstrings aos arquivos de script no diretório especificado.

    .DESCRIPTION
        Esta função percorre os arquivos de script no diretório fornecido e adiciona docstrings conforme o padrão PEP 257.

    .PARAMETER Diretorio
        Caminho do diretório onde os arquivos de script serão processados.

    .EXAMPLE
        Adicionar-Docstrings -Diretorio "C:\Projetos\MeuProjeto\scripts"
    #>

    param (
        [Parameter(Mandatory = $true)]
        [string]$Diretorio
    )

    if (-not (Test-Path $Diretorio)) {
        Write-Host "Erro: O diretório '$Diretorio' não existe."
        return
    }

    $arquivos = Get-ChildItem -Path $Diretorio -Filter "*.ps1" -Recurse
    foreach ($arquivo in $arquivos) {
        try {
            $conteudo = Get-Content $arquivo.FullName
            if ($conteudo[0] -notmatch '^\s*<\#') {
                $docstring = @"
<#
.SYNOPSIS
    Descrição do script.

.DESCRIPTION
    Detalhes sobre o funcionamento do script.

.EXAMPLE
    Exemplos de uso do script.
#>
"@
                $conteudo = $docstring + $conteudo
                Set-Content -Path $arquivo.FullName -Value $conteudo
                Write-Host "Docstring adicionada ao arquivo: $($arquivo.FullName)"
            }
        } catch {
            Write-Host "Erro ao processar o arquivo '$($arquivo.FullName)': $_"
        }
    }
}

function Ajustar-Estrutura {
    <#
    .SYNOPSIS
        Ajusta a estrutura de diretórios conforme necessário.

    .DESCRIPTION
        Esta função verifica a estrutura de diretórios e realiza ajustes conforme necessário para atender às práticas recomendadas.

    .PARAMETER DiretorioRaiz
        Caminho do diretório raiz onde a estrutura será ajustada.

    .EXAMPLE
        Ajustar-Estrutura -DiretorioRaiz "C:\Projetos\MeuProjeto"
    #>

    param (
        [Parameter(Mandatory = $true)]
        [string]$DiretorioRaiz
    )

    if (-not (Test-Path $DiretorioRaiz)) {
        Write-Host "Erro: O diretório raiz '$DiretorioRaiz' não existe."
        return
    }

    # Exemplo de ajuste: Criar diretórios necessários
    $diretoriosNecessarios = @(
        "docs\design_docs",
        "docs\manifesto",
        "docs\manuals\pt",
        "docs\manuals\en"
    )

    foreach ($dir in $diretoriosNecessarios) {
        $caminhoCompleto = Join-Path -Path $DiretorioRaiz -ChildPath $dir
        if (-not (Test-Path $caminhoCompleto)) {
            New-Item -Path $caminhoCompleto -ItemType Directory
            Write-Host "Diretório criado: $caminhoCompleto"
        }
    }
}

# Execução das funções
Ajustar-Estrutura -DiretorioRaiz $DiretorioRaiz
Adicionar-Docstrings -Diretorio $DiretorioRaiz
