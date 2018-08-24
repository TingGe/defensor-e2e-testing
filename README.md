# Defensor E2E Testing 使用说明

一套基于 “UIRecorder + Docker” 二次开发的、可自动化运营的、 端到端级别的功能回归的自动化测试解决方案。

## 准备

安装、录制和回放，请参考 [UI Recorder](https://github.com/alibaba/uirecorder)。

## 使用

1. 安装 Defensor E2E Testing 的 Docker 镜像

2. 启动容器

   命令行方式：

   ```bash
   # 生产模式
   docker-compose -f docker-compose.yml up -d --build
   # 调试模式
   docker-compose -f docker-compose.debug.yml up -d --build
   ```

   VS Code 插件方式：
   https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker

3. 实时查看 denfensor-testing 容器日志：

   命令行方式：

   ```bash
   docker logs -f denfensor-testing
   # 实时查看 denfensor-testing 容器最后10行日志
   docker logs -f -t --tail 10 denfensor-testing
   ```

   Kitematic 软件方式：
   https://kitematic.com/

4. 关闭和清除容器

   命令行方式：

   ```bash
   docker-compose down
   docker system prune --volumes -f
   ```

   VS Code 插件方式：
   https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker

5. 在用户根目录的 reports 目录可查看生成的测试报告

   ```bash
   open ~/reports/index.html
   ```

## 技巧

调试模式中，可通过 VNC viewer 方式查看 Chrome 容器中运行情况。

1. 以 Mac 为例，右击 Dock 工具栏中的 Finder 的图标，选择“连接服务器……”；
2. “服务器地址：” 中填写 `vnc://127.0.0.1:5900`，并点击连接；
3. “密码：” 中填入默认密码 `secret`，再点击连接即可进入运行的  `node-chrome-debug` 容器中。

## 许可

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FTingGe%2Fdefensor-e2e-testing.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FTingGe%2Fdefensor-e2e-testing?ref=badge_large)