# grok-share-server-deploy
grok-share-server的部署

## 部署条件
- 自备一台能连grok的服务器，2c2g最好，无盾最好
- 有代理可自备代理，如果有代理则可无需服务器直连grok
- 一些grok账号以及ssotoken
- 本项目不依赖网关
- 如果遇到提示授权问题请及时拉更新

## 更新日志
- 20250812 完全适配xy网关，删除部分官方模型
- 20250710 增加 grok4 模型
- 20250704 修复文件上传问题
- 20250622 修复报错问题
- 20250529 修复grok图表显示
- 20250521 修复一个小bug，抛弃origin参数
- 20250504 支持pdf生成
- 20250427 删除grok2模型
- 20250425 修复了因为修改邮箱出现的小bug
- 20250416 修复新增的预览代码功能，以及工作区功能，未作隔离
- 20250330 修复了一些小问题
- 20250328 增加prompt的隔离，（防止恶意设置prompt，不过因为是自动选车，会出现无法正常在设置里加载写了什么，但可以正常修改和取消，取消需要点两次）
- 20250321 增加对对话接口报错的弹窗，补充开放灰度功能
- 20250315 增加部分接口，修复聊天记录丢失的情况，增加对xy网关的支持（可选）
- 20250309 屏蔽一些接口，增加对失效账号的检查
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

## 限速服务以及对话审核

参考项目[https://github.com/lyy0709/auditlimit](https://github.com/lyy0709/auditlimit)

## oauth第三方对接

配置环境变量

```yml
OAUTH_URL: https://xxxxx.xxx.com/oauth
```

当该值被配置后，用户登陆时将向该地址 POST 以下数据

```
userToken: 用户Token
```

允许用户登陆接口应返回 json 数据

```json
{
  "code": 1,
  "msg": "登陆成功时的提示信息",
  "isPro": true,
  "expireTime": "2023-05-09 12:00:00",
}
```

其中 code 为 1 时表示允许登陆，其他值表示不允许登陆

msg 为登陆成功/失败时的提示信息

isPro 为用户是否为pro用户

expireTime为用户剩余时间

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
