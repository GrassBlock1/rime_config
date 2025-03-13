# 草师傅的 rime 配置

![splash](./images/splash.png)

（截图内主题：[Reverier-Xu/Fluent-fcitx5: A Fluent-Design theme with blur effect and shadow for fcitx5.](https://github.com/Reverier-Xu/Fluent-fcitx5)）

基于[雾凇拼音](https://github.com/iDvel/rime-ice)的 rime 配置（补丁），为小鹤双拼用户提供特别优化。

需要先行安装 Rime 以及加载好 雾凇拼音 的配置，参考：[雾凇拼音的使用说明](https://github.com/iDvel/rime-ice?tab=readme-ov-file#使用说明)

---

## 更改列表

几乎一切都是通过补丁实现的，你可以快速编辑相应的 custom.yaml 来调整这些更改

- 添加颜文字候选（[#463](https://github.com/iDvel/rime-ice/pull/463)）
- 输入法层面的中英文之间自动添加空格（[#1174](https://github.com/iDvel/rime-ice/issues/1174)）
- 语法模型（需要手动下载[万象语法模型](https://github.com/amzxyz/RIME-LMDG/releases)）
- 自用扩展词库
  - [个人 rime userdb](./gdict/cybernet.yaml)（使用[rime-dict-tools](https://codeberg.org/grassblock/rime-dict-tools) 转换、去重，并人工修订），包含大量互联网词汇（工具目前性能欠佳，不能处理较大的词库， 这部分暂停更新）
  - [部分常用词](./gdict/427.dict.yaml)
  - [Minecraft 词库](https://github.com/Kimiblock/rime-minecraft-dict)
- [双拼补丁](https://github.com/iDvel/rime-ice/issues/133)（默认只给小鹤添加了，可以按需要修改成其它方案）
- [（可选的）自动纠错](https://github.com/iDvel/rime-ice/issues/838)，若要使用直接取消掉注释即可
- 一套基于 [Nord](https://nordtheme.com) 的小狼毫主题（比较古早所以我不确定还能不能用）

## 使用

1. Git

（如果此前在雾凇拼音也使用这个方法配置，那么不建议使用这个办法）

直接克隆仓库

```shell
git clone https://github.com/GrassBlock1/rime_config /path/to/rime_config
```

如果国内无法正常访问，可以使用镜像：

```shell
git clone https://codeberg.org/grassblock/rime /path/to/rime_config
```

随后初始化用于 Minecraft 词典的 submodules：

```shell
git submodule update --init
```

最后下载用到的语法模型：
```shell
wget https://github.com/amzxyz/RIME-LMDG/releases/download/v2n3/amz-v2n3m1-zh-hans.gram
```

2. 直接下载 zip
   - GitHub： 绿色的 Code > Download zip  |   🔗 [下载链接](https://github.com/Grassblock1/rime_config/archive/refs/heads/main.zip)
   - Codeberg： ··· > 下载 zip  |  🔗 [下载链接](https://codeberg.org/grassblock/rime/archive/master.zip)

将**rime-master（或者 rime/master）中的文件**解压到 rime 的配置目录即可。

之后下载 Minecraft 词库，解压放在 `gdict/rime-minecraft-dict` 中，🔗[下载链接](https://github.com/Kimiblock/rime-minecraft-dict/archive/refs/heads/master.zip)

最后下载语法模型（gram) 文件，放在配置根目录，🔗[下载链接](https://github.com/amzxyz/RIME-LMDG/releases/download/v2n3/amz-v2n3m1-zh-hans.gram)


3. 一键脚本

   对于 Fcitx5 rime 用户，可以使用以下的命令来安装和更新：

   ```shell
   git clone https://codeberg.org/grassblock/rime /tmp/gb_rime && cd /tmp/gb_rime && git submodule update --init && wget https://github.com/amzxyz/RIME-LMDG/releases/download/v2n3/amz-v2n3m1-zh-hans.gram && cp -r /tmp/gb_rime ~/.local/share/fcitx5/rime && rm -rf /tmp/gb_rime && echo done
   ```

   或者：

   （需要先行安装 `unzip` 和 `curl`）

   ```shell
   curl "https://codeberg.org/grassblock/rime/archive/master.zip" -o /tmp/rime.zip && unzip /tmp/rime.zip -d /tmp/rime0 && curl -L https://github.com/Kimiblock/rime-minecraft-dict/archive/refs/heads/master.zip -o /tmp/rime0/mc-dict.zip && unzip /tmp/rime0/mc-dict.zip -d /tmp/rime0/rime/gdict && mv /tmp/rime0/rime/gdict/rime-minecraft-dict-master /tmp/rime0/rime/gdict/rime-minecraft-dict && curl -L "https://github.com/amzxyz/RIME-LMDG/releases/download/v2n3/amz-v2n3m1-zh-hans.gram" -o "/tmp/gb_rime/amz-v2n3m1-zh-hans.gram" && cp /tmp/rime0/rime ~/.local/share/fcitx5/rime && rm -r /tmp/rime0 && rm /tmp/rime.zip && echo done
   ```

## 特别感谢

以下排名不分先后：

[rime-ice: Rime 配置：雾凇拼音 | 长期维护的简体词库](https://github.com/iDvel/rime-ice) | @idvel | [GPL-3.0](https://github.com/iDvel/rime-ice/blob/main/LICENSE) ： 配置方案的基底

[rime-minecraft-dict: Minecraft dict for Rime](https://github.com/Kimiblock/rime-minecraft-dict) | @kimiblock | [GPL-2.0](https://github.com/Kimiblock/rime-minecraft-dict/blob/master/LICENSE)： Minecraft 词库

[RIME-LMDG: Rime输入法语法模型全流程构建教程，全局带声调词库，最全带读音单字表词典](https://github.com/amzxyz/RIME-LMDG) | @amzxyz | [CC-BY-4.0](https://github.com/amzxyz/RIME-LMDG/blob/main/LICENSE)：语法模型

## 许可证

GNU Affero General Public License v3.0, refer to [LICENSE](./LICENSE) for more information.

	Copyright (C) 2024  GrassBlock
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Affero General Public License for more details.
	
	You should have received a copy of the GNU Affero General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
