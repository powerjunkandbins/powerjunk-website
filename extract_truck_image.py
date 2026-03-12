#!/usr/bin/env python3
"""
Extract F-150 truck image from PDF and save it
"""

import sys
import os

try:
    from pdf2image import convert_from_path
    from PIL import Image

    # Paths
    pdf_path = r"C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\Site\truck - power junk.pdf"
    output_path = r"C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-power-junk-side.png"

    print("=" * 70)
    print("  POWER JUNK - Extraindo imagem da F-150 do PDF")
    print("=" * 70)
    print()
    print(f"📄 PDF: {pdf_path}")
    print(f"💾 Destino: {output_path}")
    print()
    print("🔄 Convertendo PDF para imagem...")

    # Convert PDF to images
    images = convert_from_path(pdf_path, dpi=300)

    if images:
        print(f"✅ Encontrado {len(images)} página(s)")
        print("💾 Salvando primeira página como PNG...")

        # Save first page
        images[0].save(output_path, 'PNG')

        print()
        print("=" * 70)
        print("✅ SUCESSO! Imagem da F-150 extraída!")
        print("=" * 70)
        print()
        print("🚚 Agora abra o index.html e pressione CTRL+SHIFT+R")
        print("   A F-150 vai aparecer com as animações!")
        print()
    else:
        print("❌ Nenhuma imagem encontrada no PDF")

except ImportError as e:
    print("=" * 70)
    print("⚠️  FALTAM BIBLIOTECAS")
    print("=" * 70)
    print()
    print("Instale as bibliotecas necessárias:")
    print()
    print("  pip install pdf2image pillow")
    print("  pip install poppler-utils")
    print()
    print("Ou no Windows:")
    print("  pip install pdf2image pillow")
    print("  Baixe poppler: https://github.com/oschwartz10612/poppler-windows/releases/")
    print()
    print("Erro:", str(e))

except Exception as e:
    print(f"❌ Erro: {e}")
    import traceback
    traceback.print_exc()

print()
input("Pressione ENTER para sair...")
