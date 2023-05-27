##############################################################
# Integration Test用RunnerBaseImage
##############################################################
# build & runコマンド
# docker build -t daichiwealsoft/integration_test_job_base_image:v1.0.0 .
# docker run -v C:\Users\besta\app\tech_blog\poc-frontend-app:/home/sample_app -p 3000:3000 -u root --name selenium_test21 -w /home/sample_app --rm -it daichiwealsoft/integration_test_job_base_image:v1.0.0 bash
FROM node:16.20.0-buster

RUN apt-get update && apt-get install wget -y

# 設定ファイルの読み込みにyqコマンド（jqのyaml版）を使用しているためインストール
# なお、yqは２種類あり、goが動作が安定しているためそれを使用
ARG VERSION=v4.2.0
ARG BINARY=yq_linux_amd64
RUN wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq

# パッケージリストの更新とGoogle Chromeのインストール
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get update && apt-get install -y google-chrome-stable

RUN wget https://github.com/maiha/xq.cr/releases/download/v0.3.0/xq -P /usr/bin && chmod +x /usr/bin/xq

# google-chromeと同じバージョンをwget
RUN wget https://chromedriver.storage.googleapis.com/111.0.5563.19/chromedriver_linux64.zip -P /tmp
RUN unzip /tmp/chromedriver_linux64.zip -d /usr/local/bin && chmod 755 /usr/local/bin/chromedriver && rm -f /tmp/chromedriver_linux64.zip
