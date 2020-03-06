FROM zaioll/phoenix:1.7.4

LABEL maintener 'Láyro Chrystofer <zaioll@protonmail.com>'

ENV USUARIO developer
ENV HOME /home/${USUARIO}
ENV VSCODEEXT /var/vscode-ext

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	git \
	--no-install-recommends

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | apt-key add - \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get update && apt-get -y install \
	code \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libexpat1 \
	libfontconfig1 \
	libfreetype6 \
	libgtk2.0-0 \
	libpango-1.0-0 \
	libx11-xcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN \
    useradd --create-home --home-dir $HOME ${USUARIO} \
    && mkdir /var/www/html -p \
	&& chown -R ${USUARIO}:${USUARIO} $HOME /var/www/html

RUN mkdir $VSCODEEXT \
    && chown -R ${USUARIO}:${USUARIO} $VSCODEEXT \
	&& su ${USUARIO} -c "code --extensions-dir $VSCODEEXT --install-extension mjmcloug.vscode-elixir --install-extension jakebecker.elixir-ls --install-extension saratravi.elixir-formatter --install-extension arsen.darcula-theme-for-elixir --install-extension samuel-pordeus.elixir-test --install-extension formulahendry.auto-close-tag --install-extension coenraads.bracket-pair-colorizer --install-extension editorconfig.editorconfig --install-extension donjayamanne.githistory --install-extension codezombiech.gitignore --install-extension eamodio.gitlens --install-extension davidanson.vscode-markdownlint --install-extension esbenp.prettier-vscode --install-extension chrmarti.regex --install-extension mechatroner.rainbow-csv --install-extension vscodevim.vim --install-extension vscode-icons-team.vscode-icons --install-extension dotjoshjohnson.xml --install-extension redhat.vscode-xml --install-extension piotrpalarz.vscode-gitignore-generator --install-extension jock.svg --install-extension cssho.vscode-svgviewer"

COPY start.sh /usr/local/bin/start.sh
COPY settings.json ${HOME}/.config/Code/User

RUN chown ${USUARIO}:${USUARIO} $HOME/.config/Code/User/settings.json

WORKDIR /var/www/html

CMD [ "/usr/local/bin/start.sh" ]