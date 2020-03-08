FROM zaioll/elixir:latest

LABEL maintener 'Láyro Chrystofer <zaioll@protonmail.com>'

ENV VSCODEEXT /var/vscode-ext

# crash if not set HOME env var
ENV HOME /home/${usuario}

COPY install /install

RUN /install/_install.sh

COPY start.sh /usr/local/bin/start.sh
COPY settings.json /home/${usuario}/.config/Code/User

RUN /install/pos-install.sh

WORKDIR /var/www/html

CMD [ "/usr/local/bin/start.sh" ]