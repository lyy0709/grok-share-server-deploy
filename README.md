# grok-share-server-deploy
grok-share-server的部署

## 部署条件
- 自备一台能连grok的服务器，2c2g最好，无盾最好
- 有代理可自备代理，如果有代理则可无需服务器直连grok
- 一些grok账号以及ssotoken
- 本项目不依赖网关


## 更新日志
- 20250304 修复本地oauth无法使用pro账号的问题，增加备注显示错误提示
- 20250303 修复首次打开样式等打开失败导致显示不正常，修复了上传文件后打开页面失败，增加list.js，请自行配置
- 20250302 添加了自动获取账号的剩余次数功能，后台页面新增了剩余次数的显示，修改oauth功能，增加isPro参数，修复历史记录显示
- 20250301 后台更新自动获取对应的号各个模型的用量情况，每次新建对话自动启用最多次可用模型的账号

## 快速部署 
**务必**前往`docker-compose.yml`文件修改相关配置，向本人询问已在部署中说明过的问题，将收费20元/问题

后台路由为 `/lyy0709`

```bash
curl -sSfL https://raw.githubusercontent.com/lyy0709/grok-share-server-deploy/refs/heads/main/quick-install.sh -o quick-install.sh
chmod +x quick-install.sh
./quick-install.sh
```

更新服务

```bash
cd grok-share
chmod +x deploy.sh
./deploy.sh
```

## 相关项目

### 感谢以下项目

- https://github.com/xyhelper/chatgpt-share-server-deploy
- https://github.com/xyhelper/chatgpt-mirror-server-deploy

## 联系方式
![](https://raw.githubusercontent.com/lyy0709/lyy0709/refs/heads/main/img/IMG_8139.jpeg)

## 免责声明

- 本工具仅供学习和技术研究使用，不得用于任何商业或非法行为，否则后果自负。
- 本工具的作者不对本工具的安全性、完整性、可靠性、有效性、正确性或适用性做任何明示或暗示的保证，也不对本工具的使用或滥用造成的任何直接或间接的损失、责任、索赔、要求或诉讼承担任何责任。
- 本工具的作者保留随时修改、更新、删除或终止本工具的权利，无需事先通知或承担任何义务。
- 本工具的使用者应遵守相关法律法规，尊重微信的版权和隐私，不得侵犯微信或其他第三方的合法权益，不得从事任何违法或不道德的行为。
- 本工具的使用者在下载、安装、运行或使用本工具时，即表示已阅读并同意本免责声明。如有异议，请立即停止使用本工具，并删除所有相关文件。
