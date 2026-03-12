# PowerShell script to remove white background from PNG image
# Using .NET System.Drawing

Add-Type -AssemblyName System.Drawing

$inputPath = "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-power-junk-side.png"
$outputPath = "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-power-junk-side.png"

Write-Host "=" -NoNewline -ForegroundColor Red
Write-Host ("=" * 69) -ForegroundColor Yellow
Write-Host "  POWER JUNK - Removendo fundo branco da F-150" -ForegroundColor White
Write-Host "=" -NoNewline -ForegroundColor Red
Write-Host ("=" * 69) -ForegroundColor Yellow
Write-Host ""

try {
    Write-Host "Loading image..." -ForegroundColor Cyan
    $bitmap = New-Object System.Drawing.Bitmap($inputPath)

    Write-Host "Removing white background..." -ForegroundColor Cyan

    # Process each pixel
    for ($y = 0; $y -lt $bitmap.Height; $y++) {
        for ($x = 0; $x -lt $bitmap.Width; $x++) {
            $pixel = $bitmap.GetPixel($x, $y)

            # Check if pixel is white (or very close to white)
            if ($pixel.R -ge 240 -and $pixel.G -ge 240 -and $pixel.B -ge 240) {
                # Make it transparent
                $transparent = [System.Drawing.Color]::FromArgb(0, 255, 255, 255)
                $bitmap.SetPixel($x, $y, $transparent)
            }
        }

        # Progress indicator
        if ($y % 10 -eq 0) {
            $percent = [math]::Round(($y / $bitmap.Height) * 100)
            Write-Progress -Activity "Removing background" -Status "$percent% Complete" -PercentComplete $percent
        }
    }

    Write-Host "Saving image..." -ForegroundColor Cyan
    $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bitmap.Dispose()

    Write-Host ""
    Write-Host "=" -NoNewline -ForegroundColor Green
    Write-Host ("=" * 69) -ForegroundColor Green
    Write-Host "SUCCESS! Fundo branco removido!" -ForegroundColor Green
    Write-Host "=" -NoNewline -ForegroundColor Green
    Write-Host ("=" * 69) -ForegroundColor Green
    Write-Host ""
    Write-Host "Agora abra o site e pressione CTRL+SHIFT+R" -ForegroundColor Yellow
    Write-Host "A F-150 vai aparecer SEM fundo branco!" -ForegroundColor Yellow
    Write-Host ""

} catch {
    Write-Host "ERROR: $_" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Read-Host "Pressione ENTER para sair"
