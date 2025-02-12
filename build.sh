#!/bin/bash

set -e
PACKAGE_NAME="docker-squash"

# 获取最新版本号
VERSION=$(curl -s https://pypi.org/pypi/$PACKAGE_NAME/json | jq -r '.info.version')

# 检查是否成功获取版本号
if [ -z "$VERSION" ]; then
    echo "Failed to fetch version for package: $PACKAGE_NAME"
    exit 1
else
    echo "The latest version of $PACKAGE_NAME is $VERSION"
fi
# 构建镜像
echo "Building Docker image..."
docker build -t "masx200/docker-squash:$VERSION" .
docker images
# 保存镜像
echo "Saving Docker images..."
docker save "masx200/docker-squash:$VERSION" | gzip > "docker-squash-$VERSION.image.tgz"


# 清理容器和镜像
docker builder prune -f -a

echo "Build completed successfully!"