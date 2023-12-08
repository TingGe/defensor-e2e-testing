#  <img src="https://raw.githubusercontent.com/TingGe/defensor-e2e-testing/master/docs/logo.png" width="60px"> Defensor E2E Testing

一套基于 “UI Recorder + F2eTest + 持续集成引擎 + 国际化报告服务 + Hubot + Docker” 等技术二次开发的、可自动化运营的、用于 E2E 级功能测试的、自动化测试解决方案。

## 目标

```
尽管诸多质量服务彼此之间风格殊异，却秉承着共同的坚定信念，那就是捍卫研发品质的崇高理想。
合体成员理念上的共识，令守护神 Defensor 得以成为效能最高的合体战士。
Defensor 一丝不苟的履行着自己的责任，守护着林林总总的产品体系。
—— Defensor 宣言
```

作为测试矩阵中的“ E2E 级功能测试”，从全局视角提升测试效益、实时保障系统质量。

## 准备

### 安装前置依赖

1. 安装 Nodejs : <https://nodejs.org/>

2. 配置 Nodejs 权限

   > `sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}`

3. 安装 Chrome : <https://www.google.com/chrome/>

4. 安装 UI Recorder 及 mocha : `npm install uirecorder mocha -g`

### 初始化 uitest 仓库 

```bash
# 下载测试代码仓库
git clone https://github.com/TingGe/defensor-e2e-testing.git

# 安装仓库依赖
cd ./defensor-e2e-testing
npm install
```

### 配置 host

```bash
sudo vim /etc/hosts

# 添加 Defensor 配置
127.0.0.1 hub
```

## 本机录制和回放

### 启动 Server

仅需在最初使用时安装，之后无需重复安装驱动

```bash
npm run installdriver
```

启动 Server

```bash
npm start
```

### 录制脚本

以 “test.spec.js” 为例，实际场景中需将 `test` 替换为有意义的脚本名

```bash
uirecorder specs/test.spec.js
```

### 回放测试脚本

```sh
sh run.sh specs/test.spec.js
# Windows 中执行 run.bat specs/test.spec.js
```

## 部署环境使用

### 流程

1. 安装 Docker 软件和 Defensor E2E Testing 的 Docker 镜像，并启动 Docker

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

### 技巧

调试模式中，可通过 VNC viewer 方式查看 Chrome 容器中运行情况。

1. 以 Mac 为例，右击 Dock 工具栏中的 Finder 图标，选择“连接服务器……”；
2. “服务器地址：” 中填写 `vnc://127.0.0.1:5900`，并点击连接；
3. “密码：” 中填入默认密码 `secret`，再点击连接即可进入运行的  `node-chrome-debug` 容器中。

### Kubernetes 适配

使用 [Kompose](https://github.com/kubernetes/kompose) 将 docker-compose.yml 配置转换为 Kubernetes 配置。

## 最佳实践

1. [黑盒测试用例设计方法](https://www.cnblogs.com/Jackc/archive/2009/02/24/1397433.html)
2. [自动化最佳实践](https://github.com/TingGe/defensor-e2e-testing/blob/master/docs/best-practices.md)

## 应用场景

### 1. 研发环境，持续测试服务

解决问题：减少重复工作，提升测试效能、保障产品质量。

服务对象：（前端、后端和算法等）研发同学、业务测试同学、国际化测试同学和部分产品同学。

技术方案： “UIRecorder + F2eTest + 持续集成引擎 + 国际化报告服务 + Hubot + 大盘的Chrome扩展” 技术方案。

### 2. 私有部署环境，自动化验收工具

解决问题： 提升乙方交付前验收测试效率。

服务对象：交付现场的产品同学、负责交付的研发同学等。

技术方案：VPN 远程支持和 “UI Recorder + Docker/Kubernetes + 报告生成” 两种技术方案。

### 3. DevOps，成为CI/CD中标准环节

解决问题： 持续保障不同环境和版本的功能质量。

服务对象：研发同学、测试同学等。

技术方案：同“2. 私有部署环境，自动化验收工具”。

### 4. 线上环境，核心功能巡检服务

解决问题：及时发现并反馈线上问题，降低故障影响范围

服务对象：运维同学、运营同学、部分（前端、后端和算法等）研发同学和部分产品同学。

技术方案： 同“1. 研发环境，持续测试服务”。

## 参考

- [基于Docker和Kubernetes的最佳架构实践](https://blog.csdn.net/AlbenXie/article/details/80419885)

- [GitLab + Drone 构建 CI&CD 环境](https://laravel-china.org/articles/17207)
- [SpringBoot 集成 React 一体化打包部署](https://www.wanaright.com/2017/03/25/springboot-react-dva/)
- [Macaca](https://www.anquanke.com/post/id/152729)

## 许可 License

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FTingGe%2Fdefensor-e2e-testing.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FTingGe%2Fdefensor-e2e-testing?ref=badge_large)
