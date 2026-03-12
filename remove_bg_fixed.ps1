# PowerShell script to remove white background from PNG image

Add-Type -AssemblyName System.Drawing

$inputPath = "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-power-junk-side.png"
$tempPath = "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-temp.png"
$outputPath = "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-power-junk-side.png"

Write-Host "======================================================================" -ForegroundColor Yellow
Write-Host "  POWER JUNK - Removendo fundo branco da F-150" -ForegroundColor White
Write-Host "======================================================================" -ForegroundColor Yellow
Write-Host ""

try {
    Write-Host "[1/4] Carregando imagem..." -ForegroundColor Cyan
    $bitmap = New-Object System.Drawing.Bitmap($inputPath)

    Write-Host "[2/4] Processando pixels..." -ForegroundColor Cyan
    Write-Host "        Tamanho: $($bitmap.Width)x$($bitmap.Height) pixels" -ForegroundColor Gray

    # Create new bitmap for output
    $newBitmap = New-Object System.Drawing.Bitmap($bitmap.Width, $bitmap.Height)

    # Process each pixel
    $totalPixels = $bitmap.Height
    for ($y = 0; $y -lt $bitmap.Height; $y++) {
        for ($x = 0; $x -lt $bitmap.Width; $x++) {
            $pixel = $bitmap.GetPixel($x, $y)

            # Check if pixel is white (threshold 240)
            if ($pixel.R -ge 240 -and $pixel.G -ge 240 -and $pixel.B -ge 240) {
                # Make it fully transparent
                $newPixel = [System.Drawing.Color]::FromArgb(0, 0, 0, 0)
            } else {
                # Keep original pixel
                $newPixel = $pixel
            }

            $newBitmap.SetPixel($x, $y, $newPixel)
        }

        # Progress every 50 rows
        if ($y % 50 -eq 0) {
            $percent = [math]::Round(($y / $totalPixels) * 100)
            Write-Host "        Progresso: $percent%" -ForegroundColor Gray -NoNewline
            Write-Host "`r" -NoNewline
        }
    }

    Write-Host "        Progresso: 100%                    " -ForegroundColor Green

    Write-Host "[3/4] Salvando imagem..." -ForegroundColor Cyan

    # Save to temp file first
    $newBitmap.Save($tempPath, [System.Drawing.Imaging.ImageFormat]::Png)

    # Dispose resources
    $newBitmap.Dispose()
    $bitmap.Dispose()

    Write-Host "[4/4] Substituindo arquivo original..." -ForegroundColor Cyan

    # Wait a bit for file handles to release
    Start-Sleep -Milliseconds 500

    # Replace original file
    Move-Item -Path $tempPath -Destination $outputPath -Force

    Write-Host ""
    Write-Host "======================================================================" -ForegroundColor Green
    Write-Host "  SUCESSO! Fundo branco removido!" -ForegroundColor Green
    Write-Host "======================================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Agora abra o site e pressione CTRL+SHIFT+R" -ForegroundColor Yellow
    Write-Host "A F-150 vai aparecer SEM fundo branco!" -ForegroundColor Yellow
    Write-Host ""

} catch {
    Write-Host ""
    Write-Host "ERRO: $_" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red

    # Cleanup
    if (Test-Path $tempPath) {
        Remove-Item $tempPath -ErrorAction SilentlyContinue
    }
}

Write-Host ""
Read-Host "Pressione ENTER para sair"
