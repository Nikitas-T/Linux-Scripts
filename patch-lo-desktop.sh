#!/bin/bash

mkdir -p ~/.local/share/applications

for module in writer calc impress draw base math; do
  src="/usr/share/applications/libreoffice-$module.desktop"
  dst="$HOME/.local/share/applications/libreoffice-$module.desktop"

  if [ -f "$src" ]; then
    cp "$src" "$dst"
    sed -i 's|Exec=libreoffice|Exec=env SAL_FORCEDPI=135 libreoffice|' "$dst"
    echo "✅ Patched: $dst"
  else
    echo "⚠️ НNot found: $src"
  fi
done

echo
echo "🎉  LibreOffice with DPI=135 scale is ready!."
