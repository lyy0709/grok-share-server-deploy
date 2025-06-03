#!/bin/bash
set -e

## 克隆仓库到本地
echo "clone repository..."
git clone https://github.com/lyy0709/grok-share-server-deploy.git grok-share

## 进入目录
cd grok-share

## 生成随机JWT secret
echo "生成随机JWT secret..."
JWT_SECRET=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-32)
echo "生成的JWT secret: $JWT_SECRET"

## 替换config.yaml中的JWT secret
echo "更新配置文件中的JWT secret..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/secret: \"grok-share-server\"/secret: \"$JWT_SECRET\"/" config.yaml
else
    # Linux
    sed -i "s/secret: \"grok-share-server\"/secret: \"$JWT_SECRET\"/" config.yaml
fi

cd grok-share

docker compose pull
docker compose up -d --remove-orphans

## 提示信息
echo "服务启动成功，请访问 http://localhost:8300"
echo "管理员后台地址 http://localhost:8300/lyy0709"
echo "管理员账号: admin"
echo "管理员密码: 123456"
echo "请及时修改管理员密码"
