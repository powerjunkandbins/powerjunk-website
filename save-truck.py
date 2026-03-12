import os
import shutil

print("=" * 60)
print("Power Junk & Bins - F-150 Truck Image Setup")
print("=" * 60)
print()

# Caminhos
desktop_path = r"C:\Users\Acer\Desktop"
target_dir = r"C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site\wp-content\uploads\2026\02"
target_file = os.path.join(target_dir, "f150-power-junk-side.png")

print("🔍 Procurando pela imagem da F-150 no Desktop...")
print()

# Procurar por arquivos de imagem no desktop
image_files = []
for file in os.listdir(desktop_path):
    if file.lower().endswith(('.png', '.jpg', '.jpeg')):
        full_path = os.path.join(desktop_path, file)
        if os.path.isfile(full_path):
            image_files.append(file)

if image_files:
    print(f"✅ Encontrei {len(image_files)} imagem(ns) no Desktop:")
    print()
    for i, file in enumerate(image_files, 1):
        size = os.path.getsize(os.path.join(desktop_path, file)) / 1024
        print(f"  [{i}] {file} ({size:.1f} KB)")
    print()
    print("Digite o número da imagem da F-150 (ou 0 para cancelar):")

    try:
        choice = int(input("Escolha: "))
        if choice > 0 and choice <= len(image_files):
            source_file = os.path.join(desktop_path, image_files[choice - 1])

            # Criar diretório se não existir
            os.makedirs(target_dir, exist_ok=True)

            # Copiar arquivo
            shutil.copy2(source_file, target_file)

            print()
            print("=" * 60)
            print("✅ SUCESSO!")
            print("=" * 60)
            print(f"✓ Imagem salva em:")
            print(f"  {target_file}")
            print()
            print("🚚 Agora abra o index.html no navegador para ver a F-150!")
            print("   A animação vai funcionar automaticamente!")
            print("=" * 60)
        else:
            print("\n❌ Cancelado.")
    except:
        print("\n❌ Entrada inválida.")
else:
    print("❌ Nenhuma imagem encontrada no Desktop.")
    print()
    print("📋 INSTRUÇÕES:")
    print("1. Salve a imagem da F-150 no Desktop")
    print("2. Execute este script novamente")
    print("   OU")
    print("3. Copie manualmente para:")
    print(f"   {target_dir}")
    print("   Com o nome: f150-power-junk-side.png")

print()
input("Pressione ENTER para sair...")
