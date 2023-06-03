#!/usr/bin/env bash

apt-get install -y wget unzip

# sudoで実行すること
# google chromeのインストーラを作成
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# パッケージリストの更新とGoogle Chromeのインストール
apt-get update
apt-get install -y google-chrome-stable

# ChromeDriverのバージョン整形に使用するxqコマンドのバイナリインストール
wget https://github.com/maiha/xq.cr/releases/download/v0.3.0/xq -P /usr/bin && chmod +x /usr/bin/xq

# chromeのバージョンを取得
chrome_v=$(google-chrome --version | cut -d " " -f 3 | cut -d "." -f 1)

# chromedriverのバージョンを確認
chrome_driver_ver=$(curl -s https://chromedriver.storage.googleapis.com/ | xq . | grep ${chrome_v} | grep Key | grep linux | cut -d">" -f2 | cut -d"/" -f1 | head -n 1)

# google-chromeと同じバージョンをwget
wget https://chromedriver.storage.googleapis.com/${chrome_driver_ver}/chromedriver_linux64.zip -P /tmp
unzip /tmp/chromedriver_linux64.zip -d /usr/bin
chmod 755 /usr/bin/chromedriver
rm -f /tmp/chromedriver_linux64.zip
