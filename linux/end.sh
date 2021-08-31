
curl -O https://can202.github.io/OpenTicTacToeX/src/textures/icon/256icon.png
mv 256icon.png icon.png

echo "[Desktop Entry]
Name=OpenTicTacToeX
Exec=$HOME/.local/share/games/opentictactoex/opentictactoex
Icon=$HOME/.local/share/games/opentictactoex/icon.png
Type=Application
Categories=Game" >> opentictactoex.desktop

cp opentictactoex.desktop ~/.local/share/applications/

echo "opentictactoex.desktop created"

 
