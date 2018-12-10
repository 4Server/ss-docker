#!/usr/bin/env bash
# 可以更改加密方式 aes-256-cfb
(ss-manager -m aes-256-gcm -u --manager-address 127.0.0.1:55552 &) && (ssmgr &) && ssmgr -c /root/.ssmgr/webgui.yml