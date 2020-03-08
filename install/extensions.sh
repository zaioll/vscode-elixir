#!/bin/bash

mkdir ${VSCODEEXT}
chown -R ${usuario}:${usuario} $VSCODEEXT
su ${usuario} -c "code --extensions-dir $VSCODEEXT \
    --install-extension mjmcloug.vscode-elixir \
    --install-extension jakebecker.elixir-ls \
    --install-extension saratravi.elixir-formatter \
    --install-extension arsen.darcula-theme-for-elixir \
    --install-extension samuel-pordeus.elixir-test \
    --install-extension formulahendry.auto-close-tag \
    --install-extension coenraads.bracket-pair-colorizer \
    --install-extension editorconfig.editorconfig \
    --install-extension donjayamanne.githistory \
    --install-extension codezombiech.gitignore \
    --install-extension eamodio.gitlens \
    --install-extension davidanson.vscode-markdownlint \
    --install-extension esbenp.prettier-vscode \
    --install-extension chrmarti.regex \
    --install-extension mechatroner.rainbow-csv \
    --install-extension vscodevim.vim \
    --install-extension vscode-icons-team.vscode-icons \
    --install-extension dotjoshjohnson.xml \
    --install-extension redhat.vscode-xml \
    --install-extension piotrpalarz.vscode-gitignore-generator \
    --install-extension jock.svg \
    --install-extension cssho.vscode-svgviewer \
"

#&& su ${usuario} -c "code --extensions-dir $VSCODEEXT --install-extension formulahendry.auto-close-tag"

