cd $HOME/.local/share/games/opentictactoex
mkdir $HOME/.local/share/applications/
curl -O https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/media/icon.png

echo "[Desktop Entry]
Name=OpenTicTacToeX
Exec=$HOME/.local/share/games/opentictactoex/opentictactoex
Icon=$HOME/.local/share/games/opentictactoex/icon.png
Type=Application
Categories=Game" >> opentictactoex.desktop
chmod a+x opentictactoex.desktop

cp opentictactoex.desktop $HOME/.local/share/applications/

echo "opentictactoex.desktop created"

 
