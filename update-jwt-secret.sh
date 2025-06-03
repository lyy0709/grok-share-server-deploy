#!/bin/bash
set -e

echo "=== JWT Secret 更新脚本 ==="
echo "此脚本将生成新的随机JWT secret并重启服务"
echo ""

# 检查config.yaml是否存在
if [ ! -f "config.yaml" ]; then
    echo "错误: config.yaml 文件不存在"
    echo "请确保在项目根目录下运行此脚本"
    exit 1
fi

# 检查docker-compose.yml是否存在
if [ ! -f "docker-compose.yml" ]; then
    echo "错误: docker-compose.yml 文件不存在"
    echo "请确保在项目根目录下运行此脚本"
    exit 1
fi

# 显示当前的JWT secret
echo "当前的JWT secret:"
grep "secret:" config.yaml | head -1

echo ""
read -p "是否继续更新JWT secret? (y/N): " confirm
if [[ $confirm != [yY] && $confirm != [yY][eE][sS] ]]; then
    echo "操作已取消"
    exit 0
fi

echo ""
echo "生成新的随机JWT secret..."

# 生成随机JWT secret
JWT_SECRET=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-32)
echo "新的JWT secret: $JWT_SECRET"

# 备份原配置文件
echo "备份原配置文件..."
cp config.yaml config.yaml.backup.$(date +%Y%m%d_%H%M%S)

# 替换config.yaml中的JWT secret
echo "更新配置文件中的JWT secret..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/secret: \"[^\"]*\"/secret: \"$JWT_SECRET\"/" config.yaml
else
    # Linux
    sed -i "s/secret: \"[^\"]*\"/secret: \"$JWT_SECRET\"/" config.yaml
fi

# 验证替换是否成功
echo ""
echo "新的JWT secret配置:"
grep "secret:" config.yaml | head -1

echo ""
echo "停止服务..."
docker compose down

echo "启动服务..."
docker compose up -d

echo ""
echo "=== 更新完成 ==="
echo "JWT Secret已更新为: $JWT_SECRET"
echo "服务已重启，新的JWT secret已生效"
echo "配置文件已备份，如需回滚请查看 config.yaml.backup.* 文件"
