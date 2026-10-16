# Script para copiar as imagens para a pasta do projeto
# Execute com: powershell -ExecutionPolicy Bypass -File setup-images.ps1

$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$imagesDir = Join-Path $projectDir "assets\images"
$sourceDir = "C:\Users\Win11\.gemini\antigravity\brain\b7ac21cc-047b-41b9-976d-ebd81f053a50\.user_uploaded"

# Criar pasta se não existir
if (-not (Test-Path $imagesDir)) {
    New-Item -ItemType Directory -Path $imagesDir -Force | Out-Null
}

$files = @{
    "media_1792176028317_44dbe034.png" = "profissional.png"
    "media_1792176028323_e5e416ad.png" = "resultado-testa.png"
    "media_1792176028338_8ebd68df.png" = "resultado-corporal.png"
    "media_1792176028349_ca272dc6.png" = "resultado-labios.png"
}

foreach ($src in $files.Keys) {
    $srcPath = Join-Path $sourceDir $src
    $destPath = Join-Path $imagesDir $files[$src]
    
    if (Test-Path $srcPath) {
        Copy-Item $srcPath $destPath -Force
        Write-Host "OK: $($files[$src])" -ForegroundColor Green
    } else {
        Write-Host "ERRO: $src nao encontrado" -ForegroundColor Red
    }
}

Write-Host "`nImagens copiadas para: $imagesDir" -ForegroundColor Cyan
Write-Host "Agora abra index.html no navegador!" -ForegroundColor Yellow
