#large folder for cache files
CACHEDIR=/srv/cache

#find directory this script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GITDIR=$DIR

docker pull nginx:alpine
docker stop nginx
docker rm nginx
docker run --name nginx -d --restart=always \
	-p 80:80/tcp -p 3128:3128/tcp \
	--volume $GITDIR/etc/nginx.conf:/etc/nginx/nginx.conf \
	--volume $GITDIR/etc/conf.d:/etc/nginx/conf.d \
	--volume $GITDIR/block.ls:/var/www/block.ls \
	--volume $CACHEDIR:/data/ \
	nginx:alpine &&
echo Run the following command to watch logs:
echo "  docker logs -f nginx"
