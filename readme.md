# Fuentes
Instalar fuentes para la correcta visualización de iconos con powerlevel10k
    ```bash
    cp -r ./fonts/ ~/.local/share/fonts
    ```

# Instalar "lsd"
    ```bash
    wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
    sudo dpkg -i lsd_0.20.1_amd64.deb
    rm lsd_0.20.1_amd64.deb
    ```

# Instalar "powerlevel10k"
    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    ```

# Instalar "oh my zsh"
