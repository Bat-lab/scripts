#!/bin/bash

      apt update -y

      wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

      dpkg -i ~/google-chrome-stable_current_amd64.deb

      wget https://download.anydesk.com/linux/anydesk_6.2.1-1_amd64.deb

      dpkg -i ~/anydesk_6.2.1-1_amd64.deb
      apt --fix-broken install -y

      apt install openjdk-8-jdk -y
