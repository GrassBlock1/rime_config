#!/usr/bin/env bash
RIME_HOME=~/.local/share/fcitx5/rime

echo "正在复制 rime 配置至此..."
cp $RIME_HOME/*.custom.yaml .
cp $RIME_HOME/rime_ice_ext.dict.yaml .

echo "正在复制字典..."
cp $RIME_HOME/gdict/*.dict.yaml ./gdict
