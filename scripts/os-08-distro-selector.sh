#!/usr/bin/env bash
set -euo pipefail

# OS-08: Distro Comparison & Selector (Ubuntu, Debian, Kali, Alpine)

echo "=== OS-08: Linux Dağıtım Karşılaştırıcısı ve Seçicisi ==="
echo "1. Tüm Dağıtımları Listele ve Karşılaştır"
echo "2. Kullanım Amacına Göre Öneri Al"
echo ""
read -p "Lütfen bir işlem seçin (1 veya 2): " secim

if [ "$secim" = "1" ]; then
    echo ""
    echo "--- Linux Dağıtımları Karşılaştırma Tablosu ---"
    printf "%-10s | %-35s | %-5s\n" "Dağıtım" "Tür" "Paket"
    printf "%s\n" "--------------------------------------------------------"
    printf "%-10s | %-35s | %-5s\n" "Ubuntu" "Genel Amaçlı / Masaüstü ve Sunucu" "apt"
    printf "%-10s | %-35s | %-5s\n" "Debian" "Sunucu / Kararlılık Odaklı" "apt"
    printf "%-10s | %-35s | %-5s\n" "Kali" "Sızma Testi ve Siber Güvenlik" "apt"
    printf "%-10s | %-35s | %-5s\n" "Alpine" "Hafif / Konteyner (Docker)" "apk"
elif [ "$secim" = "2" ]; then
    echo ""
    read -p "Nasıl bir ortamda kullanacaksın? (Örn: sunucu, güvenlik, hafif, genel): " amac
    amac=$(echo "$amac" | tr '[:upper:]' '[:lower:]')
    
    if [[ "$amac" == *"güvenlik"* ]] || [[ "$amac" == *"hack"* ]] || [[ "$amac" == *"pentest"* ]]; then
        echo " Öneri: KALI LINUX (Güvenlik testleri için ideal)"
    elif [[ "$amac" == *"hafif"* ]] || [[ "$amac" == *"docker"* ]] || [[ "$amac" == *"konteyner"* ]] || [[ "$amac" == *"mini"* ]]; then
        echo " Öneri: ALPINE LINUX (Ultra hafif ve hızlı)"
    elif [[ "$amac" == *"sunucu"* ]] || [[ "$amac" == *"server"* ]] || [[ "$amac" == *"kararlı"* ]]; then
        echo " Öneri: DEBIAN (Kararlı sunucu altyapısı)"
    else
        echo " Öneri: UBUNTU (Genel kullanım ve geliştirme için en geniş kaynak)"
    fi
else
    echo "Geçersiz seçim!"
fi
