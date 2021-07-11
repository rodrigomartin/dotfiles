# Instalar fuentes 

```bash
cd
cp -r ./dotfiles/fonts/ ~/.local/share/fonts
```

# Instalar lsd, zsh, powerleve10k y ohmytmux 

```bash
cd
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
sudo dpkg -i lsd_0.20.1_amd64.deb
rm lsd_0.20.1_amd64.deb
apt install zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/gpakosz/.tmux.git
```

# Aplicar configuraciones

```bash
cd
ln -s -f dotfiles/.zsh
ln -s -f dotfiles/.vimrc
ln -s -f .tmux/.tmux.conf
ln -s -f dotfiles/.tmux.conf.local
# cambiar shell
sudo chsh -s $(which zsh) $USER
```

# Configurar neovim
Crear archivo `~/.config/nvim/init.vim` con el siguiente contenido:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

# TODO:
- Instalador
