#!/usr/bin/env python3
"""
Remove white background from F-150 truck image
"""

try:
    from PIL import Image
    import numpy as np

    print("=" * 70)
    print("  POWER JUNK - Removendo fundo branco da F-150")
    print("=" * 70)
    print()

    # Paths
    input_path = r"C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-power-junk-side.png"
    output_path = r"C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02\f150-power-junk-side.png"

    print(f"📂 Carregando: {input_path}")

    # Open image
    img = Image.open(input_path).convert("RGBA")

    # Get image data
    data = np.array(img)

    # Define white threshold (pixels that are mostly white)
    # RGB values above this threshold will be considered white
    threshold = 240

    # Create mask for white pixels
    # Check if R, G, and B are all above threshold
    white_mask = (data[:, :, 0] > threshold) & \
                 (data[:, :, 1] > threshold) & \
                 (data[:, :, 2] > threshold)

    # Set alpha channel to 0 (transparent) for white pixels
    data[white_mask, 3] = 0

    # Create new image
    result = Image.fromarray(data, 'RGBA')

    print(f"💾 Salvando: {output_path}")

    # Save with transparency
    result.save(output_path, 'PNG', optimize=True)

    print()
    print("=" * 70)
    print("✅ SUCESSO! Fundo branco removido!")
    print("=" * 70)
    print()
    print("🚚 Agora abra o site e pressione CTRL+SHIFT+R")
    print("   A F-150 vai aparecer SEM fundo branco!")
    print()

except ImportError as e:
    print("=" * 70)
    print("⚠️  INSTALANDO BIBLIOTECAS NECESSÁRIAS...")
    print("=" * 70)
    print()
    print("Execute este comando:")
    print()
    print("  pip install pillow numpy")
    print()
    print("Erro:", str(e))

except Exception as e:
    print(f"❌ Erro: {e}")
    import traceback
    traceback.print_exc()

print()
input("Pressione ENTER para sair...")
