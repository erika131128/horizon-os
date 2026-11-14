# Horizon OS 1.0

Distribuição Linux baseada no Debian 13 (trixie) com KDE Plasma, visual inspirado no Windows 11,
Wine para abrir programas .exe, Flathub e instalador gráfico (Calamares).

## Como gerar a ISO
Requisitos: PC x86_64, 4 GB de RAM, 25 GB livres, internet.

- Debian 12/13: `sudo ./build.sh`
- Linux, macOS ou Windows com Docker: `./docker-build.sh`
- Windows sem Docker: instale o WSL2 com Debian e use a primeira opção.

A ISO (`horizon-os-amd64.hybrid.iso`) aparece na pasta e o log fica em `build.log`.

## Testar
VirtualBox, VMware ou `qemu-system-x86_64 -m 4096 -enable-kvm -cdrom horizon-os-amd64.hybrid.iso`.
Para pendrive: Balena Etcher, Rufus (modo DD) ou `dd`.
Usuário do modo live: horizon (senha: live).

## Personalizar
- Pacotes: `config/package-lists/horizon.list.chroot`
- Nome e instalador: `config/hooks/live/0100-branding.hook.chroot`
- Visual e barra de tarefas: `config/includes.chroot/usr/local/bin/horizon-first-run`
- Papel de parede: `config/includes.chroot/usr/share/backgrounds/horizon/`

## Distribuição pública
- Não use o nome “Debian” nem o logotipo do Debian como marca do produto; “baseado no Debian” é permitido.
- Mantenha as licenças dos pacotes e informe onde obter o código-fonte (archive do Debian).
- Wine e os demais pacotes são livres. Não inclua o Windows nem programas pagos na ISO.

## Gerar a ISO sem ter Linux (GitHub Actions)
1. Crie um repositório no GitHub e envie todo o conteúdo desta pasta (incluindo a pasta oculta `.github`).
2. Abra a aba **Actions**, escolha **Gerar ISO do Horizon OS** e clique em **Run workflow**.
3. Quando terminar (30 a 90 minutos), baixe `horizon-os-iso` em **Artifacts**; dentro do zip está o arquivo `.iso`.
